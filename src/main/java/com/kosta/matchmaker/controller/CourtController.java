package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.service.CourtService;

@RestController
public class CourtController {
	
	@Inject
	private CourtService service;
	
	@RequestMapping(value="/courts", method=RequestMethod.GET)
	public ResponseEntity<List<CourtVO>> getCourts(CourtSearchDTO latlng) {
		
		System.out.println("==================TEST=====================");
		System.out.println(latlng.toString());
		ResponseEntity<List<CourtVO>> entity = null;
		
		try {
			List<CourtVO> list = service.getCourts(latlng);
			entity = new ResponseEntity<List<CourtVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CourtVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/courts/{cno}", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/games", method=RequestMethod.GET)
	public ResponseEntity<List<MatchDTO>> getGames() {
		
		ResponseEntity<List<MatchDTO>> entity = null;
		
		try {
			List<MatchDTO> list = service.getMatches();
			entity = new ResponseEntity<List<MatchDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MatchDTO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/courts/new", method=RequestMethod.GET)
	public String newCourt(Model model) {
		ArticleVO article = new ArticleVO();
		article.setContent("TEST");
		article.setTitle("test");
		
		model.addAttribute("article", article);
		
		/*ResponseEntity<List<MatchDTO>> entity = null;
		
		try {
			List<MatchDTO> list = service.getAllMatches();
			entity = new ResponseEntity<List<MatchDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MatchDTO>>(HttpStatus.BAD_REQUEST);
		}*/
		
		return "/courts/new";
	}
	
}
