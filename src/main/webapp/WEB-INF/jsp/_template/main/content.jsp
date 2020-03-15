<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%
	String content_page = (String) request.getAttribute("content_page");
	content_page = "/WEB-INF/jsp/"+content_page+".jsp";
	String page_path = (String)request.getAttribute("page_path");
	String init_path = null;
	String last_path = null;
	if(page_path != null){
		int last_idx = page_path.lastIndexOf(">");
		init_path = page_path.substring(0, last_idx+1);
		last_path = page_path.substring(last_idx+1);
	}
	
	String page_title = (String)request.getAttribute("page_title");
	String side_title = (String)request.getAttribute("side_title");
	String side_id = (String) request.getAttribute("side_id");
	List<MenuVO> side_menus = (List<MenuVO>)request.getAttribute("side_menus");
%>
<div class="container-fluid griptok-body">
	<div class="row">
		<%if(side_menus != null && !side_menus.isEmpty()) {%>
		<div class="left-content">
			<div class="griptok-side-menu">
				<div class="griptok-side-title"><%=side_title%></div>
				<div class="griptok-side-body">
				<%for(MenuVO menu: side_menus){
					boolean isActive = (menu.getMenu_id()).equals(side_id);
				%>
					<div menu-id="<%=menu.getMenu_id()%>">
						<a <%if(isActive){%>class="active"<%}%> href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a>
					</div>
				<%}%>
				</div>
				<div class="side-banner">
					<img src="/img/common/side_banner/side_banner_1.png"/>	
				</div>
			</div>
		</div><!-- 
	 --><div class="right-content">
		<%}else{%>
		<div class="full-content">
		<%}%>
			<%if(page_path!=null){%><div class="row">
				<div class="col-sm-12" id="griptok-page-path"><%=init_path%><span style="font-weight:900"><%=last_path%></span></div>
			</div><%}%>
			<%if(page_title!=null){%><div id="griptok-page-title"><%=page_title%></div><%}%>
			<jsp:include page="<%=content_page %>" flush="false" />
		</div>
	</div>
</div>