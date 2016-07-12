package com.kosta.matchmaker.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.domain.MatchResultDTO;
import com.kosta.matchmaker.domain.PlayerVO;

@Repository
public class CourtDAOImpl implements CourtDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.kosta.matchmaker.mappers.CourtMapper";
	
	@Override
	public List<CourtVO> getCourts(CourtSearchDTO dto) throws Exception {
		return session.selectList(namespace + ".getSearchCourts", dto);
	}

	@Override
	public CourtVO getCourt(Integer cno) throws Exception {
		return session.selectOne(namespace + ".getCourt", cno);
	}

	@Override
	public void likeCourt(Integer bno, Integer ano) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("ano", ano);
		
		session.update(namespace + ".likeCourt", map);
	}
	
	@Override
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception {
		return session.selectList(namespace + ".getMatches", dto);
	}

	@Override
	public List<Map<String, Object>> getMatchCourts(GameSearchDTO dto) throws Exception {
		return session.selectList(namespace + ".getMatchCourts", dto);
	}

	@Override
	public void checkMatch0() throws Exception {
		session.update(namespace + ".checkMatch0");
	}
	
	@Override
	public void checkMatch1() throws Exception {
		session.update(namespace + ".checkMatch1");
	}

	@Override
	public void checkMatch2() throws Exception {
		session.update(namespace + ".checkMatch2");
	}

	@Override
	public void checkMatch3() throws Exception {
		session.update(namespace + ".checkMatch3");
	}

	@Override
	public List<Map<String, Object>> getTeam(Integer mno, String team) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("team", team);
		
		return session.selectList(namespace + ".getTeam", map);
	}

	@Override
	public MatchDTO getMatch(Integer mno) throws Exception {
		return session.selectOne(namespace + ".getMatch", mno);
	}

	@Override
	public PlayerVO getPlayer(String userid) throws Exception {
		return session.selectOne(namespace + ".getPlayer", userid);
	}

	@Override
	public void stateStart(String id, Integer mno) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("mno", mno);
		
		session.update(namespace + ".stateStart", map);
	}

	@Override
	public void stateEnd(String id, Integer mno) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("mno", mno);
		
		session.update(namespace + ".stateEnd", map);
	}

	@Override
	public void initPlayer(Integer mno, String id) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("mno", mno);
		
		session.insert(namespace + ".initPlayer", map);
	}

	@Override
	public void ratePlayer(MatchResultDTO dto) throws Exception {
		session.update(namespace + ".ratePlayer", dto);
	}

}
