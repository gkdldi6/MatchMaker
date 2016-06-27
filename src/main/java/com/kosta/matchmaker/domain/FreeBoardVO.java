package com.kosta.matchmaker.domain;

public class FreeBoardVO extends ArticleVO {

	private int liked;

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [liked=" + liked + "]";
	}

}
