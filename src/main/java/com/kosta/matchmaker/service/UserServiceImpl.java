package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.ArticleVO;
import com.kosta.matchmaker.domain.Criteria;
import com.kosta.matchmaker.domain.LoginDTO;
import com.kosta.matchmaker.domain.PlayerVO;
import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.persistence.UserDAO;
import com.kosta.matchmaker.util.work.crypt.BCrypt;
import com.kosta.matchmaker.util.work.crypt.SHA256;

import net.tanesha.recaptcha.ReCaptchaImpl;

@Service
public class UserServiceImpl implements UserService {

	SHA256 sha = SHA256.getInsatnce();

	@Inject
	private UserDAO dao;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		if (dao.login(dto) != null) {

			String orgPass = dto.getUserpw();
			String shaPass = sha.getSha256(orgPass.getBytes());
			dto.setUserpw(shaPass);

			UserVO user = dao.selectId(dto.getUserid());
			String dbpasswd = user.getUserpw();

			if (BCrypt.checkpw(shaPass, dbpasswd)) {
				String userid = dto.getUserid();
				int point = 10;
				dao.userPoint(userid, point);
				return dao.login(dto);
			}
		}
		
		return null;
	}

	@Override
	public void join(UserVO user) throws Exception {

		String orgPass = user.getUserpw();
		String shaPass = sha.getSha256(orgPass.getBytes());
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());

		user.setUserpw(bcPass);

		dao.join(user);
	}

	@Override
	public void playerJoin(PlayerVO player) throws Exception {

		String orgPass = player.getUserpw();
		String shaPass = sha.getSha256(orgPass.getBytes());
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());

		player.setUserpw(bcPass);
		
		dao.join(player);
		dao.playerJoin(player);
	}
	
	@Override
	public List<UserVO> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public UserVO selectId(String userid) {
		return dao.selectId(userid);
	}

	@Override
	public void update(UserVO user) throws Exception {
		String orgPass = user.getUserpw();
		String shaPass = sha.getSha256(orgPass.getBytes());
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		user.setUserpw(bcPass);
		
		dao.update(user);
	}

	@Override
	public void delete(String userid)throws Exception {
		UserVO user = dao.selectId(userid);
		
		String orgPass = user.getUserpw();
		String shaPass = sha.getSha256(orgPass.getBytes());
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		user.setUserpw(bcPass);
		
		dao.delete(userid);
	}

	@Override
	public int userIdCheck(String userid) {
		// result :0 - 중복 1 - 중복 아님
		int result = dao.userIdCheck(userid);

		return result;
	}

	@Override
	public ReCaptchaImpl reCaptcha() {

		ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
		reCaptcha.setPrivateKey("6Lf0DSITAAAAAGN2lOkpGqTwgV_9SZGNZbMc9hug");

		return reCaptcha;
	}

	@Override
	public int userAuth(String userid, String userpw) throws Exception {

		UserVO user = dao.selectId(userid);
		String dbPass = user.getUserpw();

		String orgPass = userpw;
		String shaPass = sha.getSha256(orgPass.getBytes());

		if (BCrypt.checkpw(shaPass, dbPass)) {
			return 1;
		}
		return 0;
	}

	@Override
	public UserVO findId(String username, String email) throws Exception {
		UserVO user = dao.findId(username, email);
		
		if(user != null){
			return user;
		}
		
		return null;
	}

	@Override
	public UserVO findPassword(String username, String userid, String email) throws Exception {
		UserVO user = dao.findPassword(username, userid, email);
		
		if(user != null){
			return user;
		}
		return null;
	}
	/*
	@Override
	public List<ArticleVO> articleList(String userid) throws Exception {
		return dao.articleList(userid);
	}*/

	@Override
	public List<ArticleVO> articleList(String userid, Criteria cri) throws Exception {
		return dao.articleList(userid, cri);
	}

	@Override
	public int articleCount(String userid) {
		return dao.articleCount(userid);
	}

	@Override
	public void userPoint(String userid, int point) throws Exception {
		dao.userPoint(userid, point);
	}
}