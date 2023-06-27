package user;

import java.util.Date;

public class MyUserDTO {
	private String memId;
    private String memPwd;
    private String memName;
    private String memGender;
    private Date memBirthday;
    private String memEmail;
    private String memTel;

    public String getMemId() {
        return memId;
    } 

    public void setMemId(String memId) {
        this.memId = memId;
    }

    public String getMemPwd() {
        return memPwd;
    }

    public void setMemPwd(String memPwd) {
        this.memPwd = memPwd;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public String getMemGender() {
        return memGender;
    }

    public void setMemGender(String memGender) {
        this.memGender = memGender;
    }

    public Date getMemBirthday() {
        return memBirthday;
    }

    public void setMemBirthday(Date memBirthday) {
        this.memBirthday = memBirthday;
    }

    public String getMemEmail() {
        return memEmail;
    }

    public void setMemEmail(String memEmail) {
        this.memEmail = memEmail;
    }

    public String getMemTel() {
        return memTel;
    }

    public void setMemTel(String memTel) {
        this.memTel = memTel;
    }

    @Override
    public String toString() {
        return "MemberDTO{" +
                "memId='" + memId + '\'' +
                ", memPwd='" + memPwd + '\'' +
                ", memName='" + memName + '\'' +
                ", memGender='" + memGender + '\'' +
                ", memBirthday=" + memBirthday +
                ", memEmail='" + memEmail + '\'' +
                ", memTel='" + memTel + '\'' +
                '}';
    }
}