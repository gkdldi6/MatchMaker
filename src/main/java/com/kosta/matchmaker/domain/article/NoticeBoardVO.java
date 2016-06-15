package com.kosta.matchmaker.domain.article;

public class NoticeBoardVO {

	private int bno;
	private int ano;
	private String deadline;

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

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [bno=" + bno + ", ano=" + ano + ", deadline=" + deadline + "]";
	}

}
