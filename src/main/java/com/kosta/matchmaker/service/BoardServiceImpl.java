package com.kosta.matchmaker.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

		int bno = board.getBno();
		Integer lano = dao.lastAno(bno);

		if (lano != null) {
			lano++;
		} else {
			lano = 1;
		}

		board.setAno(lano);
		dao.create(board);
		System.out.println(board.toString());
		String article_type = board.getArticle_type();

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

//		return dao.readAll(bno);
		return dao.freeAll(bno);

	}

	@Override
	public Map<String, Object> listSearch(int bno, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("name", dao.boardName(bno));
		map.put("list", dao.listSearch(bno, cri));
		
		return map;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return dao.listSearchCount(cri);

	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ArticleVO readOne(Integer bno, Integer ano) throws Exception {
		String type = dao.getType(bno, ano);

		ArticleVO article = null;

		if (type.equals("F")) {
			article = dao.freeOne(bno, ano);
		} else if (type.equals("N")) {
			article = dao.noticeOne(bno, ano);
		} else if (type.equals("R")) {
			article = dao.referenceOne(bno, ano);
		}

		dao.updateHit(bno, ano);
		return article;
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
		
		String type = dao.getType(bno, ano);
		dao.delete(bno, ano);
		
		if (type.equals("F")) {
			dao.deleteFree(bno, ano);
		} else if (type.equals("N")) {
			dao.deleteNotice(bno, ano);
		} else if (type.equals("R")) {
			dao.deleteReference(bno, ano);
		}
		
		// dao.deleteAttach(ano);
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
