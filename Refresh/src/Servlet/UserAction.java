package Servlet;

import java.io.IOException;
import java.util.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBConn;

/**
 * Servlet implementation class UserAction
 */
@WebServlet("/UserAction")
public class UserAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(type.equals("login")) {
			String username= request.getParameter("username");
			String password = request.getParameter("password");
			
			/*String s="abc def";
			if(s.indexOf("abc")!=-1) {
				
			}
			String s1 = "aaabbbccc";
			s.replace("aaa","ddd");
			
			String s2 ="a:2,b:3,d:5";
			String[] ars = s.split(",");
			
			s.equals("aaa");*/
			
			DBConn db = new DBConn();
			//String sql = "select * from 'REFRESH'.USERINFO where name='"+username+"'";
			//ArrayList<String[]>  ar= db.executeQuery(sql);
			//response.getWriter().write("success");
			String sql =  "SELECT count(*) FROM \"REFRESH\".USERINFO where USERNAME='" + username + "'";
            sql += " and PASS='" + password + "'";
            
            System.out.println(sql); 
            
            String rlt = db.getSingleValue(sql);                
            
            System.out.println("result =" +  rlt);
                    
            if (rlt.trim().equals("1")){
                    //session.setAttribute("uID",username);
            		response.getWriter().write("success");
                    //response.sendRedirect("../homepage.jsp");
            }
            else{
            	response.getWriter().write("fail");
            return;
            }
		}
		if(type.equals("register")) {
			String email = request.getParameter("email");
			String username= request.getParameter("username");
			String password = request.getParameter("password");
			
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
            System.out.println("result =" +  rlt);
            
            if(rlt == true) {
            	response.getWriter().write("success");
            }
            else{
            	response.getWriter().write("fail");
            return;
            }
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
