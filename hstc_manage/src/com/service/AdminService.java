package com.service;

import java.util.List;

import com.pojo.TAdmin;

public interface AdminService {
	/**
	 * 查询所有管理员信息
	 */
	public List<TAdmin> display_admin(); 
	/**
	 * 根据管理员 id 删除对用的管理员
	 * @param adminId
	 */
	public void deleteByAdminId(String adminId);
	/**
	 * 添加普通管理员
	 * @param tAdmin
	 */
	public void admin_add(TAdmin tAdmin);
	/**
	 * 修改当前管理员密码
	 * @param tAdmin
	 */
	public void admin_edit_password(TAdmin tAdmin);
}
