package com.kosta.matchmaker.persistence;

import java.util.List;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.PlayerVO;
import com.kosta.matchmaker.domain.UserVO;

public interface UserDAO {

	// 회원 로그인
	public UserVO login(LoginDTO dto) throws Exception;

	// 회원 가입
	public void join(UserVO user) throws Exception;
	
	// 선수 가입
	public void playerJoin(PlayerVO player) throws Exception;
	
	// 선수 조회
	public PlayerVO selectPlayer(String userid) throws Exception;

	// 회원 전체조회
	public List<UserVO> selectList() throws Exception;

	// 회원 한명 조회
	public UserVO selectOne(String userid, String userpw);

	// 회원 정보 수정
	public void update(UserVO user);

	// 회원 삭제
	public void delete(String userid);

	// 아이디로 user정보
	public UserVO selectId(String userid);

	// 아이디 중복 검사
	public int userIdCheck(String userid);

	// ID 찾기 -> 이름과 이메일로
	public UserVO findId(String username, String email);

	// Password찾기 -> 이름과 아이디와 이메일로
	public UserVO findPassword(String username, String userid, String email);

/*	// 아이디로 글쓴정보 불러오기
	public List<ArticleVO> articleList(String userid) throws Exception;
 	*/
	//아이디로 글쓴정보 불러오고 페이징 처리
	public List<ArticleVO> articleList(String userid, Criteria cri) throws Exception;
	
	//글쓴 갯수 확인
	public int articleCount(String userid);
	
	//유저 포인트 관리
	public void userPoint(String userid, int point) throws Exception;
	
	//게시판 좋아요 누르기
	public void clickLike(String userid, Integer bno, Integer ano) throws Exception;
	
	//좋아요 눌렀는지 확인하기
	public int checkLike(String userid, Integer bno, Integer ano) throws Exception;
	
}