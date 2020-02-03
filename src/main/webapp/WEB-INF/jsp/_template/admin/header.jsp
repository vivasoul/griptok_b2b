<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%@ page import="com.griptk.b2b.product.domain.*" %>

<%
	String page_path = (String)request.getAttribute("page_path");
%>
<div class="container-fluid griptok-header most-top-menus">
	<a href="/admin/login">로그아웃</a>
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
	<%if(page_path!=null){%><div class="row"><div class="col-sm-12" id="griptok-page-path"><%=page_path%></div></div><%}%>
</div>