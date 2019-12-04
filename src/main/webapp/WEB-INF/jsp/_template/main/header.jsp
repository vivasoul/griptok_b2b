<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%	
	List<MenuVO> menu_list = (List<MenuVO>)session.getAttribute("top_menus");
%>
<style type="text/css">
	.top_menu { text-align:right; border-right:1px solid black; }
	.top_menu>a {
		 display:inline-block;
		 width:90px;
		 height:25px;
		 border-top:1px solid black;
		 border-bottom:1px solid black;
		 border-left:1px solid black;
		 padding-top:2px;
		 text-align:center;
		 text-decoration:none;
		 color:#333;
	}
	.top_menu>a:hover {
		background-color:#CCC;
		color:#FFF;
	}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-4">
			<img src="/img/common/head_logo_small.png"/>
		</div>
		<div class="col-sm-8" role="navigation">
			<nav class="nav top_menu">
			  <%for(MenuVO menu: menu_list){ %><a class="nav-link" href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a><%}%>
			</nav>
		</div>		
	</div>
	
</div>