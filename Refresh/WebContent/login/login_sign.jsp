<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
 	String basePath = request.getContextPath();
 	pageContext.setAttribute("basePath",basePath);
 %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sign Up Login</title>
<link rel="stylesheet" href="../css/login.css">
<script src="${basePath}/js/jquery.js"></script>
<script src="../js/login.js"></script>
<script>
function login(){
	var basePath = '<%=basePath%>';
	var username = $('#username').val()
	var password = $('#password').val()
	
	$.post(basePath+"/UserAction",{type:"login"
		,username:username
		,password:password},function(result){
			if(result=='success'){
				alert('登录成功')
				window.location.href="../homepage.jsp"
			}else{
				alert('登录失败')
			}
		})
}
function register(){
	var basePath = '<%=basePath%>';
	var email = $('#email').val()
	var username = $('#usernamer').val()
	var password = $('#passwordr').val()
	var conpassword = $('#conpassword').val()
	if(email == ""){
		alert("邮箱不能为空！")
		return false
	}
	if(username == ""){
		alert("用户名不能为空！")
		return false
	}
	if(password == ""){
		alert("密码不能为空！")
		return false
	}
	if(password != conpassword){
		alert("两次输入密码不一致！")
		return false
	}
	
	$.post(basePath+"/UserAction",{type:"register"
		,email:email
		,username:username
		,password:password},function(result){
			if(result=='success'){
				alert('注册成功')
				window.location.href="../homepage.jsp"
			}else{
				alert("注册失败")
			}
		})
}
</script>
</head>

<body>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<div class="cotn_principal">
  <div class="cont_centrar">
    <div class="cont_login">
      <div class="cont_info_log_sign_up">
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>登录</h2></br>
            <p>登录账号，开启Refresh之旅！</p></br>
            <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
          </div>
        </div>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>注册</h2></br>
            <p>还没有账号？点击这里注册！</p></br>
            <button class="btn_sign_up" onClick="cambiar_sign_up()">SIGN UP</button>
          </div>
        </div>
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="../image/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="../image/po.jpg" alt="" /> </div>
        <div class="cont_form_login"> <a href="#" onClick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
          <h2>LOGIN</h2>
          <input type="text" id="username" name="Username" placeholder="Username" />
          <input type="password" id="password" name="Password" placeholder="Password" />
          <button type="button" class="btn_login" onClick="login()">LOGIN</button>
        </div>
        <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
          <h2>SIGN UP</h2>
          <input type="text" id="email" placeholder="Email" />
          <input type="text" id="usernamer" placeholder="User" />
          <input type="password" id="passwordr" placeholder="Password" />
          <input type="password" id="conpassword" placeholder="Confirm Password" />
          <button class="btn_sign_up" onClick="register()">SIGN UP</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
