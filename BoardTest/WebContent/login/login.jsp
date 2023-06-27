<%@page import="login.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String username = request.getParameter("username");
String password = request.getParameter("password");

String message = ""; // 결과 메시지를 저장할 변수

try {
	Login login = new Login();
    boolean insertResult = login.isExist(username, password);
    		
    if (insertResult) {
        message = "로그인 성공";
        
    	 // 로그인 성공 시 세션 생성
        session.setAttribute("login_user", username);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    } else {
    	//response.sendRedirect(request.getContextPath() + "/board/index.jsp");
    	message = "로그인 실패";
    }
} catch (Exception e) {
	//response.sendRedirect(request.getContextPath() + "/board/registForm.jsp");
    message = "글 입력 중 오류가 발생했습니다.";
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 결과</title>
</head>
<body>
    <h2>로그인 결과</h2>
    <p><%= message %></p>
</body>
</html>