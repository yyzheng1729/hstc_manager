package com.service;

import com.pojo.TAdmin;

public interface LoginService {
	/**
	 * 验证用户
	 * @param tAdmin
	 * @return
	 */
	public TAdmin loginValidate(TAdmin tAdmin);
}
