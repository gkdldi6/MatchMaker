package com.kosta.matchmaker.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.PageMaker;
import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService service;

	// 페이징 v1 : List<replyVO> => Map<String, Object>, @PathVariable 추가..
//	@RequestMapping(value = "/{ano}/{page}", method = RequestMethod.GET)
	@RequestMapping(value = "/{bno}/{ano}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replies(@PathVariable Integer bno, @PathVariable Integer ano,
			@PathVariable Integer page) {

		// ResponseEntity<List<ReplyVO>> entity = null;
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			// List<ReplyVO> list = service.listReply(ano);
			// entity = new ResponseEntity<>(list, HttpStatus.OK);

			Criteria cri = new Criteria();
			cri.setPage(page);

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			System.out.println("???");
			Map<String, Object> map = new HashMap<>();
			List<ReplyVO> list = service.listReply(bno, ano, cri);
			map.put("list", list);

			System.out.println("kkkk");
			int replyCount = service.count(ano);
			System.out.println("uuuuu");
			pageMaker.setTotalCount(replyCount);

			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> addReply(@RequestBody ReplyVO reply) {

		ResponseEntity<String> entity = null;

		try {
			service.addReply(reply);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> modifyReply(@PathVariable("rno") int rno, @RequestBody ReplyVO reply) {

		ResponseEntity<String> entity = null;

		try {
			reply.setRno(rno);
			service.modifyReply(reply);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> deleteReply(@PathVariable("rno") int rno) {

		ResponseEntity<String> entity = null;

		try {
			service.removeReply(rno);
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
