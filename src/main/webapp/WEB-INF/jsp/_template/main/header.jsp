<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%@ page import="com.griptk.b2b.product.domain.*" %>

<%	
	List<MenuVO> top_menus = (List<MenuVO>)request.getAttribute("top_menus");
	List<CraftTypeVO> crafts_filter = (List<CraftTypeVO>)request.getAttribute("crafts_filter");
	List<BrandTypeVO> brands_filter = (List<BrandTypeVO>)request.getAttribute("brands_filter");
%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-4">
			<img src="/img/common/head_logo_small.png"/>
		</div>
		<div class="col-sm-8" role="navigation">
			<nav class="nav top_menu">
				<%for(MenuVO menu: top_menus){ %><a class="nav-link" href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a><%}%>
			</nav>
		</div>		
	</div>
	<div class="row">
		<div class="col-sm-7">
			<nav class="nav cat_filter left_filter">
			  <a class="nav-link" href="#">전체 상품(All)</a><!--
			  --><%for(CraftTypeVO craft: crafts_filter){ %><a class="nav-link" href="#"><%=craft.getCraft_nm()%></a><%}%><!-- 
		   --><a class="nav-link" href="#">특가상품</a>
			</nav>			
		</div>
		<div class="col-sm-5">
			<nav class="nav cat_filter right_filter">
			  <%for(BrandTypeVO brand: brands_filter){ %><a class="nav-link" href="#"><%=brand.getBrand_nm()%></a><%}%>
			</nav>			
		</div>
	</div>
</div>