package com.pojo;

public class TComment {
    private String commentId;

    private String id;

    private String openid;

    private String content;
    
    private TUser tUser;
    
    private TRecruitment tRecruitment;
    

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

	public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId == null ? null : commentId.trim();
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}