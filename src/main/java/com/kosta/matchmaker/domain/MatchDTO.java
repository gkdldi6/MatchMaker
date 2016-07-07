package com.kosta.matchmaker.domain;

public class MatchDTO {
	
	private int mno;
	private String mname;
	private String begintime;
	private String endtime;
	private int cno;
	private String state;
	private double lat;
	private double lng;
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getBegintime() {
		return begintime;
	}
	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	
	@Override
	public String toString() {
		return "MatchDTO [mno=" + mno + ", mname=" + mname + ", begintime=" + begintime + ", endtime=" + endtime
				+ ", cno=" + cno + ", state=" + state + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
}
