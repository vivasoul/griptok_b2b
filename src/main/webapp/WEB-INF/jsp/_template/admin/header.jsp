<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%@ page import="com.griptk.b2b.product.domain.*" %>
<%
	List<MenuVO> top_menus = (List<MenuVO>)request.getAttribute("top_menus");
	List<MenuVO> menu_hierarchy = (List<MenuVO>)request.getAttribute("menu_hierarchy");
	int len = menu_hierarchy.size();
	MenuVO start_menu = len > 1 ? menu_hierarchy.get(1) : null; 
	MenuVO side_menu  = len > 2 ? menu_hierarchy.get(2) : null;
%>
<div class="container-fluid griptok-admin-header ">
	<div class="header-left">
		<div class="header-left-left">
			<img src="/img/admin/header_logo.png"/>
		</div>
		<div class="header-left-right">
			<span style="font-size:12px;font-weight:900">그립톡 비투비 쇼핑몰 관리자 페이지입니다.</span><br/>
			<span style="font-size:9px">그립톡 B2B 쇼핑몰 관련 사항들을 제어하는 페이지입니다.</span>
		</div>
	</div><!-- 
 --><div class="header-right">
 		<div class="top-right-menu">
 			<a href="/sign-out"><img src="/img/admin/top_meun_a.png"/><span>로그아웃</span></a>	
 		</div>
		<div class="top-right-menu">
			<a href="#"><img src="/img/admin/top_meun_b.png"/><span>내정보</span></a>
		</div>
		<div class="top-right-menu">
			<a href="/main"><img src="/img/admin/top_meun_c.png"/><span>쇼핑몰로 이동 하기</span></a>
		</div>
	</div>
</div>