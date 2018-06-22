<%@ page import="Bean.Article"%>
<%@ page import="Impl.ArticleImpl"%>
<%@ page import ="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
	
	Article[] art = new Article[8];
	for(int i=0;i<art.length;i++)
		art[i]= new Article();
	
	ArticleImpl aImpl = new ArticleImpl();
	art = aImpl.getRecentArticle();				//数据库内搜索得到最新文章
	pageContext.setAttribute("art", art);
	int num = 0;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>homepage</title>

<script src="./js/jquery.js"></script>
   <script src="./js/bootstrap.js"></script>
   <script src="./js/require.js"></script>


<link href="./css/header_and_footer.css" rel="stylesheet" />

<link rel="stylesheet" href="./css/homepage.css" />
<style>
body{margin: 0;font-family: "微软雅黑";}
.example {
width: 660px;
height: 350px;
font-size: 40px;
text-align: center;
margin: 80px 0px;
margin-top:60px;
margin-left:0;
float:left;
}
.carousel-item{
line-height: 336px;
color: #fff;
font-family:  Arial Black;
}
</style>

</head>
<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="./header_footer/header.jsp" id="iframe-header" style="z-index:1000"></iframe>
<div class="container">
<div>
<div id="left">
</div>
<div class="example">
	<div class="ft-carousel" id="carousel_1">
		<ul class="carousel-inner">
		<li class="carousel-item"><img src="./image/1.jpeg" /></li>
			<li class="carousel-item"><img src="./image/2.jpeg" /></li>
			<li class="carousel-item"><img src="./image/3.png" /></li>
			<li class="carousel-item"><img src="./image/4.jpg" /></li>
			<li class="carousel-item"><img src="./image/5.jpg" /></li>
			<li class="carousel-item"><img src="./image/6.jpg" /></li>
			
		</ul>
	</div>
</div>
<div id="right">
</div>
</div>
<!--卡片-->

   <div class="card">
     
	 <a class="cardPart">
	    <img src="./image/4.jpg">
	 </a>
	 
	 <a class="cardPart1">
	    <img src="./image/5.jpg">
	 </a>
	 
	 <a class="cardPart1">
	    <img src="./image/1.jpeg">
	 </a>
	 
	 <a class="cardPart1">
	    <img src="./image/2.jpeg">
	 </a>
	 
	 <a class="cardPart2">
	    <img src="./image/3.png">
	 </a>
	 
	 <a class="cardPart3">
	    <img src="./image/6.jpg">
	 </a>
	 
	 <a class="cardPart3">
	    <img src="./image/7.jpeg">
	 </a>
	 
	 <a class="cardPart3">
	    <img src="./image/8.jpg">
	 </a>
   
   </div>
   
   <!-- 展示最新文章 -->
   <div class="article">
   
       <ul class="noteList">
       <c:forEach var="getArticle" items="${art}" varStatus="num">
           <li>
			   <a href="" class="wrap-img">
			      <img src="./image/1.jpeg">
			   </a>
			   
			   <div class="content">
			       <a href="${basePath}/ArticlePage/PersonalBlog2.jsp?articleId=${getArticle.getId()}" class="noteTitle">
			       ${getArticle.getTitle()}
				   </a>
			       <p class="abstract">
				    ${getArticle.getContent()}
				    </p>
				   <div class="meta">
				      <a href="" class="nickname">
					   ${getArticle.getAuthor()} 
					  </a>
					  <a href="" >
					       评论：131
					  </a>
					  <a href="" >
					       收藏：274
					  </a>
					  <a href="" >
					       打赏：5
					  </a>
				   </div>
			   </div>
			</li>
			
        </c:forEach>
	   </ul>
   
   </div>
   
  
   <div class="rightSide">
      
	  <div class="board">
	     <a href="./homepage.jsp" class="partition">
            30日热门
         </a>
		 
		 <a href="" class="partition">
            7日最新
         </a>
		 
		 <a href="./ArticlePage/publishArticle.jsp" class="partition">
             写文章
         </a>
		 
		 <a href="./topic/topicDetail.jsp" class="partition">
            话题
         </a>
	  </div>
      <div class="recommendAuthor">
	       <div class="title">
		     <span>推荐作者</span>
			 <a href="" class="page-change">
			  换一批
			 </a>
		   </div>
		   
		   <ul class="list">
		      <li>
			     <a href="" class="avatar">
				    <img src="./image/6.jpg">
				 </a>
				 <a href="" class="follow"> 
				    关注
				 </a>
				 <a href="" class="name">
				 寻麦
				 </a>
				 <p>
				   写了21.3k字，1.3k喜欢
				 </p>
			  </li>
			  
			  <li>
			     <a href="" class="avatar">
				    <img src="./image/2.jpeg">
				 </a>
				 <a href="" class="follow"> 
				    关注
				 </a>
				 <a href="" class="name">
				 孔明
				 </a>
				 <p>
				   写了21.3k字，1.3k喜欢
				 </p>
			  </li>
			  
		      <li>
			     <a href="" class="avatar">
				    <img src="./image/3.png">
				 </a>
				 <a href="" class="follow"> 
				    关注
				 </a>
				 <a href="" class="name">
				 refresh
				 </a>
				 <p>
				   写了21.3k字，1.3k喜欢
				 </p>
			  </li>
			  
			  <li>
			     <a href="" class="avatar">
				    <img src="./image/7.jpeg">
				 </a>
				 <a href="" class="follow"> 
				    关注
				 </a>
				 <a href="" class="name">
				 简书
				 </a>
				 <p>
				   写了21.3k字，1.3k喜欢
				 </p>
			  </li>
			  
			  <li>
			     <a href="" class="avatar">
				    <img src="./image/8.jpg">
				 </a>
				 <a href="" class="follow"> 
				    关注
				 </a>
				 <a href="" class="name">
				 寻麦
				 </a>
				 <p>
				   写了21.3k字，1.3k喜欢
				 </p>
			  </li>
			  
		   </ul>
		   
		   
		   <a href="" class="find-more">
		      查看全部 >
		   </a>
	  
	  </div>
   </div>
</div>
<iframe src="./header_footer/footer.jsp" id="iframe-footer" style="margin-top:1000px;"></iframe>


<script src="./js/jquery.min.js"></script>
<script src="./js/ft-carousel.min.js"></script>
<script type="text/javascript">
	$("#carousel_1").FtCarousel();

	$("#carousel_2").FtCarousel({
		index: 1,
		auto: false
	});

	$("#carousel_3").FtCarousel({
		index: 0,
		auto: true,
		time: 3000,
		indicators: false,
		buttons: true
	});
</script>
</body>
</html>