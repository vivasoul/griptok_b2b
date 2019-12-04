<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	String content_page = (String) request.getAttribute("content_page");
	content_page = "/WEB-INF/jsp/"+content_page+".jsp";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>GRIPTOK B2B SHOPPING MALL</title>
<script src="/lib/js/jquery.min.js"></script>
<script src="/lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.min.css">
<style type="text/css">
	body {
		margin: 1%;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/_template/main/header.jsp" flush="false" />
<jsp:include page="<%=content_page %>" flush="false" />
<jsp:include page="/WEB-INF/jsp/_template/main/footer.jsp" flush="false" />
</body>
</html>