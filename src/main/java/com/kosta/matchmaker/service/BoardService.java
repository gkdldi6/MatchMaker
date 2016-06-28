package com.kosta.matchmaker.service;

import java.util.List;
import java.util.Map;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.SearchCriteria;

public interface BoardService {

	// 게시글 등록
	public void register(ArticleVO board) throws Exception;

	// 개시글 읽기
	public List<ArticleVO> readAll(Integer bno) throws Exception;

	//검색 결과 
	public Map<String, Object> listSearch(int bno, SearchCriteria cri) throws Exception;
	
	//검색 결과  개수
	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 자유 게시글 조회
	public ArticleVO readOne(Integer bno, Integer ano) throws Exception;

	// 게시글 수정
	public void modify(ArticleVO board) throws Exception;

	// 게시글 삭제
	public void remove(Integer bno, Integer ano) throws Exception;



	// 첨부파일 ㄱㄱ
	public List<String> getAttach(Integer ano) throws Exception;

	// 첨부파일 삭제
	public void removeAttach(Integer ano) throws Exception;

}
