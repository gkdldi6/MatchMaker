package com.kosta.matchmaker.persistence;

import com.kosta.matchmaker.domain.BoardVO;

public interface BoardDAO {

	//게시글 등록(create)
	public void create(BoardVO board) throws Exception;
	
	
	
	
	
}
