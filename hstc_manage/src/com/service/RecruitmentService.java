package com.service;

import java.util.List;

import com.pojo.TRecruitment;

public interface RecruitmentService {
	/**
	 * 从数据库获取所有的招聘信息
	 * @return
	 */
	public List<TRecruitment> displayAll();
	/**
	 * 增加招聘信息
	 */
	public void add(TRecruitment tRecruitment);
	/**
	 * 根据id删除对应信息
	 * @param id
	 */
	public void deleteById(String id);
	/**
	 * 根据id查询对应信息
	 * @param id
	 * @return
	 */
	public TRecruitment queryById(String id);
	/**
	 * 更新招聘信息
	 * @param tRecruitment
	 */
	public void edit(TRecruitment tRecruitment);
	
	
	/*public List<TRecruitment> test();*/
}
