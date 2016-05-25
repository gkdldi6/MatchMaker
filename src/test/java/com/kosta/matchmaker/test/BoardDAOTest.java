package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

	@Inject
	private BoardDAO dao;

	@Test
	public void testCreate() throws Exception {

		BoardVO board = new BoardVO();

		board.setTitle("제목입니다");
		board.setContent("내용입니다");
		board.setWriter("작성자입니다");

		dao.create(board);
	}

	@Test
	public void testReadAll() throws Exception {
		List<BoardVO> list = dao.readAll();

		if (list == null) {
			System.out.println("없다");
		}

		for (BoardVO board : list) {
			System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
					+ board.getRegdate() + "\t" + board.getHit());
		}
	}

}
