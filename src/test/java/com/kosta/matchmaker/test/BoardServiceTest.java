package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.service.BoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardServiceTest {

	@Inject
	private BoardService service;

	@Test
	public void testRegister() throws Exception {

		ArticleVO board = new ArticleVO();

		board.setTitle("서비스 테스트");
		board.setContent("성공적");
		board.setWriter("다음으로");

		service.register(board);

	}

	@Test
	public void testReadAll() throws Exception {

		List<ArticleVO> list = service.readAll();

		if (list == null) {
			System.out.println("없다");
		}

		for (ArticleVO board : list) {
			System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
					+ board.getRegdate() + "\t" + board.getHit());
		}
	}

	@Test
	public void testModify() throws Exception {

		ArticleVO board = new ArticleVO();

		board.setBno(2);
		board.setTitle("서비스 수정 테스트 zzzzzzzzzz");
		board.setContent("성공적");
		board.setWriter("다음으로");

		service.modify(board);

	}

	@Test
	public void testRemove() throws Exception {

		service.remove(2);

	}

	@Test
	public void testReadOne() throws Exception {

		ArticleVO board = service.readOne(2);

		System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
				+ board.getRegdate() + "\t" + board.getHit());
	}

}
