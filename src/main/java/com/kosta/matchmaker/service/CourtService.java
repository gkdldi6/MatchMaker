package com.kosta.matchmaker.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.domain.MatchResultDTO;
import com.kosta.matchmaker.domain.PlayerVO;

public interface CourtService {

	// 모든 코트 가져오기
	public List<CourtVO> getCourts(CourtSearchDTO dto) throws Exception;
	
	// 모든 게임 가져오기
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception;
	
	// 내 게임 가져오기
	public List<MatchDTO> getMyMatch(String userid) throws Exception;
	
	// 내 게임 가져오기
	public List<MatchDTO> getMyMatch2(String userid) throws Exception;
	
	// 1개 코트 정보 가져오기
	public CourtVO getCourt(int cno) throws Exception;
	
	// 1개의 게임 가져오기
	public MatchDTO getMatch(int mno) throws Exception;
	
	// 예약된 게임 상태 확인
	public void chkGameState() throws Exception;
	
	// 선수 상태 변경
	public void stateChange(String id, int mno, String state) throws Exception;
	
	// 게임에 참가한 선수들을 가져오기
	public List<Map<String, Object>> getTeam(Integer mno, String team) throws Exception;
	
	// 회원 아이디로 선수 정보 가져오기
	public PlayerVO readPlayer(String userid) throws Exception;
	
	// 선수 초기화
	public void initPlayer(int mno, String id) throws Exception;
	
	// 선수 점수 주기
	public void ratePlayer(MatchResultDTO dto) throws Exception;
	
	// 예약할 때 유효값 체크
	public String checkReserve(Date begintime, Date endtime) throws Exception;
}
