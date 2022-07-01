package com.my.app.domain;

public class LikeDto {
	
	private int bno;
	private String userId;
	private Integer liked;
	
	public LikeDto() {}
	public LikeDto(int bno, String userId, int liked) {
		super();
		this.bno = bno;
		this.userId = userId;
		this.liked = liked;
	}

	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	@Override
	public String toString() {
		return "likeDto [bno=" + bno + ", userId=" + userId + ", liked=" + liked + "]";
	}
	
	
	
}
