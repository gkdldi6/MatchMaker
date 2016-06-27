package com.kosta.matchmaker.domain;

import java.util.Date;

public class ArticleVO {

	private int bno;
	private int ano;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int hit;
	private int replycnt;
	private String article_type;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public String getArticle_type() {
		return article_type;
	}

	public void setArticle_type(String article_type) {
		this.article_type = article_type;
	}

	@Override
	public String toString() {
		return "ArticleVO [bno=" + bno + ", ano=" + ano + ", title=" + title + ", writer=" + writer + ", content="
				+ content + ", regdate=" + regdate + ", hit=" + hit + ", replycnt=" + replycnt + ", article_type="
				+ article_type + "]";
	}

}
