package com.kosta.matchmaker.domain;

public class MatchResultDTO {
	
	private int mno;
	private String id;
	private int score;
	private int basketpoint;
	private int trustpoint;
	private String result;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getBasketpoint() {
		return basketpoint;
	}
	public void setBasketpoint(int basketpoint) {
		this.basketpoint = basketpoint;
	}
	public int getTrustpoint() {
		return trustpoint;
	}
	public void setTrustpoint(int trustpoint) {
		this.trustpoint = trustpoint;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}

}
