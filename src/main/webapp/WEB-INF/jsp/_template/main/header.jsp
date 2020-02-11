<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%@ page import="com.griptk.b2b.product.domain.*" %>

<%	
	List<MenuVO> top_menus = (List<MenuVO>)request.getAttribute("top_menus");
	List<CraftTypeVO> crafts_filter = (List<CraftTypeVO>)request.getAttribute("crafts_filter");
	List<BrandTypeVO> brands_filter = (List<BrandTypeVO>)request.getAttribute("brands_filter");
	boolean isAdmin = session.getAttribute("auth_type") != null && "M".equals(session.getAttribute("auth_type").toString());
%>
<div class="container-fluid griptok-header most-top-menus">
	<%if(isAdmin){%><a href="/admin/products">관리자</a><span class="slash-seperator">/</span><%}%>
	<%for(int i=0; i<top_menus.size(); i++){MenuVO menu = top_menus.get(i);%>
		<%if(i>0){%><span class="slash-seperator">/</span><%}%>
		<a href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a>
	<%}%>
</div>
<div class="most-top-baseline"></div>
<div class="container-fluid griptok-header">
	<div class="row">
		<div class="col-sm-4">
			<a href="/main"><img src="/img/common/head_logo_small.png"/></a>
		</div>
		<div class="col-sm-8 griptok-brand-parents">
		  <input class="griptok-brand-search" type="text" value=""/><br/>
		  <%for(int j=0; j<brands_filter.size(); j++) { BrandTypeVO brand = brands_filter.get(j);%>
		  	<%if(j>0){%><span class="slash-seperator">/</span><%}%>
		  	<a href="/main/brand?p_id=<%=brand.getBrand_no()%>"><%=brand.getBrand_nm()%></a>
		  <%}%>
		</div>		
	</div>
</div>
<div class="griptok-start-menus griptok-craft-parents">
	  <a href="/main/all">전체 상품(All)</a><!--
	  --><%for(CraftTypeVO craft: crafts_filter){ %><a href="/main/craft?p_id=<%=craft.getCraft_no()%>"><%=craft.getCraft_nm()%></a><%}%><!-- 
   --><a href="/main/dc">특가상품</a>
</div>