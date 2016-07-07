package com.kosta.matchmaker.domain;

import java.util.Date;

public class GameSearchDTO {

	private int cno;
	private int pageidx;
	private String radius;
	private double swlat;
	private double swlng;
	private double nelat;
	private double nelng;
	private Date begintime;
	private Date endtime;
	
	public Date getBegintime() {
		return begintime;
	}
	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getPageidx() {
		return pageidx;
	}
	public void setPageidx(int pageidx) {
		this.pageidx = pageidx;
	}
	public String getRadius() {
		return radius;
	}
	public void setRadius(String radius) {
		this.radius = radius;
	}
	public double getSwlat() {
		return swlat;
	}
	public void setSwlat(double swlat) {
		this.swlat = swlat;
	}
	public double getSwlng() {
		return swlng;
	}
	public void setSwlng(double swlng) {
		this.swlng = swlng;
	}
	public double getNelat() {
		return nelat;
	}
	public void setNelat(double nelat) {
		this.nelat = nelat;
	}
	public double getNelng() {
		return nelng;
	}
	public void setNelng(double nelng) {
		this.nelng = nelng;
	}
	
	@Override
	public String toString() {
		return "GameSearchDTO [cno=" + cno + ", pageidx=" + pageidx + ", radius=" + radius + ", swlat=" + swlat
				+ ", swlng=" + swlng + ", nelat=" + nelat + ", nelng=" + nelng + ", begintime=" + begintime
				+ ", endtime=" + endtime + "]";
	}

}
