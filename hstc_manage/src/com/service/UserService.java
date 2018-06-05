package com.service;

import java.util.List;

import com.pojo.TUser;

public interface UserService {
	/**
	 * 查询用户信息
	 * @return
	 */
	public List<TUser> display_user();
	/**
	 * 根据用户 openid 删除用户信息
	 * @param openid
	 */
	public void deleteByOpenid(String openid);
}
