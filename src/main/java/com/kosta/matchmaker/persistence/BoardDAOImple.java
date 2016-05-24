package com.kosta.matchmaker.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.BoardVO;

@Repository
public class BoardDAOImple implements BoardDAO {

	private static final String namespace = "com.kosta.matchmaker.mapper.BoardMampper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void create(BoardVO board) throws Exception {

		session.insert(namespace + ".create", board);
		
	}

}
