package com.kosta.matchmaker.service;

import java.util.List;
import java.util.Map;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;

public interface CourtService {

	// 모든 코트 가져오기
	public List<CourtVO> getCourts(CourtSearchDTO dto) throws Exception;
	
	// 모든 게임 가져오기
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception;
	
	// 1개 코트 정보 가져오기
	public CourtVO getCourt(int cno) throws Exception;
	
	// 코트 좋아요 누르기
	public void likeCourt(int cno) throws Exception;
	
	// 1개의 게임 가져오기
	public MatchDTO getMatch(int mno) throws Exception;
	
	
	// 예약된 게임 상태 확인
	
	
	
	
	// 게임에 참가한 선수들을 가져오기
	public List<Map<String, Object>> getTeam(Integer mno, String team) throws Exception;
}
