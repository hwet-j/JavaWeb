<%@page import="board.MyBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
request.setCharacterEncoding("utf-8");

int b_no = Integer.parseInt(request.getParameter("b_no"));
String b_title = request.getParameter("b_title");
String b_content = request.getParameter("b_content");

String message = ""; // 결과 메시지를 저장할 변수

try {
    MyBoardDAO boardDAO = new MyBoardDAO();
    boolean updateResult = boardDAO.updateBoard(b_no, b_title, b_content);
    if (updateResult) {
    	response.sendRedirect(request.getContextPath() + "/board/index.jsp");
    	System.out.println("수정 성공!!");
        // message = "글이 성공적으로 수정되었습니다.";
    } else {
        //response.sendRedirect(request.getContextPath() + "/board/index.jsp");
        message = "글 수정에 실패했습니다.";
    	System.out.println("수정 실패!!");
    }
} catch (Exception e) {
    message = "글 수정 중 오류가 발생했습니다.";
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정 결과</title>
</head>
<body>
    <h2>글 수정 결과</h2>
    <p><%= message %></p>
</body>
</html>