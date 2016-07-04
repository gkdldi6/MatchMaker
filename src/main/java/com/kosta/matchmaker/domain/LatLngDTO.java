package com.kosta.matchmaker.domain;

public class LatLngDTO {
	
	private double swlat;
	private double swlng;
	private double nelat;
	private double nelng;
	private String type;
	private int pageidx;
	
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPageidx() {
		return pageidx;
	}
	public void setPageidx(int pageidx) {
		this.pageidx = pageidx;
	}
	
}
