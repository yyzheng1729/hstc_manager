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
import com.pojo.TComment;
import com.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;
	
	/**
	 * 查询所有的评论信息（分页）
	 * @param pagenum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/display_comment",produces="application/json;charset=utf-8")
	@ResponseBody
	public String display_comment(int pagenum) throws IOException{
		PageHelper.startPage(pagenum,5);
		List<TComment> list = commentService.display_comment();
		PageInfo page = new PageInfo(list);
		int totalPage = page.getPages();//总页数
		long totalData = page.getTotal();//总数据
		
		Pag pag = new Pag();
		pag.setTotalPage(totalPage);
		pag.setTotalData(totalData);
		pag.settComment(list);
		Gson gson = new Gson();
		return gson.toJson(pag);
	}
	
	@RequestMapping(value="/deleteByCommentId")
	@ResponseBody
	public String deleteByCommentId(String commentId)throws IOException{
		commentService.deleteByCommentId(commentId);
		return "true";
	}
}
