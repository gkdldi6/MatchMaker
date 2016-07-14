package com.kosta.matchmaker.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "admin";
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

	// 인터셉터..
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		String dest = "/admin";
		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object adminVO = modelMap.get("adminVO");


		if (adminVO != null) {
			logger.info("new login success");
			session.setAttribute(LOGIN, adminVO);

			dest = "/admin/adminview";
		}
		response.sendRedirect(dest);
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}

}