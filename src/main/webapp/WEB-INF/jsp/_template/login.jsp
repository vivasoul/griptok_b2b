<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%	
	String content_page = (String) request.getAttribute("content_page");
	content_page = "/WEB-INF/jsp/"+content_page+".jsp";
%>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GRIPTOK B2B SHOPPING MALL</title>
<script src="/lib/js/jquery.min.js"></script>
<script src="/lib/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/_template/login.css">
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<jsp:include page="/WEB-INF/jsp/_template/login/header.jsp" flush="false" />
<jsp:include page="<%=content_page%>"  flush="false" />
<jsp:include page="/WEB-INF/jsp/_template/login/footer.jsp" flush="false" />
</body>
</html>