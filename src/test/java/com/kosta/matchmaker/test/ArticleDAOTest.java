package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.ArticleVO;
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

		board.setBno(1);
		board.setAno(5);
		board.setTitle("5");
		board.setContent("5");
		board.setWriter("5");

		dao.create(board);

	}

	@Test
	public void testList() throws Exception {

		List<ArticleVO> list = dao.readAll(01);

		if (list == null) {
			System.out.println("없다");
		}

		for (ArticleVO board : list) {
			System.out.println(board.getBno() + "\t" + board.getAno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
					+ board.getRegdate() + "\t" + board.getHit());
		}
	}

	@Test
	public void testReadOne() throws Exception {

		ArticleVO board = dao.readOne(1);

		System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
				+ board.getRegdate() + "\t" + board.getHit());

	}

	@Test
	public void testUpdate() throws Exception {

		ArticleVO board = new ArticleVO();

		board.setBno(1);
		board.setAno(1);
		board.setTitle("zzzz");
		board.setContent("성공");
		board.setWriter("성공한자sssss");

		dao.update(board);
	}

	@Test
	public void testDelete() throws Exception {

		dao.delete(5);
	}

}
