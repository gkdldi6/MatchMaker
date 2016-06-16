package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.CourtVO;

public interface CourtService {

	public List<CourtVO> getAllCourts() throws Exception;
	
}
