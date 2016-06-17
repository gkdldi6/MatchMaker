package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.domain.article.SearchCriteria;
import com.kosta.matchmaker.persistence.ArticleDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private ArticleDAO dao;

	@Override
	public void freeregister(ArticleVO board) throws Exception {

		dao.freecreate(board);

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
	public List<ArticleVO> freereadAll() throws Exception {

		return dao.freereadAll();

	}

	@Transactional
	@Override
	public void freemodify(ArticleVO board) throws Exception {

		dao.freeupdate(board);

		Integer ano = board.getAno();

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

	
	@Override
	public void freeremove(Integer ano) throws Exception {

		//dao.deleteAttach(bno);
		dao.freedelete(ano);

	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ArticleVO freereadOne(Integer ano) throws Exception {

		dao.updateHit(ano);
		return dao.freereadOne(ano);

	}

	@Override
	public List<ArticleVO> freelistSearch(SearchCriteria cri) throws Exception {

		return dao.freelistSearch(cri);

	}

	@Override
	public int freelistSearchCount(SearchCriteria cri) throws Exception {

		return dao.freelistSearchCount(cri);

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
