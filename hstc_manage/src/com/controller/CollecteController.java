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
import com.pojo.TCollect;
import com.service.CollecteService;

@Controller
public class CollecteController {
	@Autowired
	CollecteService collecteService;
	
	/**
	 * 查询所有的收藏信息（分页）
	 * @param pagenum
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="display_collection",produces="application/json;charset=utf-8")
	@ResponseBody
	public String display_collection(int pagenum)throws IOException{
		PageHelper.startPage(pagenum,5);
		List<TCollect> list = collecteService.display_collection();
		PageInfo page = new PageInfo(list);
		int totalPage = page.getPages();//总页数
		long totalData = page.getTotal();//总数据
		Pag pag = new Pag();
		pag.setTotalPage(totalPage);
		pag.setTotalData(totalData);
		pag.settCollect(list);
		Gson gson = new Gson();
		return gson.toJson(pag);	
	}
	
	@RequestMapping(value="deleteByCollectId")
	@ResponseBody
	public String deleteByCollectId(String collectId)throws IOException{
		collecteService.deleteByCollectId(collectId);
		return "true";
	}
}
