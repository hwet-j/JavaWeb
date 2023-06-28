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
    <form action="update.jsp" method="post">
	    <table>
                
            <tr>
                <th>작성자:</th>
                <input type="hidden" name="b_no" value="<%= board.getBoardId() %>" />
                <td><%= board.getWriter() %></td>
            </tr>
            <tr>
                <th><label for="b_title">제목</label></th>
                <td>
                <input type="text" name="b_title" id="b_title" value="<%= board.getTitle() %>" required></td>
            </tr>
            <tr>
                <th>카테고리:</th>
                <td>
                	<input type="radio" name="category" id="Java" value="JAVA" <% if(board.getCategory().equals("JAVA")) { %>checked<% } %> /><label for="Java">JAVA</label>
					<input type="radio" name="category" id="DB" value="DB" <% if(board.getCategory().equals("DB")) { %>checked<% } %> /><label for="DB">DATABASE</label>
					<input type="radio" name="category" id="HTML/CSS" value="HTML/CSS" <% if(board.getCategory().equals("HTML/CSS")) { %>checked<% } %> /><label for="HTML/CSS">HTML/CSS</label>
					<input type="radio" name="category" id="ETC" value="ETC" <% if(board.getCategory().equals("ETC")) { %>checked<% } %> /><label for="ETC">잡다</label>
		        </td>
            </tr>
            <tr>
                <th>링크:</th>
                <td><input type="url" name="b_link" value="<%= board.getLink() %>" required></td>
            </tr>
            <tr>
                <th><label for="b_content">내용</label></th>
                <td>
                <textarea name="b_content" id="b_content" rows="5" cols="50"  required><%= board.getContent() %></textarea></td>
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
	        <tr>
	            <td><input type="submit" value="수정"></td>
	        </tr>
	    </table>
	</form> 
	    
</body>
</html>