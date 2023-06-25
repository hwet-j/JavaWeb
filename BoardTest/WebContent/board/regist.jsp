<%@page import="board.MyBoardDAO"%>
<%@page import="board.MyBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");

String message = ""; // 결과 메시지를 저장할 변수

try {
	MyBoardDAO boardDAO = new MyBoardDAO();
    boolean insertResult = boardDAO.insertBoard(title, content, writer);
    if (insertResult) {
    	response.sendRedirect(request.getContextPath() + "/board/index.jsp");
        // message = "글이 성공적으로 입력되었습니다.";
    } else {
    	response.sendRedirect(request.getContextPath() + "/board/index.jsp");
    	// message = "글 입력에 실패했습니다.";
    }
} catch (Exception e) {
	response.sendRedirect(request.getContextPath() + "/board/registForm.jsp");
    //message = "글 입력 중 오류가 발생했습니다.";
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 입력 결과</title>
</head>
<body>
    <h2>글 입력 결과</h2>
    <p><%= message %></p>
</body>
</html>