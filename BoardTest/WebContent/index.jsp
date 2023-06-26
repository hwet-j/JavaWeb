<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>

</head>

<body>
<header>
    <h1 class="site-heading text-center text-faded d-none d-lg-block">
        <span class="site-heading-upper text-primary mb-3">회원가입, 로그인, 게시판</span>
        <span class="site-heading-lower">홈페이지</span>
    </h1>
</header>

<!-- 상위 메뉴 include -->
<%@ include file="nav.html"%>


<div>
	<ul>
		<li><a href="<%= request.getContextPath() %>/board/index.jsp">게시판 관리</a></li>
		<li><a href="<%= request.getContextPath() %>/user/index.jsp">회원  가입</a></li>
		<li><a href="<%= request.getContextPath() %>/login/index.jsp">로그인</a></li>
	</ul>
</div>

<%
// 세션에서 사용자명 가져오기
String username = (String) session.getAttribute("login_user");

// 가져온 사용자명 사용
out.println("사용자명: " + username);
%>



<!-- 하위 footer -->
<%@ include file="footer.html"%>

</body>
</html>