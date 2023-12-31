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
         let userid = document.getElementById("userid").value;
         // AJAX 요청
         $.ajax({
             url: "checkDuplicate.jsp",
             type: "POST",
             data: { userid: userid },
             success: function(response) {
             	var message = response.replace(/\s/g, ""); // 공백 제거(줄바꾸믕로 해결되지 않아 공백제거로 변경...)
                 if (message === "duplicate") {
                     // 아이디 중복
                     document.getElementById("userid").focus();
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
        
        
     // 아이디 중복 또는 비밀번호 길이 8자 미만이면 에러
     function checkForm() {
    	 let userid = document.getElementById("userid").value;
    	 let password = document.getElementById("password").value;
    	 let passcheck = document.getElementById("passcheck").value;
    	 let block = true;
    	 let isDuplicate = false;
         
         // 아이디 중복 확인을 위한 AJAX 요청 -> form 전송하면서 위의 코드를 그냥 가져다 조금 수정하여사용
         $.ajax({
             url: "checkDuplicate.jsp",
             type: "POST",
             data: { userid: userid },
             success: function(response) {
            	 let message = response.replace(/\s/g, ""); // 공백 제거
                 if (message === "duplicate") {	// === 연산자는 타입까지 비교함
                     // 아이디 중복
                     isDuplicate = true;
                 } else {
                     // 아이디 중복 아님
                     isDuplicate = false;
                 }
                 // 아이디 중복 여부를 확인한 후에 폼 검증 수행
                 validateForm();
             },
             error: function(xhr, status, error) {
                 console.log(error);
                 // 에러 발생 시에도 폼 검증 수행
                 validateForm();
             }
         });

         // 폼 검증 함수
         function validateForm() {
             // 아이디 중복이면 전송 불가
             if (isDuplicate) {
                 document.getElementById("useridError").textContent = "이미 사용 중인 아이디입니다. 다른 아이디를 사용하세요.";
                 document.getElementById("userid").focus();	 // 포커스 이동
                 block = false;
             } else {
                 document.getElementById("useridError").textContent = "";
             }
             

             // 비밀번호 글자수 8자 미만이면 전송 불가
             if (password.length < 8 || !password.includes('.')) {
                 document.getElementById("passwordError").textContent = "비밀번호는 최소 8글자 이상이며, 특수문자 점(.)을 포함해야합니다.";
                 // document.getElementById("password").value = "";	// 초기화 가능
                 document.getElementById("password").focus();
                 block = false;
             } else {
                 document.getElementById("passwordError").textContent = "";
              	// 비밀번호 확인 (비밀번호 조건이 만족 되었을 때만)
                 if (password != passcheck) {
                     document.getElementById("passwordCheckError").textContent = "비밀번호가 동일하지 않습니다.";
                     document.getElementById("passcheck").focus();
                     block = false;
                 } else {
                     document.getElementById("passwordCheckError").textContent = "";
                 }
             }
             
             

             if (block) {
                 console.log("실행");
                 // 폼 요소
                 let formElement = document.getElementById("userform");
                 // 폼 전송 (형식이 잘 작성되었는지 확인하기 위해 전송을 방지해두었기 때문에 여기서 실행)
                 formElement.submit();
             } else {
                 console.log("미실행");
             }
         }

         // 폼 전송 방지
         return false;
     }
    </script>
    
</head>

<body>
    <h2>회원 가입</h2>
    <form action="register.jsp" id="userform" method="post" onsubmit="return checkForm();">
        <label for="userid">아이디:</label>
        <input type="text" id="userid" name="userid" required>
        <button type="button" onclick="checkDuplicate()">중복 확인</button>
        <span id="useridError" style="color: red;"></span>
        <br><br>
        
        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" required>
        <span id="passwordError" style="color: red;"></span>
        <br><br>
        
        <label for="password">비밀번호 확인:</label>
        <input type="password" id="passcheck" required>
        <span id="passwordCheckError" style="color: red;"></span>
        <br><br>
        
        <label for="username">이름:</label>
        <input type="text" id="username" name="username" required>
        <br><br>
        
       	 성별:
        <input type="radio" name="gender" id="ck_male" value="남"/><label for="ck_male">남자</label>
        <input type="radio" name="gender" id="ck_female" value="여"/><label for="ck_female">여자</label>
        <br><br>
        
        <label for="birth">생일:</label>
        <input type="date" id="birth" name="birth" required>
        <br><br>
        
        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
        <br><br>
        
        <label for="phonenum">전화번호:</label>
        <input type="tel" id="phonenum" name="phonenum" placeholder="000-1234-5678" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" >
        <br><br>
        
        <input type="submit" value="가입하기">
    </form>
</body>

</html>