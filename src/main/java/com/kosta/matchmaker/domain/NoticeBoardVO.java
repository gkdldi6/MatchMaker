package com.kosta.matchmaker.domain;

import java.util.Date;

public class NoticeBoardVO extends ArticleVO {

	private Date deadline;
	private int bound;
	
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public int getBound() {
		return bound;
	}
	public void setBound(int bound) {
		this.bound = bound;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardVO [deadline=" + deadline + ", bound=" + bound + "]";
	}

}
