package com.kosta.matchmaker.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.matchmaker.domain.LoginDTO;
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
				return dao.login(dto);
			}
		} else {
			return null;
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


}
