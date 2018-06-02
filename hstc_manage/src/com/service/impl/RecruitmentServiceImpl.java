package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TRecruitmentMapper;
import com.pojo.TRecruitment;
import com.service.RecruitmentService;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {
	
	@Autowired
	TRecruitmentMapper tRecruitmentMapper;
	
	public List<TRecruitment> displayAll(){
		return tRecruitmentMapper.selectByExampleWithBLOBs(null);
	}
	
	public void add(TRecruitment tRecruitment){
		tRecruitmentMapper.insertSelective(tRecruitment);
	}
	
	public void deleteById(String id){
		tRecruitmentMapper.deleteByPrimaryKey(id);
	}
	
	public TRecruitment queryById(String id){
		return tRecruitmentMapper.selectByPrimaryKey(id);
	}
	
	public void edit(TRecruitment tRecruitment){
		tRecruitmentMapper.updateByPrimaryKeySelective(tRecruitment);
	}
	
/*	public List<TRecruitment> test(){
		return tRecruitmentMapper.query_TR_TC_ResultMap();
	}*/
}
