package com.griptk.b2b.util.filter;

import java.io.IOException;
import java.util.List;

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
		boolean isLogined = ((HttpServletRequest)request).getSession().getAttribute("user_no") != null;
		
		String url = ((HttpServletRequest)request).getRequestURI();		
		
		MenuVO menu = menuMng.getMenuFromURL(url);
		String id = menu.getMenu_id();
		String template = menu.getTemplate_id();
		String menu_path = menu.getMenu_path();
		String id_path = menu.getId_path();
		String title = menu.getMenu_nm();
		List<MenuVO> menu_hierarchy = menuMng.getMenuHierarchyFromURL(url);
		if(!id.equals("shop_main")) {
			request.setAttribute("page_title",title);
			request.setAttribute("page_path",menu_path);
		}
		if(template != null) {
			request.setAttribute("menu_hierarchy", menu_hierarchy);
			
			switch(template) {
				case ITemplateType.LOGIN_TEMPLATE:
					break;
				case ITemplateType.MAIN_TEMPLATE:
					request.setAttribute("top_menus", isLogined ? menuMng.getLogined() : menuMng.getNotLogined());
					if(id_path.indexOf("mypage") > -1) {
						request.setAttribute("side_id", id);
						request.setAttribute("side_title", "마이페이지");
						request.setAttribute("side_menus", menuMng.listSubMenu("mypage", isLogined ? "L" : "N"));
					}
					request.setAttribute("brands_filter", categoryMng.getParentBrands());
					request.setAttribute("crafts_filter", categoryMng.getCrafts());				
					break;
				case ITemplateType.ADMIN_TEMPLATE:
					/* Need to update to top menus for admin only */
					request.setAttribute("top_menus", menuMng.listSubMenu("admin_root", "M"));
					if(menu_hierarchy.size() > 1) {
						MenuVO start_menu = menu_hierarchy.get(1);
						request.setAttribute("side_menus", menuMng.listSubMenuWithChild("admin_root", "M"));						
					}
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
