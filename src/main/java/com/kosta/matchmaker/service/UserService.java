package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.UserVO;

import net.tanesha.recaptcha.ReCaptchaImpl;

public interface UserService {

	// 회원 로그인
	public UserVO login(LoginDTO dto) throws Exception;

	// 회원 가입
	public void join(UserVO user) throws Exception;

	// 회원 전체조회
	public List<UserVO> selectList() throws Exception;

	// 회원 한명 조회
	public UserVO selectId(String userid);

	// 회원 정보 수정
	public void update(UserVO user) throws Exception;

	// 회원 삭제
	public void delete(String userid) throws Exception;
	
	//아이디 중복 검사
	public int userIdCheck(String userid);
	
	//캡챠
	public ReCaptchaImpl reCaptcha();
	
	//회원 인증(비밀번호 바꾸기전에 이전 비밀번호 확인)
	public int userAuth(String userid, String userpw) throws Exception;
	
	//ID찾기 -> 이름,이메일
	public UserVO findId(String username, String email) throws Exception;
	
	//Password찾기 -> 이름,아이디,이메일
	public UserVO findPassword(String username, String userid, String email) throws Exception;
	

}
