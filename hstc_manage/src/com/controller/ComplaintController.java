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
import com.pojo.TComplaint;
import com.service.ComplaintService;

@Controller
public class ComplaintController {
	@Autowired 
	ComplaintService complaintService;
	
	/**
	 * 查询所有的投诉信息
	 * @param pagenum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/display_complaint",produces="application/json;charset=utf-8")
	@ResponseBody
	public String display_complaint(int pagenum) throws IOException{
		PageHelper.startPage(pagenum,5);
		List<TComplaint> list = complaintService.display_complaint();
		PageInfo page = new PageInfo(list);
		int totalPage = page.getPages();//总页数
		long totalData = page.getTotal();//总数据
		Pag pag = new Pag();
		pag.setTotalPage(totalPage);
		pag.setTotalData(totalData);
		pag.settComplaint(list);
		Gson gson = new Gson();
		return gson.toJson(pag);
	}
	
	/**
	 * 根据投诉记录的编号删除记录
	 * @param complaintId
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/deleteByComplaintId")
	@ResponseBody                     
	public String deleteByComplaintId(String complaintId)throws IOException{
		System.out.println(complaintId);
		complaintService.deleteByComplaintId(complaintId);
		return "true";
	}
}
