package com.kosta.matchmaker.domain.article;

public class FreeBoardVO {

	private int bno;
	private int ano;
	private String like;

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

	public String getLike() {
		return like;
	}

	public void setLike(String like) {
		this.like = like;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [bno=" + bno + ", ano=" + ano + ", like=" + like + "]";
	}

}
