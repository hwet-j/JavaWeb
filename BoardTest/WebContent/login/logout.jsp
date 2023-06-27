<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // 세션에서 사용자명 가져오기
	String loginuser = (String) session.getAttribute("login_user");

    
    if (loginuser != null) {
        // 세션 무효화
    	session.removeAttribute("login_user");
    }
    
    // 로그아웃 후 리디렉션할 페이지 설정 (예: 홈페이지의 메인 페이지)
    String redirectURL = request.getContextPath() + "/index.jsp";
    response.sendRedirect(redirectURL);
%>