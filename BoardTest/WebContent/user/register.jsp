<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="user.MyUserDAO"%>
<%@page import="user.MyUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String userid = request.getParameter("userid");
String password = request.getParameter("password");
String username = request.getParameter("username");
String gender = request.getParameter("gender");
String birth = request.getParameter("birth");
String email = request.getParameter("email");
String phonenum = request.getParameter("phonenum");

SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
Date birth_date = df.parse(birth);
Date dateOfBirth = null;
String message = ""; // 결과 메시지를 저장할 변수

try {
	MyUserDTO user = new MyUserDTO();
	// 날짜 String으로 받았기때문에 Date로 변환
	dateOfBirth = df.parse(birth);
	
	user.setMemId(userid);
	user.setMemPwd(password);
	user.setMemName(username);
	user.setMemGender(gender);
	user.setMemBirthday(birth_date);
	user.setMemEmail(email);
	user.setMemTel(phonenum);
	MyUserDAO userDAO = new MyUserDAO(); 
	
    boolean insertResult = userDAO.registerUser(user);
    
    if (insertResult) {
    	response.sendRedirect(request.getContextPath() + "/index.jsp");
        // message = "글이 성공적으로 입력되었습니다.";
    } else {
    	response.sendRedirect(request.getContextPath() + "/user/index.jsp");
    	// message = "글 입력에 실패했습니다.";
    }
} catch (Exception e) {
	response.sendRedirect(request.getContextPath() + "/user/index.jsp");
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