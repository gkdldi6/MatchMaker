package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.MatchDTO;

public interface CourtDAO {
	
	// 모든 코트 정보 가져오기
	public List<CourtVO> getAllCourts() throws Exception;
	
	// 모든 게임 정보 가져오기
	public List<MatchDTO> getAllMatches() throws Exception;
	
}
