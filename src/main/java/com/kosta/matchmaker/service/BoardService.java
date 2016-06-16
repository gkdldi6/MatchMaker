package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.domain.article.SearchCriteria;

public interface BoardService {

	// 게시글 등록
	public void register(ArticleVO board) throws Exception;

	// 개시글 읽기
	public List<ArticleVO> readAll() throws Exception;

	// 게시글 수정
	public void modify(ArticleVO board) throws Exception;

	// 게시글 삭제
	public void remove(Integer bno) throws Exception;

	// 게시글 검색
	public ArticleVO readOne(Integer bno) throws Exception;

	// 게시글 페이징처리중
	// public List<BoardVO> listPage(int page) throws Exception;

	public List<ArticleVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 첨부파일 ㄱㄱ
	public List<String> getAttach(Integer bno) throws Exception;

	// 첨부파일 삭제
	public void removeAttach(Integer bno) throws Exception;

}
