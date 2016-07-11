package com.kosta.matchmaker.domain;

import java.util.Date;

public class NoticeBoardVO extends ArticleVO {

	private Date deadline;
	
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardVO [deadline=" + deadline + "]";
	}
	
}
