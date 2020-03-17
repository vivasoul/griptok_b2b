<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
	final int list_cnt = request.getAttribute("list_cnt") != null ? (Integer) request.getAttribute("list_cnt"): 0;
	final int ROW_PER_PAGE = 10;
%>
<script type="text/javascript" src="/js/admin/user/aprv.js"></script>
<script type="text/javascript">
const getChecked = function(){
	const $checkeds = jQuery("#user-list input.gtk-user-cbox:checked");
	return Array.prototype.map.call($checkeds, function(x){ return { "user_no":x.value } });
};

jQuery(document).ready(function(){
	loadList();
	
	jQuery("#sel-aprv-btn").on("click", function(){
		aprvUsers(getChecked());
	});
	
	jQuery("#all-aprv-btn").on("click", function(){
		aprvUsers();
	});
});
</script>
<div class="main-shopping-list">
	<div class="gtk-table-option">
		<button type="button" class="gtk-btn gtk-btn-sm" id="sel-aprv-btn">선택승인</button><!-- 
	 --><button type="button" class="gtk-btn gtk-btn-sm" id="all-aprv-btn">전체승인</button>
 	</div>
	<div id="user-list">
		<input type="hidden" id="v_row_per_page" value="<%=ROW_PER_PAGE%>"/>
		<table class="gtk-table">
			<colgroup>
				<col style="width:5%"/><col style="width:10%"/><col style="width:13%"/><col style="width:7%"/><col style="width:23%"/>
				<col style="width:7%"/><col style="width:10%"/><col style="width:15%"/><col style="width:10%"/>
			</colgroup>
			<thead>
				<tr>
					<th>선택</th>
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