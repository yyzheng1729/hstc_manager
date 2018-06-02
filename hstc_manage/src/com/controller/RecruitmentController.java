package com.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.pojo.Pag;
import com.pojo.TCollege;
import com.pojo.TRecruitment;
import com.pojo.TRecruitmentCompletion;
import com.service.CollegeService;
import com.service.RecruitmentService;
import com.utils.IDUtils;

@Controller
public class RecruitmentController {
	@Autowired
	RecruitmentService recruitmentService;
	@Autowired
	CollegeService collegeService;
	/**
	 * 获取招聘信息列表（分页）
	 * @param pagenum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/displayAll", produces="application/json;charset=utf-8")
	@ResponseBody
	public String display(int pagenum) throws IOException{
		PageHelper.startPage(pagenum,5);
		List<TRecruitment> list = recruitmentService.displayAll();

		PageInfo page = new PageInfo(list);
		int totalPage = page.getPages();//总页数
		long totalData = page.getTotal();//总数据
		
		Pag pag = new Pag();
		pag.setTotalPage(totalPage);
		pag.setTotalData(totalData);
		pag.settRecruitment(list);
		Gson gson = new Gson();
		return gson.toJson(pag);
	}
	/**
	 * 获取学院分类信息
	 * @param rquest
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/college",produces="application/json;charset=utf-8")
	@ResponseBody
	public String college(HttpServletRequest rquest) throws IOException{
		List<TCollege> list = collegeService.college();
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	/**
	 * 添加招聘信息
	 * @param request1
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/add")
	@ResponseBody
	public String add(HttpServletRequest request1, HttpSession session) throws IOException {
		/*前端 UI 的 form 表单里面有用到图片上传的时候，需要在这里对 request 作以下处理*/
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)request1;
		String id = IDUtils.getID().toString();/*实体类自动生成 id*/
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String collegeId = request.getParameter("college");
		String type = request.getParameter("type");
		String details = request.getParameter("details");
		String litimg = (String)session.getAttribute("imgName");
		String time = new Date().toString();
		
		TRecruitment tRecruitment = new TRecruitment();
		tRecruitment.setId(id);
		tRecruitment.setTitle(title);
		tRecruitment.setAuthor(author);
		tRecruitment.setCollegeId(collegeId);
		tRecruitment.setDetails(details);
		tRecruitment.setLitimg(litimg);
		tRecruitment.setPublishedTime(time);
		tRecruitment.setType(type);
		
		recruitmentService.add(tRecruitment);
		
		return "true";
	}
	
	/**
	 * 删除当前行的信息
	 * @param request
	 * @param id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="deleteById")
	@ResponseBody
	public String deleteById(HttpServletRequest request, String id) throws IOException{
		recruitmentService.deleteById(id);
		return "true";
	}
	
	/**
	 * 根据 id 值查找当前招聘信息的详情
	 * @param request
	 * @param id
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="queryById",produces="application/json;charset=utf-8")
	@ResponseBody
	public String queryById(HttpServletRequest request, String id) throws IOException{
		TRecruitment tRecruitment = recruitmentService.queryById(id);
		TCollege tCollege = collegeService.collegeName(tRecruitment.getCollegeId());
		TRecruitmentCompletion tRecruitmentCompletion = new TRecruitmentCompletion();
		tRecruitmentCompletion.settRecruitment(tRecruitment);
		tRecruitmentCompletion.setCollegeName(tCollege.getCollegeName());
		Gson gson = new Gson();
		return gson.toJson(tRecruitmentCompletion);
	}
	
	@RequestMapping(value="/edit")
	@ResponseBody
	public String edit(HttpServletRequest request) throws IOException {
		System.out.println("====================");
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String collegeId = request.getParameter("college");
		String type = request.getParameter("type");
		String details = request.getParameter("details");
		System.out.println(id);
		System.out.println(title);
		System.out.println(author);
		System.out.println(collegeId);
		System.out.println(type);
		System.out.println(details);
		
		TRecruitment tRecruitment = new TRecruitment();
		tRecruitment.setId(id);
		tRecruitment.setTitle(title);
		tRecruitment.setAuthor(author);
		tRecruitment.setCollegeId(collegeId);
		tRecruitment.setDetails(details);
		tRecruitment.setType(type);
		
		recruitmentService.edit(tRecruitment);
		
		return "true";
	}
	
/*	@RequestMapping(value="/test")
	@ResponseBody
	public String test() throws IOException{
		List<TRecruitment> list = recruitmentService.test();
		Gson gson = new Gson();
		return gson.toJson(list);
	}*/
}
