package com.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pojo.Cookies;
import com.pojo.TAdmin;
import com.service.LoginService;
import com.utils.MD5;
import com.utils.RandomValidateCode;

@Controller
public class LoginController {
	@Autowired 
	LoginService loginService;
	
	/**
	 * 获取生成验证码显示到 UI 界面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/checkCode")
	public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		//设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        
        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	
	/**
	 * 管理员登录验证
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/loginValidate")
	public String loginValidate(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String loginAccount = request.getParameter("loginAccount");//登录账号
		String loginPassword = request.getParameter("loginPassword");//登录密码
		//添加 Cookie
		addCookie(loginAccount,loginPassword,response,request);
		//MD5加密
		loginPassword = MD5.encrypt(loginPassword, "zwd");
		String inputCode = request.getParameter("inputCode");//用户输入的验证码
		if(loginAccount == null || loginPassword == null || inputCode == null) {
			return "login";
		}
		String code = (String)request.getSession().getAttribute("randomcode_key");
		TAdmin tAdmin = new TAdmin();
		if(inputCode.equalsIgnoreCase(code)){
			tAdmin.setAdminAccount(loginAccount);
			tAdmin.setAdminPassword(loginPassword);
			TAdmin tadmin = loginService.loginValidate(tAdmin);
			if( tadmin == null ){
				return "fail";
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("adminName", tadmin.getAdminName());
				session.setAttribute("adminIdentity", tadmin.getAdminIdentity());
				session.setAttribute("adminAccount", tadmin.getAdminAccount());		
				return "index";
			}
		}else{
			return "fail";
		}	
	}
	
	private void addCookie(String loginAccount,String loginPassword, HttpServletResponse response,HttpServletRequest request)
			throws UnsupportedEncodingException{
		if(!loginAccount.equals("") && !loginPassword.equals("")){
			//创建  Cookie
			Cookie loginAccountCookie = new Cookie("loginAccount",loginAccount);
			Cookie loginPasswordCookie = new Cookie("loginPassword",loginPassword);
			//设置Cookie的父路经
			loginAccountCookie.setPath(request.getContextPath()+"/");
			loginPasswordCookie.setPath(request.getContextPath()+"/");
			//获取是否保存Cookie（例如：复选框的值）
			String rememberMe = request.getParameter("rememberMe");
			if( rememberMe==null || rememberMe.equals(false) ){
				//不保存Cookie
				loginAccountCookie.setMaxAge(0);
				loginPasswordCookie.setMaxAge(0);
			}else{
				//保存Cookie的时间长度，单位为秒
				loginAccountCookie.setMaxAge(7*24*60*60);
				loginPasswordCookie.setMaxAge(7*24*60*60);
			}
			//加入Cookie到响应头
			response.addCookie(loginAccountCookie);
			response.addCookie(loginPasswordCookie);
		}
	}
	
	/**
	 * 获取 Cookie中的信息
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/getCookie")
	@ResponseBody
	public String getCookie(HttpServletRequest request)throws IOException{
		String loginAccount = "";
		String loginPassword = "";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0){
			//遍历Cookie
			for(int i=0;i<cookies.length;i++){
				Cookie cookie = cookies[i];
				//此处类似与Map有
				if("loginAccount".equals(cookie.getName())){
					loginAccount = cookie.getValue();
				}
				if("loginPassword".equals(cookie.getName())){
					loginPassword = cookie.getValue();
				}
			}
		}
		//自己定义的javabean Cookies
		Cookies co = new Cookies();
		co.setLoginAccount(loginAccount);
		co.setLoginPassword(loginPassword);
		Gson gson = new Gson();
		return gson.toJson(co);
	}

}
