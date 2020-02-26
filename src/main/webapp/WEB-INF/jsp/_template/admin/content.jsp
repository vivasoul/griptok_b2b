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
<div class="griptok-admin-body">
	<div class="left-content">
		<div class="side-menu">
			<div class="side-header">
				<a class="go-main-link" href="#">
					<img src="/img/admin/back_to_shopping.png"/><br/>
					<span class="go-main-link-text">쇼핑몰 바로 가기</span>
				</a>
			</div>
			<div class="side-body">
			<%for(MenuVO menu: side_menus){%>
				<div menu-id="<%=menu.getMenu_id()%>"><a href="<%=menu.getMenu_url()%>"><%=menu.getMenu_nm()%></a></div>
			<%}%>
			</div>
		</div>
	</div><!-- 
 --><div class="right-content">
 		<div class="griptok-admin-monitor">
 		</div>
		<div class="griptok-admin-content">
		<%if(page_path!=null){%><div class="row"><div class="col-sm-12" id="griptok-page-path"><%=page_path%></div></div><%}%>
		<%if(page_title!=null){%><div id="griptok-page-title"><%=page_title%></div><%}%>
			<jsp:include page="<%=content_page %>" flush="false" />
		</div>
		<jsp:include page="/WEB-INF/jsp/_template/admin/footer.jsp" flush="false" />
	</div>
</div>