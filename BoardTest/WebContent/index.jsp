<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li><a href="<%= request.getContextPath() %>/board/index.jsp">게시판 관리</a></li>
		<li><a href="<%= request.getContextPath() %>/user/index.jsp">회원  가입</a></li>
		<li><a href="<%= request.getContextPath() %>/login/index.jsp">로그인</a></li>
	</ul>
</body>
</html>