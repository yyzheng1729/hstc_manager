package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.pojo.Pag;
import com.pojo.TAdmin;
import com.service.AdminService;
import com.utils.IDUtils;
import com.utils.MD5;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	/**
	 * 查询所有管理员的信息
	 * @param pagenum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/display_admin",produces="application/json;charset=utf-8")
	@ResponseBody
	public String display_admin(int pagenum) throws IOException{
		PageHelper.startPage(pagenum,5);
		List<TAdmin> list = adminService.display_admin();
		PageInfo page = new PageInfo(list);
		int totalPage = page.getPages();//总页数
		long totalData = page.getTotal();//总数据
		Pag pag = new Pag();
		pag.setTotalPage(totalPage);
		pag.setTotalData(totalData);
		pag.settAdmin(list);
		Gson gson = new Gson();
		return gson.toJson(pag);
	}
	
	/**
	 * 根据管理员编号删除管理员信息
	 * @param adminId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/deleteByAdminId")
	@ResponseBody
	public String deleteByAdminId(String adminId) throws IOException{
		adminService.deleteByAdminId(adminId);
		return "true";
	}
	
	/**
	 * 添加普通管理员
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/admin_add")
	@ResponseBody
	public String admin_add(HttpServletRequest request) throws IOException{
		String adminId = IDUtils.getID().toString();/*实体类自动生成 id*/
		String adminName = request.getParameter("adminName");
		String adminAccount = request.getParameter("adminAccount");
		String adminPassword = request.getParameter("adminPassword");
		//MD5加密
		adminPassword = MD5.encrypt(adminPassword, "zwd");
		String adminIdentity = request.getParameter("adminIdentity");
		
		TAdmin tAdmin = new TAdmin();
		tAdmin.setAdminId(adminId);
		tAdmin.setAdminAccount(adminAccount);
		tAdmin.setAdminIdentity(adminIdentity);
		tAdmin.setAdminName(adminName);
		tAdmin.setAdminPassword(adminPassword);
		
		adminService.admin_add(tAdmin);
		
		return "true";
	}
	/**
	 * 修改当前管理员密码
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/admin_edit_password")
	@ResponseBody
	public String admin_edit_password(HttpServletRequest request,HttpSession session) throws IOException{
		
		String adminAccount = (String)session.getAttribute("adminAccount");
		String adminPassword = request.getParameter("adminPassword");
		//MD5加密
		adminPassword = MD5.encrypt(adminPassword, "zwd");
		
		TAdmin tAdmin = new TAdmin();
		tAdmin.setAdminAccount(adminAccount);
		tAdmin.setAdminPassword(adminPassword);
		
		adminService.admin_edit_password(tAdmin);
		
		return "true";
	}
}	
