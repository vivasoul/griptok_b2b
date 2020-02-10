<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%
	String content_page = (String) request.getAttribute("content_page");
	content_page = "/WEB-INF/jsp/"+content_page+".jsp";
	String page_path = (String)request.getAttribute("page_path");
	String page_title = (String)request.getAttribute("page_title");
	String side_title = (String)request.getAttribute("side_title");
	List<MenuVO> side_menus = (List<MenuVO>)request.getAttribute("side_menus");
%>
<div class="container-fluid griptok-body">
	<div class="row">
		<%if(side_menus != null && !side_menus.isEmpty()) {%>
		<div class="left-content">
			<div class="griptok-side-menu">
				<div class="griptok-side-title"><%=side_title%></div>
				<div class="griptok-side-body">
				<%for(MenuVO menu: side_menus){%>
					<div menu-id="<%=menu.getMenu_id()%>"><a href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a></div>
				<%}%>
				</div>
			</div>
		</div><!-- 
	 --><div class="right-content">
		<%}else{%>
		<div>
		<%}%>
			<%if(page_path!=null){%><div class="row"><div class="col-sm-12" id="griptok-page-path"><%=page_path%></div></div><%}%>
			<%if(page_title!=null){%><div id="griptok-page-title"><%=page_title%></div><%}%>
			<jsp:include page="<%=content_page %>" flush="false" />
		</div>
	</div>
</div>