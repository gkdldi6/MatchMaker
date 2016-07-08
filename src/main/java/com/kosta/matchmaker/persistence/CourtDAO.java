package com.kosta.matchmaker.persistence;

import java.util.List;
import java.util.Map;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;

public interface CourtDAO {
	
	// 페이지당 코트 목록 가져오기
	public List<CourtVO> getCourts(CourtSearchDTO dto) throws Exception;
	
	// 코트 정보 1개 가져오기
	public CourtVO getCourt(Integer cno) throws Exception;
	
	// 코트 좋아요 올리기
	public void likeCourt(Integer cno) throws Exception;
	
	// 1개 게임 정보 가져오기
	public MatchDTO getMatch(Integer mno) throws Exception;
	
	// 모든 게임 정보 가져오기
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception;
	
	// 코트 좌표 목록 가져오기
	public List<Map<String, Object>> getMatchCourts(GameSearchDTO dto) throws Exception;
	
	// 게임 시작후 대기 -> 시작
	public void checkMatch1() throws Exception;
	
	// 게임 종료후 시작 -> 평가
	public void checkMatch2() throws Exception;
	
	// 게임 종료 + 30분후 평가 -> 종료
	public void checkMatch3() throws Exception;
	
	// 게임에 참여한 팀 회원들을 가져오기
	public List<Map<String, Object>> getTeam(Integer mno, String team) throws Exception;
	
}
