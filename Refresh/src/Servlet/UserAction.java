package Servlet;

import java.io.IOException;
import java.util.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.User;
import DB.DBConn;
import Impl.UserImpl;

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
		//登录操作
		if(type.equals("login")) {
			String username= request.getParameter("username");
			String password = request.getParameter("password");
			System.out.println(username); 

			UserImpl uImpl = new UserImpl();
			String rlt = uImpl.loginUser(username, password);
            
            if (rlt.trim().equals("1")){
            	DBConn db = new DBConn();
            	String sql2 =  "SELECT * FROM \"REFRESH\".USERINFO where USERNAME='" + username + "'";
            	ArrayList<String[]> info = db.executeQuery(sql2);
            	//如果成功,把登录状态存进session
				//生成User信息
				User user =new User();
				user.setUserId(Integer.parseInt(info.get(0)[0]));
				user.setEmail(info.get(0)[1]);
				user.setUsername(username);
				user.setPassword(password);
				user.setIcon(info.get(0)[5]);
				user.setFansNum(Integer.parseInt(info.get(0)[6]));
				user.setFocusNum(Integer.parseInt(info.get(0)[7]));
				user.setArticleNum(Integer.parseInt(info.get(0)[8]));
				System.out.println(user.getUsername());
				//把User装进session里面
				request.getSession(true).setAttribute("user", user);
            	response.getWriter().write("success");
            }
            else{
            	response.getWriter().write("fail");
            return;
            }
		}
		//注册操作
		if(type.equals("register")) {
			String email = request.getParameter("email");
			String username= request.getParameter("username");
			String password = request.getParameter("password");
			
			UserImpl uImpl = new UserImpl();
			boolean rlt = uImpl.registerUser(username, password, email);
            System.out.println("result =" +  rlt);
            
            if(rlt == true) {
            	response.getWriter().write("success");
            }
            else{
            	response.getWriter().write("fail");
            return;
            }
		}
		//查询操作
		if(type.equals("search")) {
			String context = request.getParameter("context");
			
			DBConn db = new DBConn();
			String sql =  "SELECT count(*) FROM \"REFRESH\".USERINFO where USERNAME='" + context + "'";
            
            System.out.println(sql); 
            
            String rlt = db.getSingleValue(sql);                
            
            System.out.println("result =" +  rlt);
                    
            if (rlt.trim().equals("1")){
            		response.getWriter().write("success");
                    //response.sendRedirect("../homepage.jsp");
            }
            else{
            	response.getWriter().write("fail");
            return;
            }
		}
		//修改个人信息
		if(type.equals("modify")) {
			String userid = request.getParameter("uid");
			int uid = Integer.parseInt(userid);
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String oldpassword = request.getParameter("oldpassword");
			String newpassword = request.getParameter("newpassword");
			
			System.out.println("oldname:"+uid);
			
			DBConn db = new DBConn();
			String sql = "SELECT PASS FROM \"REFRESH\".USERINFO WHERE USERID=" + uid;
			String pass = db.getSingleValue(sql);
			if(pass.trim().equals(oldpassword)) {
			String sql2 = "UPDATE \"REFRESH\".USERINFO SET USERNAME='" + username + "',PASS='" + newpassword + "',EMAIL='" + email + "' WHERE USERID='" + uid;
			System.out.println(sql2);
			boolean res = db.executeUpdate(sql2);
			
			if(res) {
				response.getWriter().write("success");
			}else {
				response.getWriter().write("failed");
			}
			}
			else {
				response.getWriter().write("failed");
			}
		}
		if(type.equals("exit")) {
			request.getSession().setAttribute("user", null);
			//System.out.println("退出!");
			response.getWriter().write("success");
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
