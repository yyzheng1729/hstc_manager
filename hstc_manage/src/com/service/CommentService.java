package com.service;

import java.util.List;

import com.pojo.TComment;

public interface CommentService {
	/**
	 * 查询所有的评论信息
	 * @return
	 */
	public List<TComment> display_comment();
	/**
	 * 根据评论编号删除评论
	 * @param commentId
	 */
	public void deleteByCommentId(String commentId);
	
}
