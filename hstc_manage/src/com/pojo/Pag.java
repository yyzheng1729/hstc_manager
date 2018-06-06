package com.pojo;

import java.util.List;

public class Pag {
	private int totalPage;
	private long totalData;
	private List<TRecruitment> tRecruitment;
	private List<TCollege> tCollege;
	private List<TUser> tUser;
	private List<TCollect> tCollect;
	private List<TComment> tComment;
	private List<TAdmin> tAdmin;
	
	
	public List<TAdmin> gettAdmin() {
		return tAdmin;
	}
	public void settAdmin(List<TAdmin> tAdmin) {
		this.tAdmin = tAdmin;
	}
	public List<TComment> gettComment() {
		return tComment;
	}
	public void settComment(List<TComment> tComment) {
		this.tComment = tComment;
	}
	public List<TCollect> gettCollect() {
		return tCollect;
	}
	public void settCollect(List<TCollect> tCollect) {
		this.tCollect = tCollect;
	}
	public List<TUser> gettUser() {
		return tUser;
	}
	public void settUser(List<TUser> tUser) {
		this.tUser = tUser;
	}
	public List<TCollege> gettCollege() {
		return tCollege;
	}
	public void settCollege(List<TCollege> tCollege) {
		this.tCollege = tCollege;
	}
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
