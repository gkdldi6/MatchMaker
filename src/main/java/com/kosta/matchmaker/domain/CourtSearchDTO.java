package com.kosta.matchmaker.domain;

public class CourtSearchDTO {
	
	private double swlat;
	private double swlng;
	private double nelat;
	private double nelng;
	private String radius;
	private String outer;
	private String free;
	private String full;
	private String shower;
	private String parking;
	private String ground;
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
	public String getRadius() {
		return radius;
	}
	public void setRadius(String radius) {
		this.radius = radius;
	}
	public String getOuter() {
		return outer;
	}
	public void setOuter(String outer) {
		this.outer = outer;
	}
	public String getFree() {
		return free;
	}
	public void setFree(String free) {
		this.free = free;
	}
	public String getFull() {
		return full;
	}
	public void setFull(String full) {
		this.full = full;
	}
	public String getShower() {
		return shower;
	}
	public void setShower(String shower) {
		this.shower = shower;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public int getPageidx() {
		return pageidx;
	}
	public void setPageidx(int pageidx) {
		this.pageidx = pageidx;
	}
	
	@Override
	public String toString() {
		return "CourtSearchDTO [swlat=" + swlat + ", swlng=" + swlng + ", nelat=" + nelat + ", nelng=" + nelng
				+ ", radius=" + radius + ", outer=" + outer + ", free=" + free + ", full=" + full + ", shower=" + shower
				+ ", parking=" + parking + ", ground=" + ground + ", pageidx=" + pageidx + "]";
	}
	
}
