package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.persistence.CourtDAO;

@Service
public class CourtServiceImpl implements CourtService {

	@Inject
	private CourtDAO dao;
	
	@Override
	public List<CourtVO> getCourts(CourtSearchDTO dto) throws Exception {
		return dao.getCourts(dto);
	}

	@Override
	public List<MatchDTO> getMatches(GameSearchDTO dto) throws Exception {
		return dao.getMatches(dto);
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
