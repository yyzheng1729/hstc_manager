package com.service;

import java.util.List;

import com.pojo.TAdmin;

public interface AdminService {
	/**
	 * 查询所有管理员信息
	 */
	public List<TAdmin> display_admin(); 
}
