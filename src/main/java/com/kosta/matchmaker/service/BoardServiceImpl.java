package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.domain.article.SearchCriteria;
import com.kosta.matchmaker.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Transactional
	@Override
	public void register(ArticleVO board) throws Exception {

		dao.create(board);

		// String[] files = board.getFiles();
		//
		// if(files == null){
		// return;
		// }
		//
		// for(String fileName : files){
		// dao.addAttach(fileName);
		// }
	}

	@Override
	public List<ArticleVO> readAll() throws Exception {

		return dao.readAll();

	}

	@Transactional
	@Override
	public void modify(ArticleVO board) throws Exception {

		dao.update(board);

		Integer bno = board.getBno();

		// dao.deleteAttach(bno);

		// String[] files = board.getFiles();
		//
		// if (files == null) {
		// return;
		// }
		//
		// for (String fileName : files) {
		// dao.replaceAttach(fileName, bno);
		// }
	}

	@Transactional
	@Override
	public void remove(Integer bno) throws Exception {

		dao.deleteAttach(bno);
		dao.delete(bno);

	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ArticleVO readOne(Integer bno) throws Exception {

		dao.updateHit(bno);
		return dao.readOne(bno);

	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria cri) throws Exception {

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
