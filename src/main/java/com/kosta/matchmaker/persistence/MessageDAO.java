package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.MessageVO;

public interface MessageDAO {

	//메시지 보내기
	public void create(MessageVO vo) throws Exception;

	//전체 쪽지 read
	public List<MessageVO> readAll() throws Exception;
	
	public void updateState(Integer mid) throws Exception;
}
