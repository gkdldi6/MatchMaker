package com.kosta.matchmaker.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.persistence.MessageDAO;
import com.kosta.matchmaker.persistence.PointDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;
	
	@Inject
	private PointDAO pointDAO;
	
	@Transactional
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		messageDAO.create(vo);
		pointDAO.updatePoint(vo.getSender(),10);
	}

	@Override
	public MessageVO readMessage(String targetid, Integer mid) throws Exception {
		
		messageDAO.updateState(mid);
		pointDAO.updatePoint(targetid, 5);
		
		return messageDAO.readMessage(mid);
	}

}
