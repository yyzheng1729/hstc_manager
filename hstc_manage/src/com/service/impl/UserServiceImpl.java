package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TUserMapper;
import com.pojo.TUser;
import com.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	TUserMapper tUserMapper;
	
	public List<TUser> display_user(){
		return tUserMapper.selectByExample(null);
	}
	
	public void deleteByOpenid(String openid){
		tUserMapper.deleteByPrimaryKey(openid);
	}
}
