package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.AdminVO;
import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.UserVO;

public interface AdminDAO {

	// 관리자 로그인
	public AdminVO login(String id, String pw) throws Exception;

	// 회원 전체조회
	public List<UserVO> selectList(Criteria cri) throws Exception;

	// 회원수 카운트
	public int countUser() throws Exception;

	// 회원 한명 조회
	public UserVO selectOne(String userid);

	// 회원 삭제
	public void delete(String userid);

}
