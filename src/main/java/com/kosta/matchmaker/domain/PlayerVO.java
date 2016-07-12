package com.kosta.matchmaker.domain;

public class PlayerVO extends UserVO {
	
	private String name;
	private int age;
	private String sex;
	private int height;
	private int weight;
	private String position;
	private int gamecnt;
	private int point;
	private int trust;
	private String info;
	private String basketgrade;
	private int blow;
	private int bhigh;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getBasketgrade() {
		return basketgrade;
	}
	public void setBasketgrade(String basketgrade) {
		this.basketgrade = basketgrade;
	}
	public int getBlow() {
		return blow;
	}
	public void setBlow(int blow) {
		this.blow = blow;
	}
	public int getBhigh() {
		return bhigh;
	}
	public void setBhigh(int bhigh) {
		this.bhigh = bhigh;
	}
	
	@Override
	public String toString() {
		return "PlayerVO [name=" + name + ", age=" + age + ", sex=" + sex + ", height=" + height + ", weight=" + weight
				+ ", position=" + position + ", gamecnt=" + gamecnt + ", point=" + point + ", trust=" + trust
				+ ", info=" + info + ", basketgrade=" + basketgrade + ", blow=" + blow + ", bhigh=" + bhigh + "]";
	}
	
}
