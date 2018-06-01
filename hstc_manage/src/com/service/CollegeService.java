package com.service;

import java.util.List;

import com.pojo.TCollege;

public interface CollegeService {
	/**
	 * 获取学院分类列表
	 * @return
	 */
	public List<TCollege> college();
	/**
	 * 根据id查询对应学院信息
	 * @param id
	 * @return
	 */
	public TCollege collegeName(String collegeId);

}
