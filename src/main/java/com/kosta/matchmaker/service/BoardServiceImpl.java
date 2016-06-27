package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.SearchCriteria;
import com.kosta.matchmaker.persistence.ArticleDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private ArticleDAO dao;

	// -------------------------- 게시판 등록 -------------------------

	@Transactional
	@Override
	public void register(ArticleVO board) throws Exception {

		int ano;
		int bno = board.getBno();
		Integer lano = dao.lastAno(bno);

		if (lano != null) {
			ano = lano + 1;
		} else {
			ano = 1;
		}

		board.setAno(ano);
		dao.create(board);

		String article_type = board.getArticle_type();
		// String article_type = "F";

		if (article_type.equals("F")) {
			dao.freeCreate(board);
		} else if (article_type.equals("N")) {
			dao.noticeCreate(board);
		} else if (article_type.equals("R")) {
			dao.referenceCreate(board);
		}

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

	// -------------------------- 게시판 등록 -------------------------

	@Override
	public List<ArticleVO> readAll(Integer bno) throws Exception {

		return dao.readAll(bno);

	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria cri) throws Exception {

		return dao.listSearch(cri);

	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);

	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ArticleVO readOne(Integer bno, Integer ano) throws Exception {
		String type = dao.getType(bno, ano);

		ArticleVO vo = null;

		if (type.equals("F")) {
			vo = dao.freeOne(bno, ano);
		} else if (type.equals("N")) {
			vo = dao.noticeOne(bno, ano);
		} else if (type.equals("R")) {
			vo = dao.referenceOne(bno, ano);
		}

		dao.updateHit(bno, ano);
		return vo;

	}

	@Transactional
	@Override
	public void modify(ArticleVO board) throws Exception {

		dao.update(board);

		Integer ano = board.getAno();
		// dao.deleteAttach(ano);

		// String[] files = board.getFiles();
		//
		// if (files == null) {
		// return;
		// }
		//
		// for (String fileName : files) {
		// dao.replaceAttach(fileName, ano);
		// }
	}

	@Transactional
	@Override
	public void remove(Integer bno, Integer ano) throws Exception {

		// dao.deleteAttach(ano);
		dao.delete(bno, ano);

	}

	@Override
	public List<String> getAttach(Integer ano) throws Exception {

		return dao.getAttach(ano);
	}

	@Override
	public void removeAttach(Integer ano) throws Exception {
		dao.deleteAttach(ano);

	}

}
