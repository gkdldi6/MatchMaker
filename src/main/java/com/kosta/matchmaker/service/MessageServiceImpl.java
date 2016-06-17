package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.persistence.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;
	
	@Transactional
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		messageDAO.create(vo);
	}

	@Override
	public List<MessageVO> readAll() throws Exception {
		return messageDAO.readAll();
	}

	@Override
	public List<MessageVO> idReadAll(String targetid) throws Exception {
		return messageDAO.idReadAll(targetid);
	}

	@Override
	public MessageVO readOne(Integer mno) throws Exception {
		return messageDAO.readOne(mno);
	}

	@Override
	public void delete(Integer mno) throws Exception {
		messageDAO.delete(mno);
	}

	@Override
	public void updateDate(Integer mno) throws Exception {
		messageDAO.updateDate(mno);
	}

	@Override
	public String messageCount(String targetid) throws Exception {
		return messageDAO.messageCount(targetid);
	}
	
	
	
}
