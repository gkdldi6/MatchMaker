package com.kosta.matchmaker.domain;

import java.util.Date;

public class ReferenceBoardVO extends ArticleVO {

	private String[] files;
	private Date regdate;

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReferenceBoardVO [fullname=" + files + ", regdate=" + regdate + "]";
	}

}
