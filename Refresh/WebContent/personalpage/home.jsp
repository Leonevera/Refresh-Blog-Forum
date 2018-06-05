<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="DB.*" %>

<html>
    <head>
      <meta charset="GBK">
      <title>home</title>
      <link rel="stylesheet" href="../css/dropcast.css">
      <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Rufina:400,700|Source+Sans+Pro:200,300,400,600,700" rel="stylesheet">
    </head>
    
    <body>
      <div id="site__bg"></div>
      
      <div id="title-image" ><img src="../image/po.jpg" height="150" width="150" /></div>
      <div id="title-name">
        <a href="home.jsp"><p><font size="5">昵称</font></p></a>
        <b><font color="505050" size="2">个人介绍</font></b><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
        <button style="border:none;background-color:white;" onclick="myf()"><b><font style="font-style:italic;" color=grey size="2">修改</font></b></button>
      </div>
      <div id="title-font">
        <div><a href="home.jsp"><h2>关注</h2></a></div>
        <div><a href="home.jsp"><h2>粉丝</h2></a></div>
        <div><a href="home.jsp"><h2>点赞</h2></a></div>
      </div>
      
      <div class="main">
        <div class="episodes">
          <article class="episode">
            <div class="episode__media">
              <a href="home.jsp" class="episode__image"></a>
            </div>
            <div class="episode__detail">
              <a href="home.jsp" class="episode__title"><h4>文章</h4></a>
            </div>
          </article>
          
          <article class="episode">
            <div class="episode__media">
              <a href="home.jsp" class="episode__image"></a>
            </div>
            <div class="episode__detail">
              <a href="home.jsp" class="episode__title"><h4>话题</h4></a>
            </div>
          </article>
          
          <article class="episode">
            <div class="episode__media">
              <a href="home.jsp" class="episode__image"></a>
            </div>
            <div class="episode__detail">
              <a href="home.jsp" class="episode__title"><h4>评论</h4></a>
            </div>
          </article>
          
          <article class="episode">
            <div class="episode__media">
              <a href="home.jsp" class="episode__image"></a>
            </div>
            <div class="episode__detail">
              <a href="home.jsp" class="episode__title"><h4>热门</h4></a>
            </div>
      
      <script src="../js/dropcast.js"></script>
    </body>
</html>