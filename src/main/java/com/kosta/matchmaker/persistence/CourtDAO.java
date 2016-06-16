package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.CourtVO;

public interface CourtDAO {
	
	public List<CourtVO> getAllCourts() throws Exception;
	
}
