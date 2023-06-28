<%@page import="board.MyBoardDAO"%>
<%@page import="board.MyBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
request.setCharacterEncoding("utf-8");

// 게시판 하나 가져오기
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
    <title>게시글 상세 정보</title>
</head>
<body>
    <h2>게시글 상세 정보</h2>
    <table>
        <tr>
            <th>게시글 ID:</th>
            <td><%= board.getBoardId() %></td>
        </tr>
        <tr>
            <th>작성자:</th>
            <td><%= board.getWriter() %></td>
        </tr>
        <tr>
            <th>제목:</th>
            <td><%= board.getTitle() %></td>
        </tr>
        <tr>
            <th>카테고리:</th>
            <td><%= board.getCategory() %></td>
        </tr>
        <tr>
            <th>링크:</th>
            <td><a href="<%= board.getLink() %>"><%= board.getLink() %></a></td>
        </tr>
        <tr>
            <th>내용:</th>
            <td><%= board.getContent() %></td>
        </tr>
        <tr>
            <th>등록일자:</th>
            <td><%= board.getRegDate() %></td>
        </tr>
        <tr>
            <th>조회수:</th>
            <td><%= board.getHit() %></td>
        </tr>
        <tr>
            <th>수정일자:</th>
            <td><%= board.getUpdateDate() %></td>
        </tr>
        <% if (session.getAttribute("login_user").equals(board.getWriter())) { %>
       		<tr>
            	<td>
            		<form action="updateForm.jsp" method="post">
                		<input type="hidden" name="b_no" value="<%= board.getBoardId() %>">
                		<input type="submit" value="수정하기">
           			</form>
          		</td>
        	</tr>
		<% }  %>
		
        
    </table>
</body>
</html>