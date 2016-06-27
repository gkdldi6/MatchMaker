package com.kosta.matchmaker.domain;

public class BoardVO {

	private int code;
	private String code_intro;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getCode_intro() {
		return code_intro;
	}

	public void setCode_intro(String code_intro) {
		this.code_intro = code_intro;
	}

	@Override
	public String toString() {
		return "BoardVO [code=" + code + ", code_intro=" + code_intro + "]";
	}

}
