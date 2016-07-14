package com.kosta.matchmaker.persistence;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.domain.MatchResultDTO;
import com.kosta.matchmaker.domain.PlayerVO;

public interface CourtDAO {
	
	// 페이지당 코트 목록 가져오기
	public List<CourtVO> getCourts(CourtSearchDTO dto) throws Exception;
	
	// 코트 정보 1개 가져오기
	public CourtVO getCourt(Integer cno) throws Exception;
	
	// 코트 좋아요 올리기
	public void likeCourt(Integer bno, Integer ano) throws Exception;
	
	// 1개 게임 정보 가져오기
	public MatchDTO getMatch(Integer mno) throws Exception;
	
	// 내 종료되지 않은 게임 정보 가져오기
	public List<MatchDTO> getMyMatch(String userid) throws Exception;
	
	// 내 모든 게임 정보 가져오기
	public List<MatchDTO> getMyMatch2(String userid) throws Exception;
	
	// 모든 게임 정보 가져오기
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception;
	
	// 코트 좌표 목록 가져오기
	public List<Map<String, Object>> getMatchCourts(GameSearchDTO dto) throws Exception;
	
	// 게임 시작후 대기 -> 시작
	public void checkMatch0() throws Exception;

	// 시작 -> 진행
	public void checkMatch1() throws Exception;
	
	// 게임 종료후 진행 -> 평가
	public void checkMatch2() throws Exception;
	
	// 게임 종료 + 30분후 평가 -> 종료
	public void checkMatch3() throws Exception;
	
	// 게임에 참여한 팀 회원들을 가져오기
	public List<Map<String, Object>> getTeam(Integer mno, String team) throws Exception;
	
	// 회원 아이디로 선수 정보 가져오기
	public PlayerVO getPlayer(String userid) throws Exception;
	
	// 선수 상태 참가로 변경
	public void stateStart(String id, Integer mno) throws Exception;
	
	// 선수 상태 종료로 변경
	public void stateEnd(String id, Integer mno) throws Exception;
	
	// 선수 점수 초기화
	public void initPlayer(Integer mno, String id) throws Exception;
	
	// 선수 점수 평가
	public void ratePlayer(MatchResultDTO dto) throws Exception;
	
	public int chkReserve(Date begintime, Date endtime) throws Exception;
	
	public Date chkBefore(Date begintime) throws Exception;
	
	public Date chkBefore2(Date begintime) throws Exception;
	
	public Date chkAfter(Date endtime) throws Exception;
	
	public Date chkAfter2(Date endtime) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	

}
