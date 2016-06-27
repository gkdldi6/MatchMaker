package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.FreeBoardVO;
import com.kosta.matchmaker.domain.NoticeBoardVO;
import com.kosta.matchmaker.domain.ReferenceBoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.kosta.matchmaker.mappers.BoardMapper";

	// -------------------------- 게시판 구분 코드-------------------------
	@Override
	public String getType(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		return session.selectOne(namespace + ".getType", map);
	}

	@Override
	public Integer lastAno(int bno) throws Exception {

		return session.selectOne(namespace + ".lastAno", bno);
	}

	// -------------------------- 게시판 구분 코드-------------------------

	// -------------------------- 게시판 등록 -------------------------
	@Override
	public void create(ArticleVO board) throws Exception {

		session.insert(namespace + ".create", board);
	}

	// @Override
	// public void freeCreate(ArticleVO board) throws Exception {
	//
	// session.insert(namespace + ".freeCreate", board);
	// }

	@Override
	public void freeCreate(ArticleVO board) throws Exception {

		session.insert(namespace + ".freeCreate", board);
	}

	@Override
	public void noticeCreate(ArticleVO board) throws Exception {

		session.insert(namespace + ".noticeCreate", board);
	}

	@Override
	public void referenceCreate(ArticleVO board) throws Exception {

		session.insert(namespace + ".referenceCreate", board);
	}
	// -------------------------- 게시판 등록 -------------------------

	// -------------------------- 게시판 목록 읽기, 글 하나 조회 -------------------------

	@Override
	public List<ArticleVO> readAll(Integer bno) throws Exception {

		return session.selectList(namespace + ".readAll", bno);
	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public FreeBoardVO freeOne(Integer ano, Integer bno) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		return session.selectOne(namespace + ".freeOne", map);
	}

	@Override
	public NoticeBoardVO noticeOne(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		return session.selectOne(namespace + ".noticeOne", map);
	}

	@Override
	public ReferenceBoardVO referenceOne(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		return session.selectOne(namespace + ".referenceOne", map);
	}

	// -------------------------- 게시판 목록 읽기, 글 하나 조회 -------------------------

	// -------------------------- 게시판 수정 -------------------------

	@Override
	public void update(ArticleVO board) throws Exception {

		session.update(namespace + ".update", board);
	}

	@Override
	public void freeUpdate(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.update(namespace + ".freeUpdate", map);
	}

	@Override
	public void noticeUpdate(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.update(namespace + ".noticeUpdate", map);
	}

	@Override
	public void referenceUpdate(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.update(namespace + ".referenceUpdate", map);
	}

	// -------------------------- 게시판 수정 -------------------------

	@Override
	public void delete(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.delete(namespace + ".delete", map);

	}

	// 아래부터는 테스트 하지않은 미완성 코드..

	@Override
	public void updateReplyCnt(Integer ano, int amount) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("ano", ano);
		paramMap.put("amount", amount);

		session.update(namespace + ".updateReplyCnt", paramMap);

	}

	@Override
	public void updateHit(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.update(namespace + ".updateHit", map);

	}

	@Override
	public void addAttach(String fullName) throws Exception {
		// session.insert(namespace + ".addAttach", fullName);
	}

	@Override
	public List<String> getAttach(Integer ano) throws Exception {
		// TODO Auto-generated method stub
		// return session.selectList(namespace + ".getAttach", ano);
		return null;

	}

	@Override
	public void deleteAttach(Integer ano) throws Exception {
		// session.delete(namespace + ".deleteAttach", ano);

	}

	@Override
	public void replaceAttach(String fullName, Integer ano) throws Exception {

		// Map<String, Object> paramMap = new HashMap<String, Object>();
		//
		// paramMap.put("ano", ano);
		// paramMap.put("fullName", fullName);
		//
		// session.insert(namespace + ".replaceAttach", paramMap);

	}

	@Override
	public void selectBoard(Integer bno) throws Exception {

	}

}
