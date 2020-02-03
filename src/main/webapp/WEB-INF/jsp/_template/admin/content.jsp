<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%
	String content_page = (String) request.getAttribute("content_page");
	content_page = "/WEB-INF/jsp/"+content_page+".jsp";
	String page_title = (String)request.getAttribute("page_title");
	String side_title = (String)request.getAttribute("side_title");
	List<MenuVO> side_menus = (List<MenuVO>)request.getAttribute("side_menus");
%>
<script type="text/javascript">
	const SIDE_TOGGLE_CLASS = "side-menu-lv2-active";
	jQuery(document).ready(function(e){
		jQuery(".griptok-side-body").on("click", ".side-menu-lv1", function(e){
			const $this = jQuery(this).find(".side-menu-lv2")
			if($this.hasClass(SIDE_TOGGLE_CLASS)) $this.removeClass(SIDE_TOGGLE_CLASS);
			else 								  $this.addClass(SIDE_TOGGLE_CLASS);
		});		
	});
</script>
<div class="container-fluid griptok-body">
	<div class="row">
		<%if(side_menus != null && !side_menus.isEmpty()) {%>
		<div class="col-sm-2">
			<div class="griptok-side-menu">
				<div class="griptok-side-title"><%=side_title%></div>
				<div class="griptok-side-body">
				<%for(MenuVO menu: side_menus){%>
					<div class="side-menu-lv1" menu-id="<%=menu.getMenu_id()%>">	
						<%=menu.getMenu_nm()%>
						<% 
							List<MenuVO> child_menus = menu.getSub_menus(); 
							if(child_menus != null){%>
							<div class="side-menu-lv2">
							<%for(MenuVO c_menu:child_menus){%>
								<div menu-id="<%=c_menu.getMenu_id()%>"><a href="<%=c_menu.getMenu_url()%>"><%=c_menu.getMenu_nm()%></a></div>
							<%}%>
							</div>
						<%}%>
					</div>
				<%}%>
				</div>
			</div>
		</div>
		<div class="col-sm-10">
		<%}else{%>
		<div class="col-sm-12">
		<%}%>
			<%if(page_title!=null){%><div id="griptok-page-title"><%=page_title%></div><%}%>
			<jsp:include page="<%=content_page %>" flush="false" />
		</div>
	</div>
</div>