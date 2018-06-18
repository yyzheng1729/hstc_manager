package com.service;

import java.util.List;

import com.pojo.TComplaint;

public interface ComplaintService {
	
	/**
	 * 查询所有的投诉记录
	 * @return
	 */
	public List<TComplaint> display_complaint();
	
	/**
	 * 根据投诉记录的编号删除记录
	 * @param complaintId
	 */
	public void deleteByComplaintId(String complaintId);
}
