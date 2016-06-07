package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;

public interface BoardDAO {

	// 게시글 등록(create)
	public void create(BoardVO board) throws Exception;

	// 게시글 조회(selectOne)
	public BoardVO readOne(Integer bno) throws Exception;

	// 게시글 수정(update)
	public void update(BoardVO board) throws Exception;

	// 게시글 삭제(delete)
	public void delete(Integer bno) throws Exception;
	
	// 게시글 읽기 (전체목록 read)
	public List<BoardVO> readAll() throws Exception;

	//게시글 페이징처리중
	public List<BoardVO> listPage(int page) throws Exception;
	
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	// 리플라이 카운터
	public void updateReplyCnt(Integer bno, int amount)throws Exception;
	
	//조회수
	public void updateHit(Integer bno) throws Exception;

	
	
}
