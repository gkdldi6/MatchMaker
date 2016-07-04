package com.kosta.matchmaker.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.MatchDTO;

@Repository
public class CourtDAOImpl implements CourtDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.kosta.matchmaker.mappers.CourtMapper";
	
	@Override
	public List<CourtVO> getCourts() throws Exception {
		return session.selectList(namespace + ".getCourts");
	}

	@Override
	public CourtVO getCourt(Integer cno) throws Exception {
		return session.selectOne(namespace + ".getCourt", cno);
	}

	@Override
	public void likeCourt(Integer cno) throws Exception {
		session.update(namespace + ".likeCourt", cno);
	}

	
	
	
	
	
	
	
	
	
	@Override
	public List<MatchDTO> getMatches() throws Exception {
		return session.selectList(namespace + ".getMatches");
	}
}
