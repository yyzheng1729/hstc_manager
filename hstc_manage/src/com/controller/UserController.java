package com.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.pojo.Pag;
import com.pojo.TUser;
import com.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	/**
	 * 显示所有用户的信息
	 * @param pagenum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/display_user",produces="application/json;charset=utf-8")
	@ResponseBody
	public String display_user(int pagenum)throws IOException{
		PageHelper.startPage(pagenum,5);
		List<TUser> list = userService.display_user();
		
		PageInfo page = new PageInfo(list);
		int totalPage = page.getPages();//总页数
		long totalData = page.getTotal();//总数据
		
		Pag pag = new Pag();
		pag.setTotalPage(totalPage);
		pag.setTotalData(totalData);
		pag.settUser(list);
		Gson gson = new Gson();
		return gson.toJson(pag);
	}
	
	@RequestMapping(value="/deleteByOpenid")
	@ResponseBody
	public String deleteByOpenid(String openid) throws IOException{
		userService.deleteByOpenid(openid);
		return "true";
	}
}
