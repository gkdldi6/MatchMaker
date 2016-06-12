package com.kosta.matchmaker.service;

import com.kosta.matchmaker.domain.MessageVO;

public interface MessageService {
	public void addMessage(MessageVO vo) throws Exception;
	
	public MessageVO readMessage(String targetid, Integer mid) throws Exception;
}
