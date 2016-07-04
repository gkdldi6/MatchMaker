package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.persistence.CourtDAO;

@Service
public class CourtServiceImpl implements CourtService {

	@Inject
	private CourtDAO dao;
	
	@Override
	public List<CourtVO> getCourts() throws Exception {
		return dao.getCourts();
	}

	@Override
	public List<MatchDTO> getMatches() throws Exception {
		return dao.getMatches();
	}

	@Override
	public CourtVO getCourt(int cno) throws Exception {
		return dao.getCourt(cno);
	}

	@Override
	public void likeCourt(int cno) throws Exception {
		dao.likeCourt(cno);
	}

}
