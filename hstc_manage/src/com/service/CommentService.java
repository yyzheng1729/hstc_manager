package com.service;

import java.util.List;

import com.pojo.TComment;

public interface CommentService {
	/**
	 * 查询所有的评论信息
	 * @return
	 */
	public List<TComment> display_comment();
}
