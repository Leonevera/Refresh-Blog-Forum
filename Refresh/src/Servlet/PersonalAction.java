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
 * Servlet implementation class ArticleAction
 */
@WebServlet("/PersonalAction")
public class PersonalAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println("result =" +  type);
		
		if(type.equals("follow")) {
			String me = request.getParameter("me");
			String he = request.getParameter("he");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			DBConn db = new DBConn();
			String sql =  "INSERT into \"REFRESH\".USERFOCUS(FocusId, FocusedId, Ftime) values('"+me+"', '"+he+"', '"+df.format(new Date())+"')";
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
		
		if(type.equals("quitfollow")) {
			String me = request.getParameter("me");
			String he = request.getParameter("he");
			DBConn db = new DBConn();
			String sql =  "DELETE from \"REFRESH\".USERFOCUS where FocusId='"+me+"' and FocusedId='"+he+"' ";
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