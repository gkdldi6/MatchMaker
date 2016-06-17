package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.BoardVO;
import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.persistence.MessageDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MessageDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Inject
	private MessageDAO dao;

	@Test
	public void testRegister() throws Exception {

		MessageVO message = new MessageVO();

		message.setTargetid("user00");
		message.setReadpoint(0);
		message.setSender("user01");
		message.setMessage("123123");

		dao.create(message);

	}
	
	
	@Test
	public void MessageList() throws Exception {
		
		List<MessageVO> list = dao.readAll();
		
		for(MessageVO message : list) {
			System.out.print(message.getMno() + "\t");
			System.out.print(message.getTargetid() + "\t");
			System.out.print(message.getReadpoint() + "\t");
			System.out.print(message.getSender() + "\t");
			System.out.print(message.getMessage() + "\t");
			System.out.print(message.getOpendate() + "\t");
			System.out.println(message.getSenddate() + "\t");
		}
		
	}
	
	@Test
	public void IdMessageList() throws Exception{
		String id = "user00";
		
		List<MessageVO> list = dao.idReadAll(id);
		
		for(MessageVO message : list) {
			System.out.print(message.getMno() + "\t");
			System.out.print(message.getTargetid() + "\t");
			System.out.print(message.getReadpoint() + "\t");
			System.out.print(message.getSender() + "\t");
			System.out.print(message.getMessage() + "\t");
			System.out.print(message.getOpendate() + "\t");
			System.out.println(message.getSenddate() + "\t");
		}
		
	}
	
	@Test
	public void MessageOneRead() throws Exception{
		int mno = 1;
		
		MessageVO message = dao.readOne(mno);
		
		System.out.print(message.getMno() + "\t");
		System.out.print(message.getTargetid() + "\t");
		System.out.print(message.getReadpoint() + "\t");
		System.out.print(message.getSender() + "\t");
		System.out.print(message.getMessage() + "\t");
		System.out.print(message.getOpendate() + "\t");
		System.out.println(message.getSenddate() + "\t");
	}
	
	@Test
	public void MessageDelete() throws Exception{
		int mno = 1;
		dao.delete(mno);
	}
	
	@Test
	public void OpendateUpdate() throws Exception{
		int mno = 4;
		dao.updateDate(mno);
	}
}
