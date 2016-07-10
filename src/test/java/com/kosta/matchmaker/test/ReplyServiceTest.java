package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.service.ReplyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyServiceTest {

	private int bno = 1;
	private int ano = 1;
	private int rno;
	private int page = 1;
	private int perPageNum = 5;

	@Inject
	private ReplyService service;

	@Test
	public void testAdd() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setBno(bno);
		reply.setAno(ano);
		reply.setReplytext("나랑_미친듯_놀자~!");
		reply.setReplyer("jyt");

		service.addReply(reply);
	}

	@Test
	public void modify() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setRno(7);
		reply.setReplytext("서비스도 수정됐다...ㅠㅠ");

		service.modifyReply(reply);
	}

	@Test
	public void delete() throws Exception {
		service.removeReply(5);
	}

}