package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MyUserDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle 데이터베이스 URL
    private String username = "scott"; // 데이터베이스 사용자명
    private String password = "tiger"; // 데이터베이스 비밀번호

    // 리턴 타입을 void로 했을 경우JSP에서 에러가 발생한 것을  정확히 인지하지 못하는 상황이 발생했다. 
    // 아이디의 입력을 잘못했다거나 연결문제에서 에러가 발생했을 경우 인지 하지 못하는 경우를 대비하여 boolean형태로 설정하여 
    // Insert문이 1개이상 성공했으면  > 0 의 조건으로 True로 만들어주고 그렇지 않으면 false를 반환한다. 
    // 여기서 > 0 조건은 0이면 false를 반환했기 때문에 Insert문이 실행하지 않은것으로 인지하게 하여 JSP에서 에러로 인식
    public boolean registerUser(MyUserDTO user) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "INSERT INTO user_table (userno, username, userpwd, email) VALUES (userno_seq.NEXTVAL, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getUserpwd());
            pstmt.setString(3, user.getEmail());
            

            int rowsInserted = pstmt.executeUpdate();
 
            pstmt.close();
            conn.close();
            System.out.println("아이디 생성이 성공적으로 이뤄졌습니다.");
            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println("아이디 생성 중 오류가 발생했습니다.");
            e.printStackTrace();
            return false;
        }
    }
    

    
    
}