package com.kosta.matchmaker.test;

import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.service.ReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyServiceTest {

	@Inject
	private ReplyService service;

	@Test
	public void testAdd() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setBno(1);
		reply.setReplytext("나랑_미친듯_놀자~!");
		reply.setReplyer("jyt");

		service.addReply(reply);
	}

	@Test
	public void testList2() throws Exception {

		Scanner scanner = new Scanner(System.in);
		System.out.println("본글 번호를 입력하세요.");
		int bno = scanner.nextInt();
		scanner.close();

		List<ReplyVO> list = service.listReply(bno);

		for (ReplyVO reply : list) {
			System.out.println(reply.toString());
		}
	}

	@Test
	public void testList() throws Exception {

		List<ReplyVO> list = service.listReply(1);

		for (ReplyVO reply : list) {
			System.out.println(reply.toString());
		}

	}

	@Test
	public void modify() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setRno(1);
		reply.setReplytext("서비스도 수정됐다..ㅠㅠ");

		service.modifyReply(reply);
	}

	@Test
	public void delete() throws Exception {
		service.deleteReply(1);
	}

}
