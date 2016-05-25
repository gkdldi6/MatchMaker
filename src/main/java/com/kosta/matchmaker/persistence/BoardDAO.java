package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.BoardVO;

public interface BoardDAO {

	//게시글 등록(create)
	public void create(BoardVO board) throws Exception;
	
	//게시글 읽기 (전체목록 read)
	public List<BoardVO> readAll() throws Exception;
	
	//게시글 수정(update)
	public void update(BoardVO board) throws Exception;
	
	//게시글 삭제(delete)
	public void delete(Integer bno) throws Exception;
	
	//게시글 검색(selectOne)
	public List<BoardVO> readOne() throws Exception;
	
	
	
}
