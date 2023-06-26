<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>
</head>
<body>
<h3>글 등록 하기</h3>

<form method="post" action="<%= request.getContextPath() %>/board/regist.jsp">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="5" cols="50" required></textarea><br><br>
        
        <label for="writer">작성자:</label>
        <input type="text" id="writer" name="writer" required><br><br>
        
        <input type="submit" value="글 작성">
</form>


</body>
</html>