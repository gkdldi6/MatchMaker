package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	private static final String namespace = "com.kosta.matchmaker.mappers.BoardMapper";

	@Inject
	private SqlSession session;

	@Override
	public void create(BoardVO board) throws Exception {

		session.insert(namespace + ".create", board);
	}

	@Override
	public List<BoardVO> readAll() throws Exception {
		return session.selectList(namespace + ".readAll");
	}

	@Override
	public void update(BoardVO board) throws Exception {
		session.update(namespace + ".update", board);
	}

	@Override
	public void delete(Integer bno) throws Exception {
		session.delete(namespace + ".delete", bno);
	}

	@Override
	public BoardVO readOne(Integer bno) throws Exception {
		return session.selectOne(namespace + ".readOne", bno);
	}

	/*@Override
	public List<BoardVO> listPage(int page) throws Exception {
		return null;
	}*/

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	  public void updateReplyCnt(Integer bno, int amount) throws Exception {

	    Map<String, Object> paramMap = new HashMap<String, Object>();

	    paramMap.put("bno", bno);
	    paramMap.put("amount", amount);

	    session.update(namespace + ".updateReplyCnt", paramMap);
	  }

	@Override
	public void updateHit(Integer bno) throws Exception {
		session.update(namespace + ".updateHit", bno);
		
	}

	@Override
	public void addAttach(String fullName) throws Exception {

		session.insert(namespace + ".addAttach", fullName);
		
	}

	@Override
	public List<String> getAttach(Integer bno) throws Exception {
		
		return session.selectList(namespace + ".getAttach", bno);
	}

	@Override
	public void deleteAttach(Integer bno) throws Exception {
		
		session.delete(namespace + ".deleteAttach", bno);
	}

	@Override
	public void replaceAttach(String fullName, Integer bno) throws Exception {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bno", bno);
		paramMap.put("fullName", fullName);
		
		session.insert(namespace + ".replaceAttach", bno);
	}
}
