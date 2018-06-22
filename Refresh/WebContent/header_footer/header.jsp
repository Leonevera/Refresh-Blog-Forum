<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
 	String basePath = request.getContextPath();
 	pageContext.setAttribute("basePath",basePath);
 	//通过session获取当前用户登录信息
 	User user = (User)session.getAttribute("user");
	pageContext.setAttribute("user", user);
 %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>header</title>
<!-- css -->
<link href="../css/bootstrap.css" rel="stylesheet" />
<link href="../css/header_and_footer.css" rel="stylesheet" />
<!--javascript-->
<script src="/Refresh/js/jquery.js"></script>
<script src="../js/require.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/header-and-footer.js"></script>
<script>
function exit() {
	var basePath = '<%=basePath%>';
	$.post(basePath+"/UserAction",{type:"exit"},
			function(result){
			if(result=='success'){
				alert('退出成功')
				parent.location.href="../homepage.jsp"
			}
		})
}
</script>
</head>

<body id="header-body">
    <nav class="header-nav navbar navbar-inverse navbar-fixed-top" style="background-color:#e2eadf;border-color:#eee;">
        <div class="container-fluid">

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" style="margin-left:80px;">
                    <li style="font-size:25px;"><a onclick="parent.window.location.href='../homepage.jsp'"> Refresh </a></li>
                    <li><a onclick="parent.window.location.href='../homepage.jsp'">首页</a></li>
                    <li><a onclick="parent.window.location.href='../Easter_egg/I_PAY.html'">下载APP</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right" style="margin-right:80px;">
                    <c:if test="${user==null}">
	                    <li>
	                        <button type="button" class="header-sign-button" data-toggle="modal" data-target="#myModal" onclick="parent.window.location.href='../login/login_sign.jsp'">
	                            登录/注册
	                        </button>
	                    </li>
                    </c:if>
					<c:if test="${user!=null}">
						<li class="dropdownc user-menu">
						 	<!-- The user image in the navbar-->
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-top:10px; padding-bottom:10px;">
								<img src="../image/usericon.JPG" class="user-image img-circle" style="height: 30px" />
							<!-- hidden-xs hides the username on small devices so only the image appears. -->
								<span class="hidden-xs">${user.username} <b class="caret"></b></span>
							</a>
							<ul class="dropdown-menu">
								<li><a onClick="parent.window.location.href='../personal/personal.jsp'">个人主页</a></li>
								<li><a onClick="parent.window.location.href='../personal/modify.jsp'">资料修改</a></li>
								<li><a onClick="exit()">退出</a></li>
							</ul>
						</li>
					</c:if>
                </ul>
                <form id="footer-searcher" class="navbar-form navbar-left navbar-right" target="_top" action="${basePath}/Search/SearchPage.jsp">
                    <span class="form-group">
                        <input id="footer-searcher-input" type="text" name="searchkey" class="form-control" placeholder="搜索">
                    </span>
                    <button type="submit" id="footer-searcher-button" class="btn btn-default">
                        <span>搜索</span>
                    </button>
                </form>
            </div>
        </div>
    </nav>
</body>

</html>