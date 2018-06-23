package Impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Bean.Article;
import Bean.User;
import DB.DBConn;

public class UserImpl {
	//用户注册
	public static boolean registerUser(String username,String password,String email) {
		DBConn db = new DBConn();
        
		int num;
		for(num = 0; ;num++) {
			String s1 = "SELECT count(*) FROM \"REFRESH\".USERINFO where USERID=" + num;
			System.out.println(s1); 
            String rlt = db.getSingleValue(s1);
            System.out.println(rlt); 
            if(rlt.trim().equals("0"))
            	break;
		}
		System.out.println(num); 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "INSERT INTO \"REFRESH\".USERINFO VALUES(" + num + ",'" + email + "','" + username + "','" + password + "','" + df.format(new Date()) + "',0,0,0,0)";
        System.out.println(sql); 
        boolean rlt = db.executeUpdate(sql);   
        return rlt;
	}
	//用户登录
	public static String loginUser(String username,String password) {
		DBConn db = new DBConn();
		
		String sql =  "SELECT count(*) FROM \"REFRESH\".USERINFO where USERNAME='" + username + "'";
        sql += " and PASS='" + password + "'";
        System.out.println(sql); 
       
        String rlt = db.getSingleValue(sql);                
        System.out.println("result =" +  rlt);
        
        return rlt;
	}
	//根据关键字搜索用户
	public static User[] searchUsers(String key) {
		User[] users = new User[4];
		for(int i=0;i<users.length;i++)
			users[i]= new User();
		
		DBConn db = new DBConn();
		String sql = "SELECT USERID,USERNAME FROM \"REFRESH\".USERINFO where USERNAME LIKE '%" + key + "%'";
		
		System.out.println(sql);
		
		ArrayList<String[]> searchres = db.executeQuery(sql);
		int size = searchres.size();
		
		System.out.println(size);
		if(size > 4)
			size = 4;
		
		for(int i = 0; i < size; i++) {
			int uid=Integer.parseInt(searchres.get(i)[0]);
			users[i].setUserId(uid);
			users[i].setUsername(searchres.get(i)[1]);
		}
		return users;
	}
}
