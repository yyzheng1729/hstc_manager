package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mapper.TCollectMapper;
import com.pojo.TCollect;
import com.service.CollecteService;

@Service
public class CollecteServiceImpl implements CollecteService {
	@Autowired
	TCollectMapper tCollectMapper;
	
	public List<TCollect> display_collection(){
		return tCollectMapper.selectByExample(null);
	}
	public void deleteByCollectId(String collectId){
		tCollectMapper.deleteByPrimaryKey(collectId);
	}
}
