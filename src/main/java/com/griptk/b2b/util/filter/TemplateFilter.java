package com.griptk.b2b.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

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
		
		String url = ((HttpServletRequest)request).getRequestURI();		
		
		request.setAttribute("top_menus", menuMng.getLogined());
		
		String template = menuMng.getTemplateFromURL(url);
		
		if(template != null) {
			switch(template) {
				case ITemplateType.LOGIN_TEMPLATE:
					break;
				case ITemplateType.MAIN_TEMPLATE:
					request.setAttribute("brands_filter", categoryMng.getParentBrands());
					request.setAttribute("crafts_filter", categoryMng.getCrafts());				
					break;
				default:
					//DO NOTHING
			}
		}
		
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
