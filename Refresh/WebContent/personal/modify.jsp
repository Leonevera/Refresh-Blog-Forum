<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
 	String basePath = request.getContextPath();
 	pageContext.setAttribute("basePath",basePath);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>ModifyInformation</title>
<link href="../css/bootstrap.css" rel="stylesheet" />
<link href="../css/personal.css" rel="stylesheet"> 
<link href="../css/header_and_footer.css" rel="stylesheet" />
<script src="${basePath}/js/jquery.js"></script>
<script src="../js/personal.js" type="text/javascript"></script>

<script>
function modify(){
	var basePath = '<%=basePath%>';
	var username = document.getElementById("username").value
	var email = document.getElementById("email").value
	var oldpassword = document.getElementById("oldpassword").value
	var newpassword = document.getElementById("newpassword").value
	var confirmpassword = document.getElementById("confirmpassword").value
	if(newpassword != confirmpassword){
		alert("两次输入密码不一致！")
		return false
	}
	alert(username)
	$.post(basePath+"/UserAction",{type:"modify"
		,username:username
		,newpassword:newpassword
		,email:email},function(result){
			if(result=='success'){
				alert('修改成功')
				window.location.href="../homepage.jsp"
			}else{
				alert('修改失败')
			}
		})
}
</script>

</head>
<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="../header_footer/header.jsp" id="iframe-header" style="z-index:1000"></iframe>
<!--选项卡-->  
    <div id="tab">  
        <!--选项的头部-->  
        <div id="tab-header">  
            <ul>  
                <li class="selected">资料设置</li>
            </ul>  
        </div>  
        <!--主要内容-->  
        <div id="tab-content">  
            <div class="part" style="display: block;">
				<div id="avatar">
				    <div class="type">
				      	头像
				    </div>
				    <div class="content">
			            <p>
                            <a>
                               <img class="avatar-picture" src="../image/usericon.JPG"></img>
			                </a>
			            </p>   
                           <div id="light1" class="white_content1">
						    <div style="float:left">
						 	   	上传图片
							</div>
                                <div id="msgShut1">
	                            <a href=""><h2>×</h2></a>
	                         </div>	
							 <div class="PictureButton">
							   <a href="">选择图片</a>
							 </div>
							 <div class="PictureDemand">
							   支持jpg、png或bmp格式的图片
							   <br>
                                                      图片需大于180*180像素，小于20M 
							 </div>
                           </div>   
                           <div id="fade1" class="black_overlay1">
                           </div>	
				    </div> 
				</div>
				<div id="nickname">
				    <div class="type">
				      昵称
				    </div>
				    <div class="content">
					  <input type="text" name="username" id="username">
				    </div>
				</div>
				
				<div id="email">
				    <div class="type">
				  邮箱
				  </div>
				  <div class="content">
				       <span></span>
				       <span>未验证</span>
				       <div>
						  <input type="text" name="email" placeholder="在这里输入邮箱" id="useremail" autofocus="autofocus">
					    </div>
					   <br>
					   <div class="EmailLog">
					      <div class="EmailIcon">
						     <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>
						  </div>
						  <div class="EmailLog1">
						     <div class="EmailLog2">
							    <div class="EmailNotice"><h5>验证邮件已发送至您填写的邮箱，请查收并验证</h5></div>
								<a href="#"><div class="EmailLog3">立即登录邮箱验证</div></a>
						     </div>
							 <div class="EmailLog4">
							  <h5>如已验证，请刷新页面</h5>
							  <h5>如果没有收到验证邮件，① 确认邮箱填写正确；② 确认该邮箱已激活；③ 检查垃圾箱；</h5>
                                <h5>   如邮件中链接失效，请点击 &nbsp <a href="#">再次发送验证邮件</a></h5>
							 </div>
						  </div>
					   </div>
				  </div>
				</div>
				
				<div id="nickname">
				   <div class="type">
				   		修改密码
				   </div>
				   <div class="content">
					   <span>请输入原密码</span>
					    <input type="text" name="oldpassword" id="oldpassword"><br><br>
					    <span>请输入新密码</span>
					    <input type="text" name="newpassword" id="newpassword"><br><br>
					    <span>请确认新密码</span>
					    <input type="text" name="confirmpassword" id="confirmpassword"><br>
				   </div>
				</div>
				<br><br><br><br><br>
				
				<div id="nickname">
				  <div class="type">
				  	性别
				  </div>
				  <div class="content">
				      <input type="radio" name="sex" id="male" />
				      <label class="SelectLabel" for="male">男</label>
					  <input type="radio" name="sex" id="female" />
				      <label class="SelectLabel" for="female">女</label>
				  </div>
				</div>
				
				<div id="nickname">
				   <div class="type">
				    	生日
				   </div>
				   <div class="content">
				    <input type="text" name="birthday" placeholder="2000-01-01" id="birthday" autofocus="autofocus"/>
				   </div>
				</div>
				
				<div id="introduction">
				  <div class="type">
				  	个人简介
				  </div>
				  <div class="content">
                     <textarea name="Memo" rows="6" wrap=PHYSICAL cols="60" onKeyDown="gbcount(this.form.Memo,this.form.total,this.form.used,this.form.remain);" onKeyUp="gbcount(this.form.Memo,this.form.total,this.form.used,this.form.remain);"></textarea>       				 
				  </div>
				</div>
				
				<div class="save">
				  	<button id="SaveButton" onClick="modify()" style="margin-left:50px;width:100px;height:50px;border-radius:5px;font-size:20px;background-color:#c4e1c4;">保存</button>
				</div>
				<br>
				<br>
            </div> 
        </div>  
    </div> 
    <div style="height:100px">
    </div>	
<iframe src="../header_footer/footer.jsp" id="iframe-footer"></iframe>
</body>
</html>