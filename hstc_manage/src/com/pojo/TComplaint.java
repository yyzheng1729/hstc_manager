package com.pojo;

public class TComplaint {
    private String complaintId;

    private String id;

    private String openid;
    
    private TUser tUser;
    
    private TRecruitment tRecruitment;
    

    public TUser gettUser() {
		return tUser;
	}

	public void settUser(TUser tUser) {
		this.tUser = tUser;
	}

	public TRecruitment gettRecruitment() {
		return tRecruitment;
	}

	public void settRecruitment(TRecruitment tRecruitment) {
		this.tRecruitment = tRecruitment;
	}

	public String getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(String complaintId) {
        this.complaintId = complaintId == null ? null : complaintId.trim();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid == null ? null : openid.trim();
    }
}