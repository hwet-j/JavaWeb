package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class MyBoardDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle 데이터베이스 URL
    private String username = "scott"; // 데이터베이스 사용자명
    private String password = "tiger"; // 데이터베이스 비밀번호

    // 리턴 타입을 void로 했을 경우JSP에서 에러가 발생한 것을  정확히 인지하지 못하는 상황이 발생했다. 
    // 아이디의 입력을 잘못했다거나 연결문제에서 에러가 발생했을 경우 인지 하지 못하는 경우를 대비하여 boolean형태로 설정하여 
    // Insert문이 1개이상 성공했으면  > 0 의 조건으로 True로 만들어주고 그렇지 않으면 false를 반환한다. 
    // 여기서 > 0 조건은 0이면 false를 반환했기 때문에 Insert문이 실행하지 않은것으로 인지하게 하여 JSP에서 에러로 인식
    public boolean insertBoard(String title, String content, String writer, String category, String link) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, username, password);
            System.out.println(writer);
            String sql = "INSERT INTO hwet_board VALUES (boardno_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE, 0, null)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, writer);
            pstmt.setString(2, title);
            pstmt.setString(3, category);
            pstmt.setString(4, link);
            pstmt.setString(5, content);

            int rowsInserted = pstmt.executeUpdate();
 
            pstmt.close();
            conn.close();
            System.out.println("글 입력이 성공적으로 이뤄졌습니다.");
            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println("글 입력 중 오류가 발생했습니다.");
            e.printStackTrace();
            return false;
        }
    }
    
    
    public List<MyBoardDTO> getBoardList() {
        List<MyBoardDTO> boardList = new ArrayList<>();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM hwet_board ORDER BY board_id";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int b_no = rs.getInt("board_id");
                String writer = rs.getString("writer");
                String title = rs.getString("title");
                String category = rs.getString("category");
                String link = rs.getString("link");
                String content = rs.getString("content");
                Date regdate = rs.getDate("regdate");
                int hit = rs.getInt("hit");
                Date updateDate = rs.getDate("updatedate");
                

                MyBoardDTO board = new MyBoardDTO();
                board.setBoardId(b_no);
                board.setWriter(writer);
                board.setTitle(title);
                board.setCategory(category);
                board.setLink(link);
                board.setContent(content);
                board.setRegDate(regdate);
                board.setHit(hit);
                board.setUpdateDate(updateDate);
                
                boardList.add(board);
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("글 목록 조회 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return boardList;
    }
    
    
    public boolean updateBoard(int b_no, String b_title, String b_content) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "UPDATE board_test SET b_title = ?, b_content = ? WHERE b_no = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, b_title);
            pstmt.setString(2, b_content);
            pstmt.setInt(3, b_no);

            int rowsUpdated = pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            return rowsUpdated > 0;
        } catch (Exception e) {
            System.out.println("글 수정 중 오류가 발생했습니다.");
            e.printStackTrace();
            return false;
        }
    }
    
    
    public MyBoardDTO getBoard(int b_no) {
    	MyBoardDTO board = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM board_test WHERE b_no = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_no);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                int boardNo = rs.getInt("b_no");
                String title = rs.getString("b_title");
                String content = rs.getString("b_content");
                String writer = rs.getString("writer");
                String writeDate = rs.getString("write_date");

                //board = new MyBoardDTO(boardNo, title, content, writer, writeDate);
            }

            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("게시글 조회 중 오류가 발생했습니다.");
            e.printStackTrace();
        }

        return board;
    }

    
    
}