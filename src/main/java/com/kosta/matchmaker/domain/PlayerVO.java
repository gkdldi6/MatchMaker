package com.kosta.matchmaker.domain;

import java.util.Date;

public class PlayerVO extends UserVO {
	
	private Date birthdate;
	private String sex;
	private int height;
	private int weight;
	private String position;
	private int gamecnt;
	private int wincnt;
	private String basketcode;
	private int basketpoint;
	private int trustpoint;
	
	
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getGamecnt() {
		return gamecnt;
	}
	public void setGamecnt(int gamecnt) {
		this.gamecnt = gamecnt;
	}
	public int getWincnt() {
		return wincnt;
	}
	public void setWincnt(int wincnt) {
		this.wincnt = wincnt;
	}
	public String getBasketcode() {
		return basketcode;
	}
	public void setBasketcode(String basketcode) {
		this.basketcode = basketcode;
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
	
}
