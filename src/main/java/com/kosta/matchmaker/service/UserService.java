package com.kosta.matchmaker.service;

import java.util.List;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.PlayerVO;
import com.kosta.matchmaker.domain.UserVO;

import net.tanesha.recaptcha.ReCaptchaImpl;

public interface UserService {

	// 회원 로그인
	public UserVO login(LoginDTO dto) throws Exception;

	// 회원 가입
	public void join(UserVO user) throws Exception;
	
	// 선수 가입
	public void playerJoin(PlayerVO player) throws Exception;

	// 회원 전체조회
	public List<UserVO> selectList() throws Exception;

	// 아이디로 회원정보 불러오기
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
	
	/*//아이디로 글쓴정보 불러오기
	public List<ArticleVO> articleList(String userid) throws Exception;
*/
	//아이디로 글쓴정보 불러온후 페이징
	public List<ArticleVO> articleList(String userid, Criteria cri) throws Exception;
	
	//글쓴 개수 확인
	public int articleCount(String userid);
	
	//회원 포인트 관리
	public void userPoint(String userid, int point) throws Exception;

}