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
	
	
	
	// 모든 게임 정보 가져오기
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception;
	
	// 코트 좌표 목록 가져오기
	public List<Map<String, Object>> getMatchCourts(GameSearchDTO dto) throws Exception;
	
}
