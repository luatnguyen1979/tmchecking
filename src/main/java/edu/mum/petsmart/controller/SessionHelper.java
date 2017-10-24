package edu.mum.petsmart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import edu.mum.petsmart.domain.Login;
import edu.mum.petsmart.service.LoginService;

@Component
public class SessionHelper {
	
	public static final String USER_KEY="user";

	@Autowired
	private LoginService userService;
	
	@Autowired
	private HttpSession session;
	
	public Login getLoginUser() {
		Login u = (Login)session.getAttribute(USER_KEY);
		if(null == u) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			UserDetails ud = (UserDetails)auth.getPrincipal();
			u = userService.findByUsername(ud.getUsername());
			session.setAttribute(USER_KEY, u);
			u = (Login)session.getAttribute(USER_KEY);
		}
		return u;
	}
	
	public Login reloadLoginUser() {
		Login u = (Login)session.getAttribute(USER_KEY);
		if(null != u) {
			u = userService.findOne(u.getId()) ;
			session.setAttribute(USER_KEY, u);
			u = (Login)session.getAttribute(USER_KEY);
		}
		return u;
	}
}
