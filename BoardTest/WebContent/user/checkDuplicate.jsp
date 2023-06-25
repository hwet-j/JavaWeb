<%@page import="user.MyUserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
String username = request.getParameter("username");
String message = "";

MyUserDAO userDAO = new MyUserDAO();
boolean isDuplicate = userDAO.isUsernameDuplicate(username);

if (isDuplicate) {
    message = "duplicate";
} else {
    message = "not_duplicate";
}
 
// 클라이언트에게 응답 전송
response.setContentType("text/plain");
response.setCharacterEncoding("UTF-8");
response.getWriter().write(message);
%>