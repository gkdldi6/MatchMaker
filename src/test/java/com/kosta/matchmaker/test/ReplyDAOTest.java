package com.kosta.matchmaker.test;

import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyDAOTest {

	@Inject
	private ReplyDAO dao;

	private int bno = 1;
	private int ano = 1;
	private int rno;
	private int page = 1;
	private int perPageNum = 5;

	@Test
	public void testCreate() throws Exception {
		System.out.println("sdfsdf");

		ReplyVO reply = new ReplyVO();
		reply.setBno(bno);
		reply.setAno(ano);
		reply.setReplytext("나랑 미친듯 놀자~!");
		reply.setReplyer("jyt");

		dao.create(reply);
	}

	// 리플라이 등록까지만 테스트 완료..ㅜ

	@Test
	public void testUpdate() throws Exception {

		rnoNum();

		ReplyVO reply = new ReplyVO();
		reply.setRno(rno);
		reply.setReplytext("수정됐다..ㅠㅠ");

		dao.update(reply);

	}

	@Test
	public void testDelete() throws Exception {

		rnoNum();
		dao.delete(rno);

	}

	@Test
	public void testGetano() throws Exception {

		rnoNum();
		dao.getAno(rno);

	}

	// rno 입력 중복코드
	public void rnoNum() throws Exception {
		Scanner scan = new Scanner(System.in);
		System.out.print("수정 또는 삭제할 댓글 번호를 입력 : ");
		rno = scan.nextInt();
		scan.close();
	}

}
