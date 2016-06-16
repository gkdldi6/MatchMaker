package com.kosta.matchmaker.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.CourtVO;

@Repository
public class CourtDAOImpl implements CourtDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.kosta.matchmaker.mappers.CourtMapper";
	
	@Override
	public List<CourtVO> getAllCourts() throws Exception {
		return session.selectList(namespace + ".getAllCourts");
	}

}
