package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.MatchDTO;

public interface CourtService {

	// 모든 코트 가져오기
	public List<CourtVO> getAllCourts() throws Exception;
	
	// 모든 게임 가져오기
	public List<MatchDTO> getAllMatches() throws Exception;
	
}
