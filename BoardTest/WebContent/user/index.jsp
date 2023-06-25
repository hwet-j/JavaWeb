<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        // 아이디 중복 확인 요청
        function checkDuplicate() {
            var username = document.getElementById("username").value;
            
            // AJAX 요청
            $.ajax({
                url: "checkDuplicate.jsp",
                type: "POST",
                data: { username: username },
                success: function(response) {
                    if (response === "duplicate") {
                        // 아이디 중복
                        alert("이미 사용 중인 아이디입니다.");
                    } else {
                        // 아이디 중복 아님
                        alert("사용 가능한 아이디입니다.");
                    }
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }
        
        // 비밀번호 길이 8자 미만이면 에러  
        function checkPasswordLength() {
            var password = document.getElementById("password").value;
            if (password.length < 8) {
                document.getElementById("passwordError").textContent = "비밀번호는 최소 8글자 이상이어야 합니다.";
                return false;
            } else {
                document.getElementById("passwordError").textContent = "";
                return true;
            }
        }
    </script>
    
</head>

<body>
    <h2>회원 가입</h2>
    <form action="register.jsp" method="post" onsubmit="return checkPasswordLength();">
        <label for="username">사용자명:</label>
        <input type="text" id="username" name="username" required>
        <button type="button" onclick="checkDuplicate()">중복 확인</button>
        <br><br>
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
        <span id="passwordError" style="color: red;"></span>
        <br><br>
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
        <br><br>
        <input type="submit" value="가입하기">
    </form>
</body>

</html>