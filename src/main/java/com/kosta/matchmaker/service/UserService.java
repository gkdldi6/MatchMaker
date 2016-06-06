package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.UserVO;

public interface UserService {

	// 회원 로그인
	public UserVO login(LoginDTO dto) throws Exception;

	// 회원 가입
	public void join(UserVO user) throws Exception;

	// 회원 전체조회
	public List<UserVO> selectList() throws Exception;

	// 회원 한명 조회
	public UserVO selectOne(String userid, String userpw);

	// 회원 정보 수정
	public void update(UserVO user);

	// 회원 삭제
	public void delete(String userid, String userpw);
	
	//아이디 중복 검사
	public int userIdCheck(String userid);
	
}
