package com.kosta.matchmaker.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService service;
	
	@RequestMapping(value="/{bno}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> replies(@PathVariable int bno) {
		
		ResponseEntity<List<ReplyVO>> entity = null;
			
		try {
			List<ReplyVO> list = service.listReply(bno);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> addReply(@RequestBody ReplyVO reply) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.addReply(reply);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modifyReply(@PathVariable("rno") int rno, 
			@RequestBody ReplyVO reply) {
		
		ResponseEntity<String> entity = null;
		
		try {
			reply.setRno(rno);
			service.modifyReply(reply);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("rno") int rno) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteReply(rno);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
