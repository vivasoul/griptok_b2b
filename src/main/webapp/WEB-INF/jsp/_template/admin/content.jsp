<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.griptk.b2b.common.domain.MenuVO" %>
<%
	String content_page = (String) request.getAttribute("content_page");
	content_page = "/WEB-INF/jsp/"+content_page+".jsp";
	String page_path = (String)request.getAttribute("page_path");
	String page_title = (String)request.getAttribute("page_title");
	List<MenuVO> menu_hierarchy = (List<MenuVO>)request.getAttribute("menu_hierarchy");
	String active_menu_lv1 =  menu_hierarchy.get(1).getMenu_id();
	List<MenuVO> side_menus = (List<MenuVO>)request.getAttribute("side_menus");
%>
<script type="text/javascript">
	const SIDE_TOGGLE_CLASS = "active";
	jQuery(document).ready(function(e){
		jQuery(".side-body").on("click", ".side-menu-lv1", function(e){
			const $this = jQuery(this);
			const $next = $this.next();
			if($next.hasClass(SIDE_TOGGLE_CLASS)) {
				$next.removeClass(SIDE_TOGGLE_CLASS);
				$this.find("i").prop("className", "fa fa-chevron-down");
			}else{
				$next.addClass(SIDE_TOGGLE_CLASS);
				$this.find("i").prop("className", "fa fa-chevron-up");
			}
		});		
	});
	const getMonitorCount = function(){
		jQuery.ajax({
			url:"/admin/monitor",
			method:"GET",
			dataType:"json"
		}).done(function(data){
			jQuery("#v_user_waiting_cnt").text(data["user_waiting_cnt"]);
			jQuery("#v_deposit_waiting_cnt").text(data["deposit_waiting_cnt"]);
			jQuery("#v_new_order_cnt").text(data["new_order_cnt"]);
			jQuery("#v_delivering_cnt").text(data["delivering_cnt"]);
		});
	};
	jQuery(document).ready(function(e){
		getMonitorCount();
	});
</script>
<div class="griptok-admin-body">
	<div class="left-content">
		<div class="side-menu">
			<div class="side-header">
				<a class="go-main-link" href="/main">
					<img src="/img/admin/back_to_shopping.png"/><br/>
					<span class="go-main-link-text">쇼핑몰 바로 가기</span>
				</a>
			</div>
			<div class="side-body">
			<%for(MenuVO menu: side_menus){%>
				<div class="side-menu-lv1">
					<div class="menu-title">
						<%=menu.getMenu_nm()%>
					</div>
					<div class="menu-toggle-arrow"><i class="fa fa-chevron-<%= menu.getMenu_id().equals(active_menu_lv1) ? "up" : "down" %>"></i></div>
				</div>
				<div class="side-menu-lv1-child<%= menu.getMenu_id().equals(active_menu_lv1) ? " active" : "" %>">
					<%for(MenuVO c_menu: menu.getSub_menus()) {%>
					<div class="side-menu-lv2"><a href="<%=c_menu.getMenu_url()%>"><%=c_menu.getMenu_nm()%></a></div>		
					<%}%>
				</div>					
			<%}%>
			</div>
		</div>
	</div><!-- 
 --><div class="right-content">
 		<div class="griptok-admin-monitor">
 			<div class="monitor-box-list">
				<div class="monitor-box">
					<div class="monitor-title"><a href="/admin/user-accept"><img src="/img/admin/monitoring_a.png"/><br/>회원승인요청</a></div>
					<div class="monitor-count" id="v_user_waiting_cnt">0</div>
				</div>
				<div class="monitor-box">
					<div class="monitor-title"><a href="/admin/check-deposit"><img src="/img/admin/monitoring_b.png"/><br/>입금확인요청</a></div>
					<div class="monitor-count" id="v_deposit_waiting_cnt">0</div>			 				
				</div>
				<div class="monitor-box">
					<div class="monitor-title"><a href="/admin/ordered"><img src="/img/admin/monitoring_c.png"/><br/>신규주문</a></div>
					<div class="monitor-count" id="v_new_order_cnt">0</div>				
				</div>
				<div class="monitor-box last">
					<div class="monitor-title"><a href="/admin/delivery-monitor"><img src="/img/admin/monitoring_d.png"/><br/>배송현황</a></div>
					<div class="monitor-count" id="v_delivering_cnt">0</div>	 				
				</div>
			</div>
 		</div>
		<div class="griptok-admin-content">
		<%if(page_path!=null){%><div class="row"><div class="col-sm-12" id="griptok-page-path"><%=page_path%></div></div><%}%>
		<%if(page_title!=null){%><div class="gtk-content-header"><div id="griptok-page-title"><%=page_title%></div></div><%}%>
			<jsp:include page="<%=content_page %>" flush="false" />
		</div>
		<jsp:include page="/WEB-INF/jsp/_template/admin/footer.jsp" flush="false" />
	</div>
</div>