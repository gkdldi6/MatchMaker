package com.kosta.matchmaker.test;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.Service.BoardService;
import com.kosta.matchmaker.domain.BoardVO;
import com.mysql.fabric.xmlrpc.base.Array;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardServiceTest {

	@Inject
	private BoardService service;

	@Test
	public void testRegist() throws Exception {

		BoardVO board = new BoardVO();

		board.setTitle("서비스 테스트");
		board.setContent("성공적");
		board.setWriter("다음으로");

		service.regist(board);

	}

	@Test
	public void testReadAll() throws Exception {

		List<BoardVO> list = service.readAll();

		if (list == null) {
			System.out.println("없다");
		}

		for (BoardVO board : list) {
			System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
					+ board.getRegdate() + "\t" + board.getHit());
		}
	}

	@Test
	public void testModify() throws Exception{
		
		BoardVO board = new BoardVO();
		
		board.setBno(2);
		board.setTitle("서비스 수정 테스트");
		board.setContent("성공적");
		board.setWriter("다음으로");
		
		service.modify(board);
		
	}
	
	@Test
	public void testRemove() throws Exception{
		
		service.remove(3);
		
	}
	
	@Test
	public void testReadOne() throws Exception{
		
		BoardVO board = service.readOne(2);
		
		System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
				+ board.getRegdate() + "\t" + board.getHit());
	}
	
	
}
