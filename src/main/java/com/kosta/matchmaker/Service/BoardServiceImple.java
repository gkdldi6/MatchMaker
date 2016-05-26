package com.kosta.matchmaker.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.persistence.BoardDAO;

@Service
public class BoardServiceImple implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public void regist(BoardVO board) throws Exception {
		
		dao.create(board);
		
	}

	@Override
	public List<BoardVO> readAll() throws Exception {
		
		return dao.readAll();
		
	}

	@Override
	public void modify(BoardVO board) throws Exception {
		
		dao.update(board);

	}

	@Override
	public void remove(Integer bno) throws Exception {

		dao.delete(bno);
		
	}

	@Override
	public BoardVO readOne(Integer bno) throws Exception {
		
		return dao.readOne(bno);
		
	}

}
