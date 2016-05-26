package com.kosta.matchmaker.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.BoardVO;

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

}
