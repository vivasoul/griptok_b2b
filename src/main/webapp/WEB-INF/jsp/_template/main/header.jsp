<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%@ page import="com.griptk.b2b.product.domain.*" %>

<%	
	List<MenuVO> top_menus = (List<MenuVO>)request.getAttribute("top_menus");
	List<CraftTypeVO> crafts_filter = (List<CraftTypeVO>)request.getAttribute("crafts_filter");
	List<BrandTypeVO> brands_filter = (List<BrandTypeVO>)request.getAttribute("brands_filter");
	boolean isAdmin = session.getAttribute("auth_type") != null && "A".equals(session.getAttribute("auth_type").toString());
	
	String page_path = (String)request.getAttribute("page_path");
%>
<div class="container-fluid griptok-header">
	<div class="row">
		<div class="col-sm-4">
			<a href="/main"><img src="/img/common/head_logo_small.png"/></a>
		</div>
		<div class="col-sm-8" role="navigation">
			<nav class="nav top_menu">
				<%if(isAdmin){%><a class="nav-link" href="/admin/products">관리자</a><%}%><!-- 
			 --><%for(MenuVO menu: top_menus){ %><a class="nav-link" href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a><%}%>
			</nav>
		</div>		
	</div>
	<div class="row">
		<div class="col-sm-7">
			<nav class="nav cat_filter left_filter">
			  <a class="nav-link" href="/main/all">전체 상품(All)</a><!--
			  --><%for(CraftTypeVO craft: crafts_filter){ %><a class="nav-link" href="/main/craft?p_id=<%=craft.getCraft_no()%>"><%=craft.getCraft_nm()%></a><%}%><!-- 
		   --><a class="nav-link" href="/main/dc">특가상품</a>
			</nav>			
		</div>
		<div class="col-sm-5">
			<nav class="nav cat_filter right_filter">
			  <%for(BrandTypeVO brand: brands_filter){ %><a class="nav-link" href="/main/brand?p_id=<%=brand.getBrand_no()%>"><%=brand.getBrand_nm()%></a><%}%>
			</nav>			
		</div>
	</div>
	<%if(page_path!=null){%><div class="row"><div class="col-sm-12" id="griptok-page-path"><%=page_path%></div></div><%}%>	
		
</div>