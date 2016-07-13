package com.kosta.matchmaker.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosta.matchmaker.domain.CourtSearchDTO;
import com.kosta.matchmaker.domain.CourtVO;
import com.kosta.matchmaker.domain.GameSearchDTO;
import com.kosta.matchmaker.domain.MatchDTO;
import com.kosta.matchmaker.domain.MatchResultDTO;
import com.kosta.matchmaker.domain.PlayerVO;
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
	
	/*내 게임 목록 조회*/
	@RequestMapping(value="/myGames", method=RequestMethod.GET)
	public ResponseEntity<List<MatchDTO>> getMyGames(@RequestParam("userid") String userid) {
		
		ResponseEntity<List<MatchDTO>> entity = null;
		
		try {
			List<MatchDTO> list = service.getMyMatch(userid);
			entity = new ResponseEntity<List<MatchDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<MatchDTO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*내 모든 게임 목록 조회*/
	@RequestMapping(value="/allMyGames", method=RequestMethod.GET)
	public ResponseEntity<List<MatchDTO>> getAllMyGames(@RequestParam("userid") String userid) {
		
		ResponseEntity<List<MatchDTO>> entity = null;
		
		try {
			List<MatchDTO> list = service.getMyMatch2(userid);
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
	
	/*회원 아이디로 선수 정보 가져오기*/ 
	@RequestMapping(value="/players/{userid}", method=RequestMethod.GET)
	public ResponseEntity<PlayerVO> readPlayer(@PathVariable("userid") String userid) {
		
		ResponseEntity<PlayerVO> entity = null;
		
		try {
			PlayerVO player = service.readPlayer(userid);
			entity = new ResponseEntity<PlayerVO>(player, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<PlayerVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*선수 상태 업데이트*/ 
	@RequestMapping(value="/games/{mno}/{id}/{state}", method=RequestMethod.PUT)
	public ResponseEntity<String> stateChange(@PathVariable("id") String id, @PathVariable("state") String state, @PathVariable("mno") int mno) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.stateChange(id, mno, state);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*선수 점수 초기화*/
	@RequestMapping(value="/players", method=RequestMethod.POST)
	public ResponseEntity<String> initPlayer(@RequestParam("mno") int mno, @RequestParam("id") String id) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.initPlayer(mno, id);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/*선수 평가*/
	@RequestMapping(value="/players/point", method=RequestMethod.PUT)
	public ResponseEntity<String> ratePlayer(@RequestBody MatchResultDTO dto) {
		System.out.println(dto);
		
		ResponseEntity<String> entity = null;
		
		try {
			service.ratePlayer(dto);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
