<%@page import="board.MyBoardDAO"%>
<%@page import="board.MyBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String title = request.getParameter("title");
String content = request.getParameter("content");
// String writer = request.getParameter("writer");	// null을 반환함..
String writer = (String) session.getAttribute("login_user");
String category = request.getParameter("category");
String link = request.getParameter("link");


try {
	MyBoardDAO boardDAO = new MyBoardDAO(); 
    boolean insertResult = boardDAO.insertBoard(title, content, writer, category, link);
    if (insertResult) {
    	response.sendRedirect(request.getContextPath() + "/board/index.jsp");
    } else {
    	response.sendRedirect(request.getContextPath() + "/board/index.jsp");
    }
} catch (Exception e) {
	response.sendRedirect(request.getContextPath() + "/board/registForm.jsp");
    e.printStackTrace();
}
%>

