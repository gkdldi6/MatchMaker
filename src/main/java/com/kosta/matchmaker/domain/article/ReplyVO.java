package com.kosta.matchmaker.domain.article;

import java.util.Date;

public class ReplyVO {

	private int bno;
	private int ano;
	private int rno;
	private String replytext;
	private String replyer;
	private Date regdate;

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

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getReplytext() {
		return replytext;
	}

	public void setReplytext(String replytext) {
		this.replytext = replytext;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", ano=" + ano + ", rno=" + rno + ", replytext=" + replytext + ", replyer="
				+ replyer + ", regdate=" + regdate + "]";
	}

}
