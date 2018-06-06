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
import com.pojo.TAdmin;
import com.service.AdminService;

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
}	
