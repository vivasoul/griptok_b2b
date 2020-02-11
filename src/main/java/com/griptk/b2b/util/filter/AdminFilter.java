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
import javax.servlet.http.HttpSession;

public class AdminFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = ((HttpServletRequest)request).getSession();
		String auth_type = (String) session.getAttribute("auth_type");
		
		if("M".equals(auth_type)) {
			chain.doFilter(request, response);
		}else {
			((HttpServletResponse) response).sendRedirect("/main");
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
