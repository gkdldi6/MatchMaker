package com.kosta.matchmaker.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kosta.matchmaker.domain.UserVO;

public class HomeInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler
			)throws Exception {
		HttpSession session = request.getSession();
		
		UserVO user = (UserVO) session.getAttribute("login");
		
		if(user == null) {
			return true;
		}

		response.sendRedirect("/users/" + user.getUserid());
		return false;
	}
	
}
