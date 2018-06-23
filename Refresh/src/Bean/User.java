package Bean;

import java.util.Date;

public class User {
	private int uid;			//uid
	private String username;	//用户名
	private String password;	//密码
	private String email;		//邮箱
	private Date registertime;	//注册时间
	private int fansnum;		//粉丝数
	private int focusnum;		//关注数
	private int articlenum;		//文章数
	private String icon;		//头像（地址？）
	
	public int getUserId() {
		return uid;
	}
	public void setUserId(int uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegisterTime() {
		return registertime;
	}
	public void setRegisterTime(Date time) {
		this.registertime = time;
	}
	public int getFansNum() {
		return fansnum;
	}
	public void setFansNum(int fansnum) {
		this.fansnum = fansnum;
	}
	public int getFocusNum() {
		return focusnum;
	}
	public void setFocusNum(int fnum) {
		this.focusnum = fnum;
	}
	public int getArticleNum() {
		return articlenum;
	}
	public void setArticleNum(int anum) {
		this.articlenum = anum;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
}
