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
createtopic
</title>


<link href="./css/create_topic.css" rel="stylesheet" />
 <script src="./js/jquery-3.3.1.js"></script>
  <script src="./js/jquery.js"></script>

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
		var content = document.getElementById("toInput").innerHTML;
		//alert(content);
    	var userid=1;
    	
    	$.post(basePath+"/uploadArticle",{content:content
    		,userid:userid},function(result){
    			if(result=='success'){
    				alert('创建成功');
    			}
    			else{
    				alert('创建失败');
    			}
    		})
    }
    
</script>
</head>

<body>
<div class="left_side">
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
	     <span>文章</span>
	  </li>
	  <li class="topic" title="topic">
	     <span>话题</span>
	  </li>
   </ul>
</div>




<div class="contentSide">
      <div class="saved">
	  已保存
	  </div>
	  
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
	  
	 
	  
</div>

</body>
</html>