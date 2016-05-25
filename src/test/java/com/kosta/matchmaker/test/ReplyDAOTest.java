package com.kosta.matchmaker.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.ReplyVO;
import com.kosta.matchmaker.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyDAOTest {

	@Inject
	private ReplyDAO dao;

	@Test
	public void testCreate() throws Exception {

		ReplyVO reply = new ReplyVO();
		reply.setBno(1);
		reply.setReplytext("나랑 미친듯 놀자~!");
		reply.setReplyer("jyt");

		dao.create(reply);
	}

	@Test
	public void testList() throws Exception {
		ReplyVO reply = new ReplyVO();
		reply.setBno(1);
		reply.setRno(1);

		dao.list(1);

	}

	@Test
	public void testUpdate() throws Exception {

		ReplyVO reply = new ReplyVO();
		reply.setRno(3);
		reply.setReplytext("수정됐다..ㅠㅠ");
		// reply.setReplyer("KuKluxKlan");

		dao.update(reply);

	}

	@Test
	public void testDelete() throws Exception {

		dao.delete(3);

	}

}
