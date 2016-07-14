package com.kosta.matchmaker.domain;

public class AdminVO {
	private String id;
	private String pw;
	private String auth;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	@Override
	public String toString() {
		return "AdminDTO [id=" + id + ", pw=" + pw + ", auth=" + auth + "]";
	}
	
}