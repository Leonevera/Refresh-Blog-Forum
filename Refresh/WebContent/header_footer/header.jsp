<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>header</title>

    <!-- css -->
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/header_and_footer.css" rel="stylesheet" />

    <!--javascript-->
    <script src="../js/jquery.js"></script>
    <script src="../js/require.js"></script>
    <script src="../js/bootstrap.js"></script>

    <script src="../js/header-and-footer.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="header-body">
    <nav class="header-nav navbar navbar-inverse navbar-fixed-top" style="background-color:#e2eadf;border-color:#eee;">
        <div class="container-fluid">

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" style="margin-left:80px;">
                    <li style="font-size:25px;"><a href="#"> Refresh </a></li>
                    <li><a href="#">首页</a></li>
                    <li><a href="#">下载APP</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right" style="margin-right:80px;">
                    <li>
                        <!-- Button trigger modal -->
                        <button type="button" class="header-sign-button" data-toggle="modal" data-target="#myModal">
                            登录/注册
                        </button>
                    </li>
                </ul>

                <form id="footer-searcher" class="navbar-form navbar-left navbar-right">
                    <span class="form-group">
                        <input id="footer-searcher-input" type="text" class="form-control" placeholder="搜索">
                    </span>
                    <button type="button" id="footer-searcher-button" class="btn btn-default" onclick="window.open('../searcher/searcher.html','','')">
                        <span>搜索</span>
                    </button>
                </form>
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

</body>

</html>