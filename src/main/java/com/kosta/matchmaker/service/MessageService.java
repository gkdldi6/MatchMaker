package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.MessageVO;

public interface MessageService {
	//쪽지보내기
	public void addMessage(MessageVO vo) throws Exception;
	
	//쪽지 읽기
	public List<MessageVO> readAll() throws Exception;
}
