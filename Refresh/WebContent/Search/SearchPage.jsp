<%@page import="Impl.UserImpl"%>
<%@page import="Bean.User"%>
<%@ page import="Bean.Article"%>
<%@ page import="Impl.ArticleImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
	User user = (User)session.getAttribute("user");
	pageContext.setAttribute("user", user);
	String me = "visitor";
	if(user!=null){
		me = user.getUsername();
	}
	String key = request.getParameter("searchkey");			//获得从上个界面发送来的搜索关键字
	System.out.println("Get searche key:" + key + "#");
	
	Article[] art = new Article[5];
	User[] users = new User[4];
	//初始化
	for(int i=0;i<art.length;i++)
		art[i]= new Article();
	for(int i=0;i<users.length;i++)
		users[i]= new User();
	//如果查询词为空，跳回首页
	if(key==null||"".equals(key)){
		response.sendRedirect(basePath+"/homepage.jsp");
	}else{
		int num=5;
		ArticleImpl aImpl = new ArticleImpl();
		art = aImpl.getArticles(num, key);		//通过关键词查询得到num篇文章	
		pageContext.setAttribute("art", art);
		UserImpl uImpl = new UserImpl();		//通过关键词搜索相关用户
		users = uImpl.searchUsers(key);
		pageContext.setAttribute("users", users);
	}
%>
<% int num = 0; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>SearchPage</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="../css/header_and_footer.css" rel="stylesheet" />
<link href="../css/searcher.css" rel="stylesheet" />

<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.js"></script>
<script src="../js/require.js"></script>
</head>

<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="../header_footer/header.jsp" id="iframe-header" style="z-index:1000"></iframe>
<div class="container">
	<div class="row clearfix" style="height:70px;">
	</div>
	<div class="row clearfix">
		<div class="col-md-2 column">
		</div>
		<div class="col-md-8 column">
			<div class="row clearfix" id="top">
				<blockquote>
					<p>相关用户</p>
				</blockquote>
				<div class="row clearfix">
					<div class="col-md-3 column">
						<a class="btn" href="${basePath}/personal/scanpage.jsp?me=<%=me%>&he=<%=users[0].getUsername() %>">
							<img height="140" width="140" src="../image/usericon.JPG" class="img-circle" />
							<blockquote><small><%=users[0].getUsername() %>> </small></blockquote>
						</a>
					</div>
					<div class="col-md-3 column">
						<a class="btn" href="${basePath}/personal/scanpage.jsp?me=<%=me%>&he=<%=users[1].getUsername() %>">
							<img height="140" width="140" src="../image/3.png" class="img-circle" />
							<blockquote><small><%=users[1].getUsername() %></small></blockquote>
						</a>
					</div>
					<div class="col-md-3 column">
						<a class="btn" href="${basePath}/personal/scanpage.jsp?me=<%=me%>&he=<%=users[2].getUsername() %>">
							<img height="140" width="140" src="../image/8.jpg" class="img-circle" />
							<blockquote><small><%=users[2].getUsername() %></small></blockquote>
						</a>
					</div>
					<div class="col-md-3 column">
						<a class="btn" href="${basePath}/personal/scanpage.jsp?me=<%=me%>&he=<%=users[3].getUsername() %>">
							<img height="140" width="140" src="../image/5.jpg" class="img-circle" />
							<blockquote><small><%=users[3].getUsername() %></small></blockquote>
						</a>
					</div>
				</div>
				<blockquote>
					<p>相关话题</p>
				</blockquote>
				<div class="row clearfix">
					<div class="col-md-6 column">
						<a class="btn" href="#">
							<img height="140" width="140" src="../image/1.jpeg" class="img-circle" />
							<blockquote><small>话题一 </small></blockquote>
						</a>
					</div>
					<div class="col-md-6 column">
						<a class="btn" href="#">
							<img height="140" width="140" src="../image/1.jpeg" class="img-circle" />
							<blockquote><small>话题二 </small></blockquote>
						</a>
					</div>
				</div>
			</div>
			<div id="middle">
				<c:forEach var="getArticle" items="${art}" varStatus="num">
		          <div calss="articles">
						<h2>
							<a href="${basePath}/ArticlePage/PersonalBlog2.jsp?articleId=<%=art[num].getId() %>" class="noteTitle" style="color:black;text-decoration:none;">
					       ${getArticle.getTitle()}
						   </a>
						</h2>
						<p>
							${getArticle.getContent()}
						</p>
						<p>
							 <a class="btn" href="${basePath}/ArticlePage/PersonalBlog2.jsp?articleId=<%=art[num].getId() %>">View details »</a>
						</p>
						<% num++;%>
					</div>
					<hr>
	       		</c:forEach>
			</div>
			<div id="bottom">
				<div class="col-md-3 column"></div>
				<div class="col-md-6 column">
					<ul class="pagination" style="text-align:center;">
						<li>
							 <a href="#">Prev</a>
						</li>
						<li>
							 <a href="#">1</a>
						</li>
						<li>
							 <a href="#">2</a>
						</li>
						<li>
							 <a href="#">3</a>
						</li>
						<li>
							 <a href="#">4</a>
						</li>
						<li>
							 <a href="#">5</a>
						</li>
						<li>
							 <a href="#">Next</a>
						</li>
					</ul>
				</div>
				<div class="col-md-3 column"></div>
			</div>
		</div>
		<div class="col-md-2 column">
		</div>
	</div>
</div>
<iframe src="../header_footer/footer.jsp" id="iframe-footer"></iframe>
</body>
</html>