<%@page import="board.MyBoardDAO"%>
<%@page import="board.MyBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
request.setCharacterEncoding("utf-8");

// 수정할 글의 정보를 가져옴
int b_no = Integer.parseInt(request.getParameter("b_no"));
MyBoardDTO board = null;
try {
	MyBoardDAO boardDAO = new MyBoardDAO();
    board = boardDAO.getBoard(b_no);
} catch (Exception e) {
    System.out.println("글 정보 조회 중 오류가 발생했습니다.");
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 수정</title>
</head>
<body>
    <h2>글 수정</h2>

    <% if (board != null) { %>
        <form action="update.jsp" method="post">
            <input type="hidden" name="b_no" value="<%= board.getBNo() %>">
            <div> 
                <label for="b_title">제목</label>
                <input type="text" name="b_title" id="b_title" value="<%= board.getBTitle() %>">
            </div>
            <div>
                <label for="b_content">내용</label>
                <textarea name="b_content" id="b_content" rows="5" cols="50"><%= board.getBContent() %></textarea>
            </div>
            <input type="submit" value="수정">
        </form>
    <% } else { %>
        <p>글 정보를 가져오는데 실패했습니다.</p>
    <% } %>
</body>
</html>