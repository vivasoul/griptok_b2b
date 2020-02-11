<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%@ page import="com.griptk.b2b.product.domain.*" %>
<%
	List<MenuVO> top_menus = (List<MenuVO>)request.getAttribute("top_menus");
	List<MenuVO> menu_hierarchy = (List<MenuVO>)request.getAttribute("menu_hierarchy");
	int len = menu_hierarchy.size();
	MenuVO menu_lv2 = len > 1 ? menu_hierarchy.get(1) : null; 
	MenuVO menu_lv3 = len > 2 ? menu_hierarchy.get(2) : null;
%>
<div class="container-fluid griptok-header most-top-menus">
	<a href="/sign-out">로그아웃</a>
	<span class="slash-seperator">/</span>
	<a href="/admin/notice">B2B공지</a>
</div>
<div class="most-top-baseline"></div>
<div class="container-fluid griptok-header">
	<div class="row">
		<div class="col-sm-12">
			<a href="/main"><img src="/img/common/head_logo_small.png"/></a>
		</div>
	</div>
</div>
<div class="griptok-start-menus">
<%for(MenuVO menu: top_menus){ %><a href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a><%}%> 
</div>   