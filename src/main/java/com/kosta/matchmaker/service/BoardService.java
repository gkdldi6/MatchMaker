package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.domain.article.SearchCriteria;

public interface BoardService {

	// 게시글 등록
	public void freeregister(ArticleVO board) throws Exception;

	// 개시글 읽기
	public List<ArticleVO> freereadAll() throws Exception;

	// 게시글 수정
	public void freemodify(ArticleVO board) throws Exception;

	// 게시글 삭제
	public void freeremove(Integer ano) throws Exception;

	// 게시글 검색
	public ArticleVO freereadOne(Integer ano) throws Exception;

	// 게시글 페이징처리중
	// public List<BoardVO> listPage(int page) throws Exception;

	public List<ArticleVO> freelistSearch(SearchCriteria cri) throws Exception;

	public int freelistSearchCount(SearchCriteria cri) throws Exception;

	// 첨부파일 ㄱㄱ 6월 17일 이 밑으로 메서드 처리 ㄴㄴ
	public List<String> getAttach(Integer bno) throws Exception;

	// 첨부파일 삭제
	public void removeAttach(Integer bno) throws Exception;

}
