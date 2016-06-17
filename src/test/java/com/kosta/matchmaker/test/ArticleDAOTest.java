package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.kosta.matchmaker.domain.article.ArticleVO;
import com.kosta.matchmaker.persistence.ArticleDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })

public class ArticleDAOTest {

	@Inject
	private ArticleDAO dao;

	@Test
	public void testCreate() throws Exception {
		System.out.println("sdfsdf");
		ArticleVO board = new ArticleVO();

		board.setBno(01);
		board.setAno(3);
		board.setTitle("제목입니다");
		board.setContent("내용입니다");
		board.setWriter("작성자입니다");

		dao.freecreate(board);

	}

	@Test
	public void testList() throws Exception {

		List<ArticleVO> list = dao.freereadAll();

		if (list == null) {
			System.out.println("없다");
		}

		for (ArticleVO board : list) {
			System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
					+ board.getRegdate() + "\t" + board.getHit());
		}
	}

	@Test
	public void testReadOne() throws Exception {

		ArticleVO board = dao.freereadOne(2);

		System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
				+ board.getRegdate() + "\t" + board.getHit());

	}

	@Test
	public void testUpdate() throws Exception {

		ArticleVO board = new ArticleVO();

		board.setBno(2);
		board.setTitle("zzzz");
		board.setContent("성공");
		board.setWriter("성공한자sssss");

		dao.freeupdate(board);
	}

	@Test
	public void testDelete() throws Exception {

		dao.freedelete(2);
	}

}
