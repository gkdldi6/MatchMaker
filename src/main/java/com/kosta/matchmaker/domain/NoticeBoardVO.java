package com.kosta.matchmaker.domain;

public class NoticeBoardVO extends ArticleVO {

	private String deadline;
	private String bound;

	public String getDeadline() {
		return deadline;
	}

	public String getBound() {
		return bound;
	}

	public void setBound(String bound) {
		this.bound = bound;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [deadline=" + deadline + ", bound=" + bound + "]";
	}

}
