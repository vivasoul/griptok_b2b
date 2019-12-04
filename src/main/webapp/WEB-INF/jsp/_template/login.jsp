<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	
	String content_page = (String) request.getAttribute("content_page");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/_template/login/header.jsp" flush="false" />
<jsp:include page=<%="/WEB-INF/jsp/"+content_page+".jsp" %> flush="false" />
<jsp:include page="/WEB-INF/jsp/_template/login/footer.jsp" flush="false" />
</body>
</html>