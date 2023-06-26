package board;

import java.sql.Date;

public class MyBoardDTO {
    private int bNo;				// 게시판 번호
    private String bTitle;			// 제목
    private String bContent;		// 내용
    private String writer;			// 글쓴이
    private String writeDate;			// 날짜 
    
    public MyBoardDTO(int bNo, String bTitle, String bContent, String writer, String writeDate) {
        this.bNo = bNo;
        this.bTitle = bTitle;
        this.bContent = bContent;
        this.writer = writer;
        this.writeDate = writeDate;
    }

    public int getBNo() {
        return bNo;
    }

    public void setBNo(int bNo) {
        this.bNo = bNo;
    }

    public String getBTitle() {
        return bTitle;
    }

    public void setBTitle(String bTitle) {
        this.bTitle = bTitle;
    }

    public String getBContent() {
        return bContent;
    }

    public void setBContent(String bContent) {
        this.bContent = bContent;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(String writeDate) {
        this.writeDate = writeDate;
    }
    
    @Override
    public String toString() {
        return "BoardTestDTO{" +
                "bNo=" + bNo +
                ", bTitle='" + bTitle + '\'' +
                ", bContent='" + bContent + '\'' +
                ", writer='" + writer + '\'' +
                ", writeDate=" + writeDate +
                '}';
    }
}
