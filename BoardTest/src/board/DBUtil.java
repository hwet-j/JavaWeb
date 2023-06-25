package board;
/*
DB연동과 관련된 기능을 유틸리티처럼 제공하는 클래스
1. 드라이버로딩
2. DB서버연결
3. 자원반납
=> 유틸리티처럼 사용할 것이므로 static으로 구현
*/

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	// 1. 드라이버로딩
	// ==> 메소드마다 드라이버를 로딩하는 작업을 구현하지 않고 클래스로더가 클래스를 로딩할때 한 번만 실행되도록 하기위해서
	// static블럭 안에 드라이버 로딩코드 작성.
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	// 2. DB서버 연결 - 커넥션 설정
	// ==> SQL문을 실행할때마다 연결을 해야한다.
	// ==> 커넥션을 만들어서 리턴하는 일을 수행하는 메소드
	public static Connection getConnect() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user = "scott";
		String password = "tiger";
		
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	// 3. 자원반납
	public static void close(ResultSet rs, Statement stmt, Connection con) {
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(con!=null)con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

}
