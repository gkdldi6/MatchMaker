package com.kosta.matchmaker.domain.article;

public class BoardCodeVO {

	private int bno;
	private int board_code;
	private String board_intro;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getBoard_code() {
		return board_code;
	}

	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}

	public String getBoard_intro() {
		return board_intro;
	}

	public void setBoard_intro(String board_intro) {
		this.board_intro = board_intro;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", board_code=" + board_code + ", board_intro=" + board_intro + "]";
	}

}
