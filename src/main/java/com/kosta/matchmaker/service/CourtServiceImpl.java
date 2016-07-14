package com.kosta.matchmaker.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.domain.MatchResultDTO;
import com.kosta.matchmaker.domain.PlayerVO;
import com.kosta.matchmaker.persistence.CourtDAO;

@Service
public class CourtServiceImpl implements CourtService {

	@Inject
	private CourtDAO dao;
	
	@Override
	public List<CourtVO> getCourts(CourtSearchDTO dto) throws Exception {
		return dao.getCourts(dto);
	}

	@Override
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception {
		return dao.getMatches(dto);
	}

	@Override
	public CourtVO getCourt(int cno) throws Exception {
		return dao.getCourt(cno);
	}

	@Override
	public List<Map<String, Object>> getTeam(Integer mno, String team) throws Exception {
		return dao.getTeam(mno, team);
	}

	@Override
	public MatchDTO getMatch(int mno) throws Exception {
		return dao.getMatch(mno);
	}

	@Override
	public PlayerVO readPlayer(String userid) throws Exception {
		return dao.getPlayer(userid);
	}

	@Override
	public void chkGameState() throws Exception {
		dao.checkMatch0();
		dao.checkMatch1();
		dao.checkMatch2();
		dao.checkMatch3();
	}

	@Override
	public void stateChange(String id, int mno, String state) throws Exception {
		if(state.equals("start")) {
			dao.stateStart(id, mno);
		} else if(state.equals("end")) {
			dao.stateEnd(id, mno);
		}
	}

	@Override
	public void initPlayer(int mno, String id) throws Exception {
		dao.initPlayer(mno, id);
	}

	@Override
	public void ratePlayer(MatchResultDTO dto) throws Exception {
		dao.ratePlayer(dto);
	}

	@Override
	public List<MatchDTO> getMyMatch(String userid) throws Exception {
		return dao.getMyMatch(userid);
	}
	
	@Override
	public List<MatchDTO> getMyMatch2(String userid) throws Exception {
		return dao.getMyMatch2(userid);
	}

	@Override
	public String checkReserve(Date begintime, Date endtime) throws Exception {
		if(dao.chkReserve(begintime, endtime) != 0) {
			System.out.println("시간안에 예약된 게임이 있습니다.");
			return "fail";
		}
		
		Date before = dao.chkBefore(begintime);
		Date after = dao.chkBefore2(begintime); 
		
		if(after.compareTo(before) > 0) {
			System.out.println("중복");
			return "fail";
		}
		
		after = dao.chkAfter(endtime);
		before = dao.chkAfter2(endtime);
		
		if(after.compareTo(before) > 0) {
			System.out.println("중복");
			return "fail";
		}
		
		return "success";
	}

}
