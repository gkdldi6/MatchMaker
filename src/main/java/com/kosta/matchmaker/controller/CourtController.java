package com.kosta.matchmaker.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.matchmaker.domain.CourtVO;

@RestController
@RequestMapping("/courts")
public class CourtController {
	
	@RequestMapping("/all")
	public ResponseEntity<List<CourtVO>>  courts() {
		
		ResponseEntity<List<CourtVO>> entity = null;
		
		
		
		
		
		
		return entity;
	}
	
}
