<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// DTO, DAO없이 DB와 연동 잘되는지 확인하기 위해 작성

// JSP에서 폼으로부터 전달된 데이터의 인코딩이 올바르게 처리
request.setCharacterEncoding("utf-8");

// 데이터베이스 연결 정보 설정
String url = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle 데이터베이스 URL
String username = "scott"; // 데이터베이스 사용자명
String password = "tiger"; // 데이터베이스 비밀번호

// 폼으로부터 전달된 데이터 가져오기
String title = request.getParameter("title");
String content = request.getParameter("content");
String writer = request.getParameter("writer");

// 데이터베이스 연결 및 SQL 실행
try {
    // JDBC 드라이버 로드
    Class.forName("oracle.jdbc.driver.OracleDriver");

    // 데이터베이스 연결
    Connection conn = DriverManager.getConnection(url, username, password);

    // SQL 쿼리 실행을 위한 PreparedStatement 생성
    String sql = "INSERT INTO board_test (b_no, b_title, b_content, writer, write_date) VALUES (boardno_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3, writer);

    // SQL 쿼리 실행
    int rowsInserted = pstmt.executeUpdate();

    // 리소스 정리
    pstmt.close();
    conn.close();

    // 새로운 글이 성공적으로 입력되었는지 확인 후 메시지 출력
    if (rowsInserted > 0) {
        out.println("<h3>글이 성공적으로 입력되었습니다.</h3>");
    } else {
        out.println("<h3>글 입력에 실패했습니다.</h3>");
    }
} catch (Exception e) {
    out.println("<h3>글 입력 중 오류가 발생했습니다.</h3>");
    e.printStackTrace();
}
%>