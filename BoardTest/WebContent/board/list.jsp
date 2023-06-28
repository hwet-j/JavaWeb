<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.MyBoardDAO"%>
<%@page import="board.MyBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

// 글 목록 조회
List<MyBoardDTO> boardList = new ArrayList<>();
try {
    MyBoardDAO boardDAO = new MyBoardDAO();
    boardList = boardDAO.getBoardList();
} catch (Exception e) {
    System.out.println("글 목록 조회 중 오류가 발생했습니다.");
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 목록</title>
</head>
<body>
    <h2>글 목록</h2>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <% for (MyBoardDTO board : boardList) { %>
            <tr>
	            <% String content = board.getContent();
	               int maxLength = 10; // 제목의 최대 길이 지정
	               if (content.length() > maxLength) {
	            	   content = content.substring(0, maxLength) + "..."; // 일부분만 출력하고 생략 부호 추가
	               }
	            %>
                <td><%= board.getBoardId() %></td>
                <td><%= board.getTitle() %></td>
                <td><%= content %></td>
                <td><%= board.getWriter() %></td>
                <td><%= board.getRegDate() %></td>
                <td>
	                <form action="show.jsp" method="post">
		                <input type="hidden" name="b_no" value="<%= board.getBoardId() %>">
		                <input type="submit" value="자세히보기">
	            	</form>
            	</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>

