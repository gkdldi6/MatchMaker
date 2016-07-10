package com.kosta.matchmaker.domain;

public class PlayerVO extends UserVO {
	
	private String name;
	private int age;
	private String sex;
	private int height;
	private int weight;
	private String position;
	private int gamecnt;
	private String grade;
	private int point;
	private int trust;
	private String info;
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getName() {
		return name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
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
		return "PlayerVO [name=" + name + ", age=" + age + ", sex=" + sex + ", height=" + height + ", weight=" + weight
				+ ", position=" + position + ", gamecnt=" + gamecnt + ", grade=" + grade + ", point=" + point
				+ ", trust=" + trust + ", info=" + info + "]";
	}
	
}
