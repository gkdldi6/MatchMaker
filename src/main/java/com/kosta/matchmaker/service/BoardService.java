package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;

public interface BoardService {

	//게시글 등록
	public void register(BoardVO board) throws Exception;
	
	//개시글 읽기
	public List<BoardVO> readAll() throws Exception;
	
	//게시글 수정
	public void modify(BoardVO board) throws Exception;
	
	//게시글 삭제
	public void remove(Integer bno) throws Exception;
	
	//게시글 검색
	public BoardVO readOne(Integer bno) throws Exception;
	
	//게시글 페이징처리중
	public List<BoardVO> listPage(int page) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
}
