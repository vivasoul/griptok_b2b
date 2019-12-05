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
<style type="text/css">
	.top_menu { 
		 text-align:right;
	}
	.top_menu>a {
		 display:inline-block;
		 width:90px;
		 height:27px;
		 box-shadow: 
		    2px 0 0 0 #CCC, 
		    0 2px 0 0 #CCC, 
		    2px 2px 0 0 #CCC,   /* Just to fix the corner */
		    2px 0 0 0 #CCC inset, 
		    0 2px 0 0 #CCC inset;
		 padding-top:3px;
		 text-align:center;
		 text-decoration:none;
		 color:#333;
	}
	.top_menu>a:hover {
		background-color:#999;
		color:#FFF;
	}
	.cat_filter>a {
		 display:inline-block;
		 min-width:130px;
		 height:35px;
		 padding-top:7px;
		 text-align:center;
		 text-decoration:none;
		 color:#333;
		 box-shadow: 
		    2px 0 0 0 #999, 
		    0 2px 0 0 #999, 
		    2px 2px 0 0 #999,   /* Just to fix the corner */
		    2px 0 0 0 #999 inset, 
		    0 2px 0 0 #999 inset;
	}
	.cat_filter>a:hover {
		background-color:#CCC;
		color:#FFF;
	}
	.cat_filter.left_filter {
		text-align:left;
	}
	.cat_filter.right_filter {
		text-align:right;
	}
</style>
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