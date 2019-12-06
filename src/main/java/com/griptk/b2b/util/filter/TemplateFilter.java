package com.griptk.b2b.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.griptk.b2b.util.manager.CategoryManager;
import com.griptk.b2b.util.manager.MenuManager;

public class TemplateFilter implements Filter{
	private MenuManager menuMng;
	private CategoryManager categoryMng;
	
	public TemplateFilter(MenuManager menuMng, CategoryManager categoryMng) {
		this.menuMng = menuMng;
		this.categoryMng = categoryMng;
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		request.setAttribute("top_menus", menuMng.getLogined());
		request.setAttribute("brands_filter", categoryMng.getParentBrands());
		request.setAttribute("crafts_filter", categoryMng.getCrafts());
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
