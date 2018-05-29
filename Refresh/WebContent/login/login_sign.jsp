<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html>
<%@ page import="DB.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Sign Up Login</title>
<link rel="stylesheet" href="../css/style.css">
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
            <h2>��¼</h2></br>
            <p>��¼�˺ţ�����Refresh֮�ã�</p></br>
            <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
          </div>
        </div>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>ע��</h2></br>
            <p>��û���˺ţ��������ע�ᣡ</p></br>
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
          <input type="text" name="Email" placeholder="Email" />
          <input type="password" name="Password" placeholder="Password" />
          <form action=login.jsp>
          <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
          </form>
        </div>
        <div class="cont_form_sign_up"> <a href="#" onClick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
          <h2>SIGN UP</h2>
          <input type="text" placeholder="Email" />
          <input type="text" placeholder="User" />
          <input type="password" placeholder="Password" />
          <input type="password" placeholder="Confirm Password" />
          <form action=register.jsp>
          <button class="btn_sign_up" onClick="cambiar_sign_up()">SIGN UP</button>
          </form>>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="../js/index.js"></script>

</body>
</html>
