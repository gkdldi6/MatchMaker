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

	// -------------------------- 게시물 구분 코드-------------------------
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

	// -------------------------- 게시판 등록 -------------------------

	// -------------------------- 게시판 목록 읽기, 글 하나 조회 -------------------------

	@Override
	public List<FreeBoardVO> noticeList(Integer bno) throws Exception {
		return session.selectList(namespace + ".noticeList", bno);
	}

	@Override
	public List<ArticleVO> readAll(Integer bno) throws Exception {

		return session.selectList(namespace + ".readAll", bno);
	}

	@Override
	public List<ArticleVO> freeAll(Integer bno) throws Exception {

		return session.selectList(namespace + ".freeAll", bno);
	}

	@Override
	public String boardName(Integer bno) throws Exception {
		return session.selectOne(namespace + ".boardName", bno);
	}

	@Override
	public List<ArticleVO> freeSearch(Integer bno, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);

		return session.selectList(namespace + ".freeSearch", map);
	}

	@Override
	public List<ArticleVO> listSearch(Integer bno, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);

		return session.selectList(namespace + ".listSearch", map);
	}

	@Override
	public int listSearchCount(Integer bno, SearchCriteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);

		return session.selectOne(namespace + ".listSearchCount", map);
	}

	@Override
	public FreeBoardVO freeOne(Integer bno, Integer ano) throws Exception {
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
	public ArticleVO articleOne(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		return session.selectOne(namespace + ".articleOne", map);
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

	@Override
	public void deleteFree(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.delete(namespace + ".deleteFree", map);
	}

	@Override
	public void deleteNotice(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.delete(namespace + ".deleteNotice", map);
	}

	@Override
	public void deleteReference(Integer bno, Integer ano) throws Exception {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.delete(namespace + ".deleteReference", map);
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

	/* 첨부파일 */
	@Override
	public void referenceCreate(Integer bno, Integer ano, String fullname) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);
		map.put("fullname", fullname);

		session.insert(namespace + ".referenceCreate", map);
	}

	@Override
	public List<String> getAttach(Integer bno, Integer ano) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		return session.selectList(namespace + ".getAttach", map);
	}

	@Override
	public void deleteAttach(Integer bno, Integer ano) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);

		session.delete(namespace + ".deleteAttach", map);
	}

	@Override
	public void addAttach(String fullName) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void selectBoard(Integer bno) throws Exception {
		// TODO Auto-generated method stub

	}

	// 베스트 게시글 선정(추천, 조회, 댓글)
	@Override
	public List<FreeBoardVO> maximumLike(Integer bno) throws Exception {
		return session.selectList(namespace + ".maximumLike", bno);

	}

	public List<FreeBoardVO> maximumHit(Integer bno) throws Exception {
		return session.selectList(namespace + ".maximumHit", bno);

	}

	public List<FreeBoardVO> maximumReply(Integer bno) throws Exception {
		return session.selectList(namespace + ".maximumReply", bno);

	}

}
