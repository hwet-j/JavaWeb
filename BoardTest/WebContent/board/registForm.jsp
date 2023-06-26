<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록</title>

<script>
    // input 태그를 수정할 수 없도록 설정하는 함수
    function disableInput() {
        var input = document.getElementById("writer");
        input.disabled = true;
    }
</script>

</head>
<body>
<h3>글 등록 하기</h3>
<%
// 세션에서 사용자명 가져오기
String username = (String) session.getAttribute("login_user");
%>


<form method="post" action="<%= request.getContextPath() %>/board/regist.jsp">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="5" cols="50" required></textarea><br><br>
        
        <label for="writer">작성자:</label>
        <input type="text" id="writer" name="writer" value="<%= username %>" required><br><br>
        
        
        <input type="submit" value="글 작성">
</form>

<script>
    // 페이지 로드 후 input 태그를 수정할 수 없도록 설정
    window.onload = function() {
        disableInput();
    };
</script>

</body>
</html>