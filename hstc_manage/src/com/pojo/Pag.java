package com.pojo;

import java.util.List;

public class Pag {
	private int totalPage;
	private long totalData;
	private List<TRecruitment> tRecruitment;
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public long getTotalData() {
		return totalData;
	}
	public void setTotalData(long totalData) {
		this.totalData = totalData;
	}
	public List<TRecruitment> gettRecruitment() {
		return tRecruitment;
	}
	public void settRecruitment(List<TRecruitment> tRecruitment) {
		this.tRecruitment = tRecruitment;
	}
	
}
