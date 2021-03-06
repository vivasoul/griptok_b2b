<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	final int list_cnt = request.getAttribute("list_cnt") != null ? (Integer) request.getAttribute("list_cnt"): 0;
	final int ROW_PER_PAGE = 10;
%>
<style type="text/css">
.gtk-table .user-edit-btn { padding:0px; }
.gtk-table .user-edit-btn .gtk-btn { width:40px;height:25px;font-size:12px; }
</style>
<script type="text/javascript" src="/js/admin/user/list.js"></script>
<script type="text/javascript">
const getChecked = function(){
	const $checkeds = jQuery("#user-list input.gtk-user-cbox:checked");
	return Array.prototype.map.call($checkeds, function(x){ return { "user_no":x.value } });
};

jQuery(document).ready(function(){
	loadList();
});
</script>
<div class="main-shopping-list">
	<div id="user-list">
		<input type="hidden" id="v_row_per_page" value="<%=ROW_PER_PAGE%>"/>
		<table class="gtk-table">
			<colgroup>
				<col style="width:3%"/><col style="width:5%"/><col style="width:10%"/><col style="width:13%"/><col style="width:7%"/>
				<col style="width:20%"/><col style="width:7%"/><col style="width:10%"/><col style="width:15%"/><col style="width:10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택</th>
					<th>수정</th>
					<th>아이디</th>
					<th>회사명</th>
					<th>대표자명</th>
					<th>주소</th>
					<th>담당자명</th>
					<th>전화</th>
					<th>이메일</th>
					<th>가입일자</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>