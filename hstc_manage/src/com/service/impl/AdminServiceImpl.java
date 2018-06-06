package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TAdminMapper;
import com.pojo.TAdmin;
import com.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	TAdminMapper tAdminMapper;
	
	public List<TAdmin> display_admin(){
		return tAdminMapper.selectByExample(null);
	}
}
