<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
 	String basePath = request.getContextPath();
 	pageContext.setAttribute("basePath",basePath);
 %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>footer</title>
    <!-- css -->
    <link href="../css/header_and_footer.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <!--javascript-->
    <script src="../js/require.js"></script>
	<script src="${basePath}/js/jquery.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/header-and-footer.js"></script>
</head>
<body>
    <div id="footer-body">
        <div class="container">
            <div class="footer-brand text-center">
                <h2 class="">Refresh</h2>
            </div>
            <hr style="color:#fff;margin:-10px 0 10px 0;" />
            <hr style="color:#fff;margin:-10px 0 10px 0;" />
            <hr style="color:#fff;margin:-10px 0 10px 0;" />
            <hr style="color:#fff;margin:-10px 0 10px 0;" />
            <hr style="color:#fff;margin:-10px 0 10px 0;" />
            <div style="color:#555; margin-top:20px" class="text-center">
            	Designed By : Xiao Ruojin, Yang Wanqing, Yang Xujin
            	<br/>
            	Copyright © 2018 School of Information, Renmin University of China. All rights reserved.
            </div>

        </div>
    </div>


</body>
</html>