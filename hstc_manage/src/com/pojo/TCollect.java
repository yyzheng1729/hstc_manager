package com.pojo;

import java.util.List;

public class TCollect {
    private String collectId;

    private String openid;

    private String id;
    
    private TRecruitment tRecruitment;
    
    private TUser tUser;

    public TRecruitment gettRecruitment() {
		return tRecruitment;
	}

	public void settRecruitment(TRecruitment tRecruitment) {
		this.tRecruitment = tRecruitment;
	}

	public TUser gettUser() {
		return tUser;
	}

	public void settUser(TUser tUser) {
		this.tUser = tUser;
	}

	public String getCollectId() {
        return collectId;
    }

    public void setCollectId(String collectId) {
        this.collectId = collectId == null ? null : collectId.trim();
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid == null ? null : openid.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }
}