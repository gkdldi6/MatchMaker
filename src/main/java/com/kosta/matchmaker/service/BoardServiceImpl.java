package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Transactional
	@Override
	public void register(BoardVO board) throws Exception {
		
		dao.create(board);
		
		String[] files = board.getFiles();
		
		if(files == null){
			return;
		}
		
		for(String fileName : files){
			dao.addAttach(fileName);
		}
	}

	@Override
	public List<BoardVO> readAll() throws Exception {
		
		return dao.readAll();
		
	}

	@Transactional
	@Override
	public void modify(BoardVO board) throws Exception {
		
		dao.update(board);

		Integer bno = board.getBno();
		
		dao.deleteAttach(bno);
		
		String[] files = board.getFiles();
		
		if(files == null){
			return;
		}
		
		for(String fileName : files){
			dao.replaceAttach(fileName, bno);
		}
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {

		dao.deleteAttach(bno);
		dao.delete(bno);
		
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO readOne(Integer bno) throws Exception {
		
		dao.updateHit(bno);
		return dao.readOne(bno);
		
	}


	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
		
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
		
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		
		return dao.getAttach(bno);
	}

	@Override
	public void removeAttach(Integer bno) throws Exception {
		dao.deleteAttach(bno);
		
	}

}
