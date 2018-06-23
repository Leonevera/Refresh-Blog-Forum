package Impl;

import Bean.Article;
import DB.DBConn;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.text.ParseException;  
import java.text.SimpleDateFormat;  
import java.util.Calendar;  
import java.util.Date;  
import java.text.DateFormat;
import java.text.ParseException;

public class ArticleImpl {
	//获取最热文章
	public static Article[] getHotArticle() {
		System.out.println("in");
		Article[] art = new Article[8];
		for(int i=0;i<8;i++) {
			art[i]=new Article();
		}
		
		DBConn db =new DBConn();
		String sql="select ARTICLEID,TITLE,ACONTENT,AUTHORID,LIKES from \"REFRESH\".BLOG order by LIKES DESC" ;
		ArrayList<String[]> searchres = db.executeQuery(sql);
		int size = searchres.size();
		System.out.println(size);
		if(size>8) {
			size=8;
		}
		
		for(int i=0;i<size;i++) {
			int aid=Integer.parseInt(searchres.get(i)[0]);
			art[i].setId(aid);
			art[i].setTitle(searchres.get(i)[1]);
			String content=searchres.get(i)[2];
			
			content = content.replaceAll("</?[^>]+>", ""); //正则表达式剔出<html>的标签    

	        content = content.replaceAll("<a>\\s*|\t|\r|\n</a>", "");

	        content = content.replaceAll("&nbsp;", "");
	        
	        content =content.substring(0,200);
	     
	        content=content+"...";
	        System.out.println(content);
	        art[i].setContent(content);
	        
	        int id=Integer.parseInt(searchres.get(i)[3]);
	        sql="select USERNAME from \"REFRESH\".USERINFO where USERID="+id;
	        System.out.println(sql);
	        String authorName= db.getSingleValue(sql);
	        art[i].setAuthor(authorName);
	        
	        int like=Integer.parseInt(searchres.get(i)[3]);
	        art[i].setLikes(like);
		}
		return art;
	}
	//获取最新文章
	public static Article[]  getRecentArticle() {
		System.out.println("in7");
		Article[] art = new Article[8];
		for(int i=0;i<8;i++) {
			art[i]=new Article();
		}
		
		DBConn db =new DBConn();
		String sql="select ARTICLEID,TITLE,ACONTENT,AUTHORID,PTIME,LIKES from \"REFRESH\".BLOG order by ARTICLEID DESC" ;
		ArrayList<String[]> searchres = db.executeQuery(sql);
		int size = searchres.size();
		int number=0;
		System.out.println(size);
		//if(size>8) {
			//size=8;
	//	}
		
		for(int i=0;i<size;i++) {
			if(number==8)break;
		    String a,b,c;
		    int nowYear,nowMonth,nowDay;
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	        String dateNowStr = sdf.format(d);
	        System.out.println(dateNowStr);
	        a=dateNowStr.substring(0,4);
	        b=dateNowStr.substring(5,7);//月
	       // dateNowStr=dateNowStr.substring(6+b.length());
	        c=dateNowStr.substring(8,10);//日
	        nowYear=Integer.parseInt(a);
	        nowMonth=Integer.parseInt(b);
	        nowDay=Integer.parseInt(c);
	        
			String time=searchres.get(i)[4];
	        System.out.println(time);
	        a=time.substring(0, 4);//年
	      //  b=time.substring(time.indexOf('-'),time.indexOf('-'));//月
	       // time=time.substring(5);
	      //  c=time.substring(b.length()+1);//日
	        b=time.substring(5,7);
	        c=time.substring(8,10);
	        
	        int year,month,day;
	        year=Integer.parseInt(a);
	        month=Integer.parseInt(b);
	        day=Integer.parseInt(c);
	        
	        if(month==nowMonth) {
	        	if(nowDay-day<=7) {
	        		
	        	}
	        	else continue;
	        }
	        else if(month<nowMonth) {
	        	if(30-day+nowDay<=7) {
	        		
	        	}
	        	else continue;
	        }
			
	     //   String sql="select ARTICLEID,TITLE,ACONTENT,AUTHORID,PTIME,LIKES from \"REFRESH\".BLOG order by ARTICLEID DESC" ;
			int aid=Integer.parseInt(searchres.get(i)[0]);
			art[i].setId(aid);
			art[i].setTitle(searchres.get(i)[1]);
			String content=searchres.get(i)[2];
			System.out.println("OK");
			
			content = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签    

	        content = content.replaceAll("<a>\\s*|\t|\r|\n</a>", "");

	        content = content.replaceAll("&nbsp;", "");
	        
	        content =content.substring(0,150);
	     
	        content=content+"...";
	        System.out.println(content);
	        art[i].setContent(content);
	        
	        int id=Integer.parseInt(searchres.get(i)[3]);
	        sql="select USERNAME from \"REFRESH\".USERINFO where USERID="+id;
	        System.out.println(sql);
	        String authorName= db.getSingleValue(sql);
	        art[i].setAuthor(authorName);
	        
	        int like=Integer.parseInt(searchres.get(i)[5]);
	        art[i].setLikes(like);
	        
	        number++;
		}
		
		System.out.println("Length is :"+art.length);
		return art;
			
	}
	//根据文章ID获得文章信息
	public static Article getArticleById(int aid) {
		System.out.println(aid);
		Article art = new Article();
		
		DBConn db =new DBConn();
		String sql="SELECT TITLE,ACONTENT,AUTHORID,LIKES,VIEWS,PTIME from \"REFRESH\".BLOG WHERE ARTICLEID = " + aid ;
		System.out.println(sql);
		ArrayList<String[]> searchres = db.executeQuery(sql);
		
		if(searchres.size() == 0){
			System.out.println("false!");
			return null;
		}
		art.setId(aid);
		art.setTitle(searchres.get(0)[0]);
		art.setContent(searchres.get(0)[1]);
		int likes=Integer.parseInt(searchres.get(0)[3]);
		int uid=Integer.parseInt(searchres.get(0)[2]);
		art.setLikes(likes);
		int views=Integer.parseInt(searchres.get(0)[4]);
		art.setViews(views);
		art.setDate(searchres.get(0)[5]);
        System.out.println(art.getContent());
        
        String sql2="select USERNAME from \"REFRESH\".USERINFO where USERID="+uid;
        System.out.println(sql);
        String authorName= db.getSingleValue(sql2);
        
        art.setAuthor(authorName);
	    System.out.println(art.getAuthor());
		return art;
	}
	//根据文章id获得作者信息
	public static String getAuthorByArticle(int aid) {
			DBConn db =new DBConn();
			String sql="select AUTHORID from \"REFRESH\".BLOG WHERE ARTICLEID = " + aid ;
			String uid=db.getSingleValue(sql);
			int userid=Integer.parseInt(uid);
			String sql1="select USERNAME from \"REFRESH\".USERINFO WHERE USERID = " + userid ;
			String author=db.getSingleValue(sql1);
			
			return author;
		}
	//根据个数num获取文章的数目，进行排序后返回
	public static Article[] getArticles(int num, String key) {
		Article[] art = new Article[num];
		for(int i=0;i<art.length;i++)
			art[i]= new Article();
		
		DBConn db = new DBConn();
		String sql = "SELECT ARTICLEID,TITLE,ACONTENT FROM \"REFRESH\".BLOG where TITLE LIKE '%" + key + "%'";
		
		System.out.println(sql);
		
		ArrayList<String[]> searchres = db.executeQuery(sql);
		int size = searchres.size();
		
		System.out.println(size);
		if(size > num)
			size = num;
		
		for(int i = 0; i < size; i++) {
			int aid=Integer.parseInt(searchres.get(i)[0]);
			art[i].setId(aid);
			art[i].setTitle(searchres.get(i)[1]);
			//System.out.println(art[i].getTitle());
			String content=searchres.get(i)[2];
			content = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签    

	        content = content.replaceAll("<a>\\s*|\t|\r|\n</a>", "");

	        content = content.replaceAll("&nbsp;", "");
	        
	        content =content.substring(0,200);
	     
	        content=content+"...";
	        //System.out.println(content);
	        art[i].setContent(content);
			//System.out.println(art[i].getContent());
		}
		return art;
	}
	//获得某人的最热文章
	public static Article[] getMyHotArticle(String the) throws ParseException {
        int myid=Integer.parseInt(the);
		DBConn db =new DBConn();
		String sql="select TITLE,ACONTENT,VIEWS,LIKES,PTIME,ARTICLEID from \"REFRESH\".BLOG where AUTHORID='"+myid+"' order by LIKES DESC" ;
		ArrayList<String[]> searchres = db.executeQuery(sql);
		int size = searchres.size();
		System.out.println(size);
		Article[] art = new Article[size];
		for(int i=0;i<size;i++) {
			art[i]=new Article();
		}
		
		for(int i=0;i<size;i++) {
			art[i].setTitle(searchres.get(i)[0]);
			String content=searchres.get(i)[1];
			
			
			content = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签    

	        content = content.replaceAll("<a>\\s*|\t|\r|\n</ a>", "");

	        content = content.replaceAll("&nbsp;", "");
	        
	        content = content.substring(0,200);
	        
	        content=content+"...";
	        //System.out.println(content);
	        art[i].setContent(content);
	        //System.out.println(art[i].getContent());
	        int view=Integer.parseInt(searchres.get(i)[2]);
	        art[i].setViews(view);
	        
	        int like=Integer.parseInt(searchres.get(i)[3]);
	        art[i].setLikes(like);
	        
	        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	        Date date = fmt.parse(searchres.get(i)[4]);
	        art[i].setPublicTime(date);
	        System.out.println(date);
	        int aid=Integer.parseInt(searchres.get(i)[5]);
	        System.out.println(aid);
	        art[i].setId(aid);
		}
		return art;
	}
	//获得某人的最新文章
	public static Article[] getMyTimeArticle(String the) {
    	int myid=Integer.parseInt(the);
		DBConn db =new DBConn();
		String sql="select TITLE,ACONTENT,VIEWS,LIKES,ARTICLEID,PTIME from \"REFRESH\".BLOG where AUTHORID='"+myid+"' order by ARTICLEID DESC" ;
		ArrayList<String[]> searchres = db.executeQuery(sql);
		int size = searchres.size();
		System.out.println(size);
		Article[] art = new Article[size];
		for(int i=0;i<size;i++) {
			art[i]=new Article();
		}
		
		for(int i=0;i<size;i++) {
			art[i].setTitle(searchres.get(i)[0]);
			String content=searchres.get(i)[1];
			
			
			content = content.replaceAll("</?[^>]+>", ""); //剔出<html>的标签    

	        content = content.replaceAll("<a>\\s*|\t|\r|\n</ a>", "");

	        content = content.replaceAll("&nbsp;", "");
	        
	        content = content.substring(0,200);
	        
	        content=content+"...";
	        //System.out.println(content);
	        art[i].setContent(content);
	        //System.out.println(art[i].getContent());
	        int view=Integer.parseInt(searchres.get(i)[2]);
	        art[i].setViews(view);
	        
	        int like=Integer.parseInt(searchres.get(i)[3]);
	        art[i].setLikes(like);
	        
	        int aid=Integer.parseInt(searchres.get(i)[4]);
	        art[i].setId(aid);
	        System.out.println(aid);
	        art[i].setDate(searchres.get(i)[5]);
		}
		return art;
	}
}
