package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TComplaintMapper;
import com.pojo.TComplaint;
import com.service.ComplaintService;

@Service
public class ComplaintServiceImpl implements ComplaintService {
	@Autowired
	TComplaintMapper tComplaintMapper;
	
	public List<TComplaint> display_complaint(){
		return tComplaintMapper.TComplaintResultMap();
	}
	
	public void deleteByComplaintId(String complaintId){
		tComplaintMapper.deleteByPrimaryKey(complaintId);
	}
}
