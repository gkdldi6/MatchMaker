package com.kosta.matchmaker.domain.article;

import java.util.Date;

public class ReferenceBoardVO {

	private int bno;
	private int ano;
	private String fullname;
	private Date regdate;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReferenceBoardVO [bno=" + bno + ", ano=" + ano + ", fullname=" + fullname + ", regdate=" + regdate
				+ "]";
	}

}
