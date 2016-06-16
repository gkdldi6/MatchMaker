package com.kosta.matchmaker.test;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.matchmaker.domain.UserVO;
import com.kosta.matchmaker.persistence.UserDAO;
import com.kosta.matchmaker.util.work.crypt.BCrypt;
import com.kosta.matchmaker.util.work.crypt.SHA256;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class UserDAOTest {
	
	SHA256 sha = SHA256.getInsatnce();
	
	@Inject
	private UserDAO dao;
	
	@Test
	public void testJoin()throws Exception{
		
		UserVO user = new UserVO();
		user.setUserid("user03");
		user.setUserpw("user01");
		user.setUsername("user01");
		user.setEmail("user00@user.com");
		user.setUserage(25);
		user.setUserinfo("테스트");
		
		String orgPass = user.getUserpw();
	    String shaPass = sha.getSha256(orgPass.getBytes());
		String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		user.setUserpw(bcPass);
		
		dao.join(user);
	}
	
	@Test
	public void testSelectList() throws Exception {
		
		List<UserVO> list = dao.selectList();
		
		for(UserVO user : list) {
			System.out.print(user.getUserid() + "\t");
			System.out.print(user.getUserpw() + "\t");
			System.out.print(user.getUsername() + "\t");
			System.out.print(user.getEmail() + "\t");
			System.out.print(user.getRegdate() + "\t");
			System.out.print(user.getUserage() + "\t");
			System.out.println(user.getUserinfo() + "\t");
		}
		
	}
	@Test
	public void testSelectOne() throws Exception {
		
		UserVO user = dao.selectId("user01");
		
		String passwd = "user01";
		
		String orgPass = passwd;
        String shaPass = sha.getSha256(orgPass.getBytes());
        
        String dbpasswd= user.getUserpw();
        
        if(BCrypt.checkpw(shaPass,dbpasswd) && user.getUserid().equals("user01")){
	
			System.out.print(user.getUserid() + "\t");
			System.out.print(user.getUserpw() + "\t");
			System.out.print(user.getUsername() + "\t");
			System.out.print(user.getEmail() + "\t");
			System.out.print(user.getRegdate() + "\t");
			System.out.print(user.getUserage() + "\t");
			System.out.println(user.getUserinfo());
        }
	}
	
	
	@Test
	public void testUpdate() throws Exception {
		UserVO user = dao.selectId("user01");
		
		String passwd = "user01";
		
		String orgPass = passwd;
        String shaPass = sha.getSha256(orgPass.getBytes());
        
        String dbpasswd= user.getUserpw();
        
        if(BCrypt.checkpw(shaPass,dbpasswd) && user.getUserid().equals("user01")){
		
			//아이디와 비밀번호로 나머지 수정 ->등록일과 유저 나이는 수정 x
			user.setUserid("user01");
			user.setUsername("수정된놈");
			user.setEmail("Update@update.com");
			user.setUserinfo("수정된놈");
			
			dao.update(user);
	     }else{
	    	 System.out.println("asdfs");
	     }
	}
	
	@Test
	public void testDelete() throws Exception {
		
		dao.delete("1234", "1234");
		
	}
	@Test
	public void testUserIdCheck() throws Exception{
		String userid = "user01";
		int result = dao.userIdCheck(userid);
		if(result == 0){
			System.out.println("아이디 사용 불가");
		}else{
			System.out.println("아이디 사용 가능");
		}
	}
}
