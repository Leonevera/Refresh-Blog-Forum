<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
	pageContext.setAttribute("basePath", basePath);
%>
<!DOCTYPE html>
<html>
<head>
<title>
publishArticle
</title>
<link href="../css/create_topic.css" rel="stylesheet" />
<link href="../css/header_and_footer.css" rel="stylesheet" />
<script src="../js/jquery-3.3.1.js"></script>
<script src="../js/jquery.js"></script>
<script>
function checktext(text)     
{     
    allValid = true;     
    for (i = 0; i < text.length; i++)     
    {     
      if (text.charAt(i) != " ")     
      {     
        allValid = false;     
        break;     
      }     
    }     
return allValid;     
}     
function gbcount(message,total,used,remain)     
{     
 var max;     
 max = total.value;     
if (message.value.length > max) {     
message.value = message.value.substring(0,max);     
used.value = max;     
remain.value = 0;     
<!-- alert("留言不能超过 200 个字!");-->    
alert("不能超过"+total.value+"个字!");     
}     
else {     
used.value = message.value.length;     
remain.value = max - used.value;     
}     
}  
function getContent(){
   	var basePath = '<%=basePath%>';
	//var content = document.getElementById("toInput").innerHTML;
	var title=document.getElementById("articleTitle").value;
	var content= $('#content').html();
	//alert(content);
   	var userid=1;
   	
   	$.post(basePath+"/uploadArticle",{content:content
   		,userid:userid
		,title:title},function(result){
   			if(result=='fail'){
   				alert('发表失败');
   			}
   			else{
   				alert('发表成功');
   				window.location.href='../personal/personal.jsp';
   			}
   		})
   }
function searchTopic(){
  var a=document.getElementById('searchResult');
  a.style.display='none';
  
  var basePath = '<%=basePath%>';
  var topic=document.getElementById("topicOfArticle").value;
}
</script>
</head>

<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="../header_footer/header.jsp" id="iframe-header"></iframe>
<div class="left_side" style="margin-top:0">
   <div class="comeback">
        <a href="">返回主页</a>
   </div>
   <div class="createFolder">
      <div class="describe">
	     <span>新建文集</span>
	  </div>
	  <div id="newContent">
	     <form class="inputContent">
		     <input type="text" placeholder="请输入文集名" name="name" class="getInput">
		 <button type="submit" class="save1">
		    <span>提交</span>
		 </button>
		 <button type="submit" class="cancel1">
		    <span>取消</span>
		 </button>
	  </div>
   </div>
   
   <ul class="contentList">
      <li class="passageList" title="passage">
	     <span>日记</span>
	  </li>
	  <li class="topic" title="topic">
	     <span>文章</span>
	  </li>
   </ul>
</div>

<div class="contentSide">
    <div style="border:solid 1px black">
      <div class="saved">
	  已保存
	  </div>
	  <!--
	  <div class="newArticle">
	       <textarea id="articleTitle" name="articleTitle" rows="5" wrap=PHYSICAL cols="100" >
		     无标题文章
		   </textarea>
	  </div>
	  -->
	  <input type="text" id="articleTitle" name="articleTitle" value="无标题文档" style=""></textarea>
	   <div class="isolation" style=""></div>
	  <div id="toolbar" class="toolbar">
      </div>
	
	<div id="content" class="text">
        <p>请在这里输入你的文章内容</p>
        <
    </div>
	
	</div> 
	  <!--
	  <div id="topicContent">
		  <form action="SaveData.asp" method="post" >  
		    
               <textarea id="toInput" name="Memo" rows="10" wrap=PHYSICAL cols="60" onKeyDown="gbcount(this.form.Memo,this.form.total,this.form.used,this.form.remain);" onKeyUp="gbcount(this.form.Memo,this.form.total,this.form.used,this.form.remain);"></textarea>    
                  <p>
					   最多字数：     
                       <input disabled maxLength="4" name="total" size="3" value="80" class="inputtext">    
                       已用字数：     
                      <input disabled maxLength="4" name="used" size="3" value="0" class="inputtext">    
                       剩余字数：     
                      <input disabled maxLength="4" name="remain" size="3" value="80" class="inputtext"></td>    
                   </p>    
   
           </form>    				 
      </div>
	  
	  <button type="button" class="save2" onclick="getContent()">
		    <span>保存</span>
	  </button>
	  -->
	  <button onclick="getContent()" class="uploadButton">发表</button><br/>
	  <!--
	  <div class="topicNotic">请在此输入您的文章所属话题</div>
	  <input type="text" id="topicOfArticle" name="topicOfArticle" value="请在此输入您的文章所属话题" style="">
	  <button onclick="searchTopic()" class="searchTopic" type="button">搜索话题</button>
	  
	  <div id="searchResult" >
	      <button id="topicResult" onclink="changeContent">话题1</button>
	      <button id="topicResult" onclink="changeContent">话题2</button>
	      <button id="topicResult" onclink="changeContent">话题3</button>
	      <button id="topicResult" onclink="changeContent">话题4</button>
	      <button id="topicResult" onclink="changeContent">话题5</button>
	      <button id="topicResult" onclink="changeContent">话题5</button>
	  </div>
	  <div id="up">保存</div>
	  -->
</div>
<iframe src="../header_footer/footer.jsp" id="iframe-footer" style="margin-top:100px;"></iframe>
<script type="text/javascript" src="../js/wangEditor.min.js"></script>
<script type="text/javascript">
     var E = window.wangEditor
     var editor = new E('#toolbar','#content')
     //或var editor = new E( document.getElementById('editor') )
     editor.create()
</script>
</body>
</html>