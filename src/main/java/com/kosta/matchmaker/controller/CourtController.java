package com.kosta.matchmaker.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.service.CourtService;

@RestController
@RequestMapping("/courts")
public class CourtController {
	
	@Inject
	private CourtService service;
	
	/*코트 목록 조회*/
	@RequestMapping(value="", method=RequestMethod.GET)
	public ResponseEntity<List<CourtVO>> getCourts(CourtSearchDTO dto) {
		
		System.out.println("==================CourtSearchDTO=====================");
		System.out.println(dto.toString());
		
		ResponseEntity<List<CourtVO>> entity = null;
		
		try {
			List<CourtVO> list = service.getCourts(dto);
			entity = new ResponseEntity<List<CourtVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CourtVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*한개의 코트 조회*/
	@RequestMapping(value="/{cno}", method=RequestMethod.GET)
	public ResponseEntity<CourtVO> getCourt(@PathVariable("cno") int cno) {
		
		ResponseEntity<CourtVO> entity = null;
		
		try {
			CourtVO court = service.getCourt(cno);
			entity = new ResponseEntity<CourtVO>(court, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<CourtVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*게임 목록 조회*/
	@RequestMapping(value="/games", method=RequestMethod.GET)
	public ResponseEntity<List<MatchDTO>> getGames(GameSearchDTO dto) {
		
		System.out.println("==================GameSearchDTO=====================");
		System.out.println(dto.toString());
		
		ResponseEntity<List<MatchDTO>> entity = null;
		
		try {
			List<MatchDTO> list = service.getMatches(dto);
			entity = new ResponseEntity<List<MatchDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MatchDTO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*1개의 게임 조회*/
	@RequestMapping(value="/games/{mno}", method=RequestMethod.GET)
	public ResponseEntity<MatchDTO> getGame(@PathVariable("mno") int mno) {
		
		ResponseEntity<MatchDTO> entity = null;
		
		try {
			MatchDTO dto = service.getMatch(mno);
			entity = new ResponseEntity<MatchDTO>(dto, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<MatchDTO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*1개의 게임에 속한 선수들 조회*/
	@RequestMapping(value="/games/{mno}/{team}", method=RequestMethod.GET)
	public ResponseEntity<List<Map<String, Object>>> getTeam(@PathVariable("mno") int mno, @PathVariable("team") String team) {
		
		ResponseEntity<List<Map<String, Object>>> entity = null;
		
		try {
			List<Map<String, Object>> list = service.getTeam(mno, team);
			entity = new ResponseEntity<List<Map<String, Object>>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<Map<String, Object>>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
