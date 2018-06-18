package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TAdminMapper;
import com.pojo.TAdmin;
import com.pojo.TAdminExample;
import com.pojo.TAdminExample.Criteria;
import com.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	TAdminMapper tAdminMapper;
	
	public List<TAdmin> display_admin(){
		return tAdminMapper.selectByExample(null);
	}
	
	public void deleteByAdminId(String adminId){
		tAdminMapper.deleteByPrimaryKey(adminId);
	}
	
	public void admin_add(TAdmin tAdmin){
		tAdminMapper.insert(tAdmin);
	}
	
	public void admin_edit_password(TAdmin tAdmin){
		TAdminExample example = new TAdminExample();
		Criteria criteria = example.createCriteria();
		criteria.andAdminAccountEqualTo(tAdmin.getAdminAccount());
//		tAdminMapper.updateByExample(tAdmin, example);
		tAdminMapper.updateByExampleSelective(tAdmin, example);
//		tAdminMapper.updateByPrimaryKeySelective(tAdmin);
	}
}
