package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TCommentMapper;
import com.pojo.TComment;
import com.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	TCommentMapper tCommentMapper;
	
	public List<TComment> display_comment(){
		return tCommentMapper.selectByExample(null);
	}
}
