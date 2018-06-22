<%@page import="Bean.User"%>
<%@ page import="Bean.Article"%>
<%@ page import="Impl.ArticleImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
	
	String str=request.getParameter("articleId");	//获得上个页面传来的文章ID
    int articleId=Integer.parseInt(str);
    System.out.println(articleId);
    
	Article art = new Article();
	ArticleImpl aImpl = new ArticleImpl();
	art = aImpl.getArticleById(articleId);			//通过传入的文章ID获取文章内容
	//pageContext.setAttribute("art", art);
	
	User user = new User();							//通过session获得当前登录的用户信息
 	if(session.getAttribute("user")!=null){
 		user = (User)session.getAttribute("user");
 		pageContext.setAttribute("user", user);
 	}else{
 		//未登录时，以游客身份发表评论
 		user.setUserId(4);
 		user.setUsername("visitor");
 		pageContext.setAttribute("user",user);
 	}
 	String me = user.getUsername();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PersonalBlog</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="../css/header_and_footer.css" rel="stylesheet" />
<link href="../css/personal_blog.css" rel="stylesheet" />
<link href="../css/comment.css" rel="stylesheet" />

<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.js"></script>
<script src="../js/require.js"></script>
<script src="../js/comment.js"></script>
<script>
//发表评论
function commit(){
	//获取当前登录用户信息
	var username="<%=user.getUsername()%>";
	var myDate = new Date();
    //获取当前年
    var year=myDate.getFullYear();
    //获取当前月
    var month=myDate.getMonth()+1;
    //获取当前日
    var date=myDate.getDate();
    var h=myDate.getHours();       //获取当前小时数(0-23)
    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
    if(m<10) m = '0' + m;
    var s=myDate.getSeconds();
    if(s<10) s = '0' + s;
    var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
    //获取输入内容
    var oSize = $('.comment-input').val();
    console.log(oSize);
    //动态创建评论模块
    oHtml = '<div class="comment-show-con clearfix"> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">'+username+' : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
    $('.comment-show').prepend(oHtml);
    $('.comment-input').val('')
}
</script>
</head>

<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="../header_footer/header.jsp" id="iframe-header" style="z-index:1000"></iframe>
<div class="container"> 
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column">
			<h2>
				<%=art.getTitle()%>
			</h2>
			<!-- 作者区域Begin -->
	        <div id="author">
	          <a id="avatar" href="#"><img style="width:58px;height:58px;" src="../image/1.jpeg" class="img-circle"/></a>          
	          <div id="info">
	            <span id="authorname"><a href="${basePath}/personal/scanpage.jsp?me=<%=me%>&he=<%=art.getAuthor() %>"><%=art.getAuthor() %></a></span>
	            <!-- 文章数据信息 -->
	            <div id="meta">
	                <span class="publish-time" data-toggle="tooltip" data-placement="bottom">发表时间 <%=art.getDate() %></span>
	              	<span class="wordage">字数 3172</span>
	            	<span class="views-count">阅读 <%=art.getViews() %></span>
	            	<span class="likes-count">喜欢 <%=art.getLikes() %></span>
	            	<span class="rewards-count ">赞赏 3</span>
	            </div>
	          </div>
	        </div>
	        <!-- 作者区域End -->
	        <!-- 文章内容 -->
	        <div id="article-content" style="text-indent:34px;font-size:17px;">
				<%=art.getContent()%>
			</div>
			<br>
			<div id="article-foot" style="color:grey;">
				<p>所属话题:&nbsp<span>读书</span>&nbsp<span>名著</span><span style="float:right;">© 著作权归作者所有</span></p>
			</div>
			<div class="commentAll">
				<h3>评论区</h3>
				<hr>
				<!--评论区域 begin-->
				<div class="page-header">
					<h4>发表评论</h4>
				</div>
				<div class="reviewArea clearfix">
					<textarea class="content comment-input" placeholder="Please enter a comment" onkeyup="keyUP(this)"></textarea>
					<button type="button" class="plBtn" onclick="commit()">评论</button>
				</div>
				<!--评论区域 end-->
				<!--回复区域 begin-->
				<div class="comment-show">
					<div class="comment-show-con clearfix">
						<div class="comment-show-con-list pull-left clearfix">
							<div class="pl-text clearfix">
								<a href="#" class="comment-size-name">Cloud : </a>
								<span class="my-pl-con">&nbsp;666</span>
							</div>
							<div class="date-dz">
								<span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
								<div class="date-dz-right pull-right comment-pl-block">
									<a href="javascript:;" class="removeBlock">删除</a>
									<span class="pull-left date-dz-line">|</span>
									<a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
								</div>
							</div>
							<div class="hf-list-con"></div>
						</div>
					</div>
				</div>
				<!--回复区域 end-->
			</div>
		</div>
		<div class="col-md-2 column"></div>
	</div>
</div>
<iframe src="../header_footer/footer.jsp" id="iframe-footer"></iframe>
</body>
</html>