package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.MatchDTO;

public interface CourtDAO {
	
	// 모든 코트 정보 가져오기
	public List<CourtVO> getCourts() throws Exception;
	
	// 코트 정보 1개 가져오기
	public CourtVO getCourt(Integer cno) throws Exception;
	
	// 코트 등록
	
	// 코트 좋아요 올리기
	public void likeCourt(Integer cno) throws Exception;
	
	
	
	// 모든 게임 정보 가져오기
	public List<MatchDTO> getMatches() throws Exception;
	
}
