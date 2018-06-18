package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TAdminMapper;
import com.pojo.TAdmin;
import com.pojo.TAdminExample;
import com.pojo.TAdminExample.Criteria;
import com.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	TAdminMapper tAdminMapper;
	
	public TAdmin loginValidate(TAdmin tAdmin){
		TAdminExample example = new TAdminExample();
		Criteria criteria = example.createCriteria();
		criteria.andAdminAccountEqualTo(tAdmin.getAdminAccount());
		criteria.andAdminPasswordEqualTo(tAdmin.getAdminPassword());
		List<TAdmin> list = tAdminMapper.selectByExample(example);
		TAdmin tadmin = null;
		if(list != null && !list.isEmpty()) {
			tadmin = list.get(0);
		}
		return tadmin;
	}
}
