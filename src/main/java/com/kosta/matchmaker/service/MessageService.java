package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.MessageVO;

public interface MessageService {
	//쪽지보내기
	public void addMessage(MessageVO vo) throws Exception;
	
	//쪽지 읽기
	public List<MessageVO> readAll() throws Exception;
	
	//아이디 쪽지 읽기
	public List<MessageVO> idReadAll(String targetid,int page) throws Exception;
	
	//쪽지 조회처리
	public MessageVO readOne(Integer mno) throws Exception;
	
	//쪽지 삭제 처리
	public void delete(Integer mno) throws Exception;
	
	//opendate 업데이트 처리
	public void updateDate(Integer mno) throws Exception;

	//쪽지 개수 처리
	public int messageCount (String targetid) throws Exception;
	
	//쪽지 페이징처리 
	public List<MessageVO> idReadListCriteria(String targetid, Criteria cri) throws Exception;

	//읽지않은 쪽지 확인
	public int notReadMessageCount (String targetid) throws Exception;
}