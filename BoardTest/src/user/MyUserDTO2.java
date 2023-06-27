package user;

import java.sql.Date;

public class MyUserDTO2 {
	private int userno;
    private String username;
    private String userpwd;
    private String email;

    public MyUserDTO2(int userno, String username, String userpwd, String email) {
        this.userno = userno;
        this.username = username;
        this.userpwd = userpwd;
        this.email = email;
    }
    
    public MyUserDTO2(String username, String userpwd, String email) {
        this.username = username;
        this.userpwd = userpwd;
        this.email = email;
    }

    public int getUserno() {
        return userno;
    }

    public void setUserno(int userno) {
        this.userno = userno;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "UserDTO [userno=" + userno + ", username=" + username + ", userpwd=" + userpwd + ", email=" + email + "]";
    }
}