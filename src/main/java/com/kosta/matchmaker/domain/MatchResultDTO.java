package com.kosta.matchmaker.domain;

public class MatchResultDTO {
	
	private int mno;
	private String id;
	private int point;
	private int trust;
	
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTrust() {
		return trust;
	}
	public void setTrust(int trust) {
		this.trust = trust;
	}
	
	@Override
	public String toString() {
		return "MatchResultDTO [mno=" + mno + ", id=" + id + ", point=" + point + ", trust=" + trust + "]";
	}

}
