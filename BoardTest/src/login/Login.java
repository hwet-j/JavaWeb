package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Login {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle 데이터베이스 URL
    private String userId = "scott"; // 데이터베이스 사용자명
    private String password = "tiger"; // 데이터베이스 비밀번호
    
    public boolean isExist(String check_user, String check_pass) {
        boolean isExist = false;

        try {    
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // 데이터베이스 연결
            Connection conn = DriverManager.getConnection(url, userId, password);

            // SQL 쿼리 실행
            String sql = "SELECT COUNT(*) FROM user_table WHERE username = ? AND userpwd = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, check_user);
            pstmt.setString(2, check_pass);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    // 아이디, 비밀번호로 검색가능
                	isExist = true;
                }
            }
 
            // 자원 해제
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isExist;
    }
    
}
