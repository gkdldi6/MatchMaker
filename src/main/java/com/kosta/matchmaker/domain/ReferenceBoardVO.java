package com.kosta.matchmaker.domain;

import java.util.Date;

public class ReferenceBoardVO extends ArticleVO {

	private String fullname;
	private Date regdate;

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
		return "ReferenceBoardVO [fullname=" + fullname + ", regdate=" + regdate + "]";
	}

}
