package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.MessageVO;
import com.kosta.matchmaker.persistence.MessageDAO;
import com.kosta.matchmaker.persistence.UserDAO;

@Service
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO messageDAO;
	
	@Inject
	private UserDAO userdao;
	
	@Transactional
	@Override
	public void addMessage(MessageVO vo) throws Exception {
		messageDAO.create(vo);
		
		String userid = vo.getSender();
		int point = 30;
		
		userdao.userPoint(userid, point);
	}

	@Override
	public List<MessageVO> readAll() throws Exception {
		return messageDAO.readAll();
	}

	@Override
	public List<MessageVO> idReadAll(String targetid,int page) throws Exception {
		return messageDAO.idReadAll(targetid, page);
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
	public int messageCount(String targetid) throws Exception {
		return messageDAO.messageCount(targetid);
	}

	@Override
	public List<MessageVO> idReadListCriteria(String targetid, Criteria cri) throws Exception {
		return messageDAO.idReadListCriteria(targetid, cri);
	}

	@Override
	public int notReadMessageCount(String targetid) throws Exception {
		return messageDAO.notReadMessageCount(targetid);
	}

	@Override
	public List<MessageVO> notReadMessage(String targetid) throws Exception {
		return messageDAO.notReadMessage(targetid);
	}
	
}