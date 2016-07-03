package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.service.CourtService;

@RestController
@RequestMapping("/courts")
public class CourtController {
	
	@Inject
	private CourtService service;
	
	@RequestMapping(value="/all", method=RequestMethod.GET)
	public ResponseEntity<List<CourtVO>> courts() {
		
		ResponseEntity<List<CourtVO>> entity = null;
		
		try {
			List<CourtVO> list = service.getAllCourts();
			entity = new ResponseEntity<List<CourtVO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<CourtVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/games", method=RequestMethod.GET)
	public ResponseEntity<List<MatchDTO>> games() {
		
		ResponseEntity<List<MatchDTO>> entity = null;
		
		try {
			List<MatchDTO> list = service.getAllMatches();
			entity = new ResponseEntity<List<MatchDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MatchDTO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
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
