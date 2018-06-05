package com.service;

import java.util.List;

import com.pojo.TCollect;

public interface CollecteService {
	/**
	 * 查询所有的收藏信息
	 * @return
	 */
	public List<TCollect> display_collection();
	/**
	 * 根据收藏编号删除收藏信息
	 * @param collectid
	 */
	public void deleteByCollectId(String collectId);
}
