package com.kosta.matchmaker.test;

import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.persistence.ArticleDAO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {

//	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

	@Inject
	private ArticleDAO dao;

	//새로운 설계 적용 부분
	@Test
	public void testCreate() throws Exception {
		
		ArticleVO board = new ArticleVO();
		
		board.setAno(2);
		board.setTitle("제목입니다");
		board.setContent("내용입니다");
		board.setWriter("작성자입니다");

		dao.create(board);
	}

	
//	@Test
//	public void testReadAll() throws Exception {
//		List<ArticleVO> list = dao.readAll();
//
//		if (list == null) {
//			System.out.println("없다");
//		}
//
//		for (ArticleVO board : list) {
//			System.out.println(board.getBno() + "\t" + board.getTitle() + "\t" + board.getWriter() + "\t"
//					+ board.getRegdate() + "\t" + board.getHit());
//		}
//	}

	@Test
	public void testUpdate() throws Exception {

		ArticleVO board = new ArticleVO();

		board.setBno(3);
		board.setTitle("zzzz");
		board.setContent("성공");
		board.setWriter("성공한자");

		dao.update(board);

	}

	@Test
	public void testURI() throws Exception {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/boards").queryParam("bno", 12)
				.queryParam("perPageNum", 20).build();

//		logger.info(uriComponents.toString());

	}

	@Test
	public void testaddAttach() throws Exception {

		Scanner sc = new Scanner(System.in);
		System.out.println("파일명 입력하시오");
		String fullName = sc.next();
		dao.addAttach(fullName);
		sc.close();
	}

	@Test
	public List<String> testList() throws Exception {

		return null;

	}

	@Test
	public void testdelete() throws Exception {

	}

	@Test
	public void testreplace() throws Exception {

	}

}
