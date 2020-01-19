package com.griptk.b2b.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		boolean isLogined = ((HttpServletRequest)request).getSession().getAttribute("user_no") != null;
		
		if(isLogined) {
			chain.doFilter(request, response);
		}else {
			((HttpServletResponse) response).sendRedirect("/");
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
