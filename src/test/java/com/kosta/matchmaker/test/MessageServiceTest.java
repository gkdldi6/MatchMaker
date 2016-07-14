package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.service.MessageService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MessageServiceTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	@Inject
	private MessageService service;
	
	@Test
	public void servicePaging() throws Exception{
		String targetid = "sunjoong91";
		int page = 1;

		List<MessageVO> list = service.idReadAll(targetid, page);
		
		for(MessageVO message : list) {
			System.out.print(message.getMno() + "\t");
			System.out.print(message.getTargetid() + "\t");
			//System.out.print(message.getReadpoint() + "\t");
			System.out.print(message.getSender() + "\t");
			System.out.print(message.getMessage() + "\t");
			System.out.print(message.getOpendate() + "\t");
			System.out.println(message.getSenddate() + "\t");
		}
	}
}
