package com.griptk.b2b.util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import com.griptk.b2b.common.domain.MenuVO;
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
		
		MenuVO menu = menuMng.getMenuFromURL(url);
		
		String template = menu.getTemplate_id();
		String menu_path = menu.getMenu_path();
		String id_path = menu.getId_path();
		String title = menu.getMenu_nm();
		
		request.setAttribute("page_title",title);
		request.setAttribute("page_path",menu_path);
		
		if(template != null) {
			switch(template) {
				case ITemplateType.LOGIN_TEMPLATE:
					break;
				case ITemplateType.MAIN_TEMPLATE:
					if(id_path.indexOf("mypage") > -1) {
						request.setAttribute("side_title", title);
						request.setAttribute("side_menus", menuMng.listSubMenu("mypage", "L"));
					}
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
