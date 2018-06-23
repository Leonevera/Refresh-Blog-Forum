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
import javax.servlet.jsp.PageContext;

import DB.DBConn;
import Bean.Article;
import Bean.User;

@WebServlet("/uploadArticle")

public class uploadArticle extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public uploadArticle() {
		super();
	}
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		System.out.println("in");
		
		String content=request.getParameter("content");
		String title=request.getParameter("title");
		
		String userid1=request.getParameter("userid");
		int userid=Integer.parseInt(userid1);
		
		System.out.println("the content is "+content);
		
		DBConn db=new DBConn();
		
		String sql="select count(*) from \"REFRESH\".BLOG";
		
		
		System.out.println(sql);
		
		String topicNum1 = db.getSingleValue(sql);
		
		System.out.println("there are "+topicNum1+"have been created");
		
		int topicNum=Integer.parseInt(topicNum1)+1;
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql2="insert into \"REFRESH\".BLOG values(" + topicNum + ",'" + title + "','" + content + "'," + userid + ",'" + df.format(new Date()) + "',0,0,0,0)";
		//String sql2="insert into \"REFRESH\".TOPIC values(1"+","+userid+"'"+df.format(new Date())+"',0,0,0,0)";
		
		System.out.println(sql2);
		
		boolean rlt=db.executeUpdate(sql2);
		
		System.out.println("result="+rlt);
		
		if(rlt==true) {
			Article newArticle=new Article();
			newArticle.setId(topicNum);
			
			request.getSession(true).setAttribute("newArt", newArticle);
			request.setAttribute("articleID", newArticle.getId());
			System.out.println("the id is"+newArticle.getId());
	//		RequestDispatcher disp = request.getRequestDispatcher(request.getContextPath()+"/ArticlePage/PersonalBlog2.jsp");  
		//	disp.forward(request, response);  
		//	response.sendRedirect("./personalBlog.jsp");
			//response.getWriter().write(""+newArticle.getId());
			response.getWriter().write("success");
		}
		else {
			response.getWriter().write("fail");
			return ;
		}
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		doGet(request,response);
	}
}