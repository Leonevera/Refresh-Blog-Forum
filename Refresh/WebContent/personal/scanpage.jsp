<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="DB.DBConn" %>
<%@ page import="Bean.Article" %>
<%@ page import="Impl.ArticleImpl" %>
<%@ page import="java.util.ArrayList" %>
<%
 	String basePath = request.getContextPath();
 	pageContext.setAttribute("basePath",basePath);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="screen"/>
<link href="../css/header_and_footer.css" rel="stylesheet" />
<title>scanpage</title>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.easing.1.3.js"  type="text/javascript"></script>
<script>
<%
String hisname=request.getParameter("he");
String myname=request.getParameter("me");
DBConn db = new DBConn();

String myId = "SELECT UserId from \"REFRESH\".USERINFO where UserName='"+myname+"'";
System.out.println(myId);
String theId = db.getSingleValue(myId);
int me = Integer.parseInt(theId);

String hisId = "SELECT UserId from \"REFRESH\".USERINFO where UserName='"+hisname+"'";
System.out.println(hisId);
String userId = db.getSingleValue(hisId);
int he = Integer.parseInt(userId);

String follow = "SELECT \"REFRESH\".USERINFO.UserId,\"REFRESH\".USERINFO.UserName from \"REFRESH\".USERFOCUS,\"REFRESH\".USERINFO where \"REFRESH\".USERFOCUS.FocusId='"+he+"' and \"REFRESH\".USERFOCUS.FocusedId=\"REFRESH\".USERINFO.UserId";
System.out.println(follow);
ArrayList<String[]> followlist = db.executeQuery(follow);

String fans = "SELECT \"REFRESH\".USERINFO.UserId,\"REFRESH\".USERINFO.UserName from \"REFRESH\".USERFOCUS,\"REFRESH\".USERINFO where \"REFRESH\".USERFOCUS.FocusedId='"+he+"' and \"REFRESH\".USERFOCUS.FocusId=\"REFRESH\".USERINFO.UserId";
System.out.println(fans);
ArrayList<String[]> fanslist = db.executeQuery(fans);

String rel = "SELECT count(*) from \"REFRESH\".USERFOCUS where FocusId='"+me+"' and FocusedId='"+he+"'";
System.out.println(rel);
String relationship = db.getSingleValue(rel);

String topic = "SELECT NAME,ARTNUM,FOCUSNUM from \"REFRESH\".TOPIC where USERID='"+he+"'";
System.out.println(topic);
ArrayList<String[]> topiclist = db.executeQuery(topic);

Article[] art = new Article[10];
for(int i=0; i<art.length; i++)
	art[i] = new Article();
ArticleImpl aImpl = new ArticleImpl();
art = aImpl.getMyTimeArticle(userId);

Article[] artt = new Article[10];
for(int i=0; i<artt.length; i++)
	artt[i] = new Article();
ArticleImpl aImpll = new ArticleImpl();
artt = aImpll.getMyHotArticle(userId);

ArrayList<String[]> articlee =new ArrayList<String[]>();
%>

function showtime(){
	$('#arttime').show();
	$('#arthot').hide();
	$('#arttable').hide();
}

function showhot(){
	$('#arttime').hide();
	$('#arthot').show();
	$('#arttable').hide();
}

function change(){
	var nowrel = document.getElementById("relation").innerHTML;
	var basePath = '<%=basePath%>';
	var me = '<%=me%>';
	var he = '<%=he%>';
	if(nowrel == "关注"){
		document.getElementById("relation").innerHTML = "取消关注";
		$.post(basePath+"/PersonalAction",{type:"follow"
			,me:me
			,he:he},function(result){
				if(result=='success'){
					alert('关注成功')
				}else{
					alert("关注失败")
				}
			})
		window.location.href="../personal/scanpage.jsp?me=<%=myname%>&he=<%=hisname%>"
	 }
	 else{
		 document.getElementById("relation").innerHTML = "关注";
		 $.post(basePath+"/PersonalAction",{type:"quitfollow"
		     ,me:me
			 ,he:he},function(result){
			     if(result=='success'){
				     alert('取消关注成功')
				 }else{
					 alert("取消关注失败")
				 }
			 })
		 window.location.href="../personal/scanpage.jsp?me=<%=myname%>&he=<%=hisname%>"
	 }
}

$(function() {
    var current = 1;
    
    var iterate	= function(){
        var i = parseInt(current+1);
        var lis = 5;
        if(i>lis) i = 1;
        display($('#rotmenu li:nth-child('+i+')'));
    }
    display($('#rotmenu li:first'));
    var slidetime = setInterval(iterate,3000);
	
    $('#rotmenu li').bind('click',function(e){
        clearTimeout(slidetime);
        display($(this));
        e.preventDefault();
    });
	
    function display(elem){
        var $this 	= elem;
        var repeat 	= false;
        if(current == parseInt($this.index() + 1))
            repeat = true;
		
        if(!repeat)
            $this.parent().find('li:nth-child('+current+') a').stop(true,true).animate({'marginRight':'-20px'},300,function(){
                $(this).animate({'opacity':'0.7'},700);
            });
		
        current = parseInt($this.index() + 1);
		
        var elem = $('a',$this);
        
            elem.stop(true,true).animate({'marginRight':'0px','opacity':'1.0'},300);
            var info_elem = elem.next();
             
            show(current);
    }
    
    function show(num){
    	if(current == 1){
    		$('#artchoose').show();
    		$('#arttime').show();
    		$('#arthot').hide();
    		$('#topic').hide();
    		$('#comment').hide();
    		$('#fanstable').hide();
    		$('#focustable').hide();
    	}
    	else if(current == 2){
    		$('#artchoose').hide();
    		$('#arttime').hide();
    		$('#arthot').hide();
    		$('#topic').show();
    		$('#comment').hide();
    		$('#fanstable').hide();
    		$('#focustable').hide();
    	}
    	else if(current == 3){
    		$('#artchoose').hide();
    		$('#arttime').hide();
    		$('#arthot').hide();
    		$('#topic').hide();
    		$('#comment').show();
    		$('#fanstable').hide();
    		$('#focustable').hide();
    	}
    	else if(current == 4){
    		$('#artchoose').hide();
    		$('#arttime').hide();
    		$('#arthot').hide();
    		$('#topic').hide();
    		$('#comment').hide();
    		$('#fanstable').show();
    		$('#focustable').hide();
    	}
    	else{
    		$('#artchoose').hide();
    		$('#arttime').hide();
    		$('#arthot').hide();
    		$('#topic').hide();
    		$('#comment').hide();
    		$('#fanstable').hide();
    		$('#focustable').show();
    	}
    }
});
</script>

</head>

<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="../header_footer/header.jsp" id="iframe-header" style="z-index:1000px;"></iframe>
    <div class="row clearfix">
        <div class="col-md-2 column"></div>
        <div class="col-md-2 column">
	        <a href="#"> <img src="../image/user.jpg" id="userimg" /> </a>
	    </div>
	    <div class="col-md-8 column">
	        <br/><br/><a href="#"> <font size="6"><%=hisname%></font> </a>
	    </div>
	</div>
	  
	<div class="row clearfix" style="height:1000px;">
		<div class=col-md-1></div>
		<div class="col-md-5 column">
		    <div style="display:none;" id="artchoose">
                <button style="background-color:transparent;border:0;" onClick="showtime()">按时间</button>
                <button style="background-color:transparent;border:0;" onClick="showhot()">按热度</button>
            </div>
            <div style="height:800px;display:block;overflow:auto;" class="rottable" id="arttime">
                    <%  for(int i=0; i<art.length; i++){
                    %>
                    <p><font color="000000" size="4"><a href="${basePath}/ArticlePage/PersonalBlog2.jsp?articleId=<%=art[i].getId() %>" style="color:black;text-decoration:none;"><%=art[i].getTitle()%></a></font><span>(<%=art[i].getDate() %>)</span></p>
                    <p><font color="000000" size="2"><%=art[i].getContent()%></font><font size="1">&nbsp&nbsp&nbsp&nbsp(view:<%=art[i].getViews()%> , like:<%=art[i].getLikes()%>)</font></p>
                    <a href="${basePath}/ArticlePage/PersonalBlog2.jsp?articleId=<%=art[i].getId() %>" class="more">Read more</a><br/><hr/>
			        <% } %>
                </div>
                <div style="height:800px;display:none;overflow:auto;" class="rottable" id="arthot">
                    <%  for(int i=0; i<artt.length; i++){
                    %>
                    <p><font size="4"><a href="${basePath}/ArticlePage/PersonalBlog2.jsp?articleId=<%=artt[i].getId() %>" style="color:black;text-decoration:none;"><%=artt[i].getTitle()%></a></font></p>
                    <p><font size="2"><%=artt[i].getContent()%></font><font size="1">&nbsp&nbsp&nbsp&nbsp(view:<%=artt[i].getViews()%> , like:<%=artt[i].getLikes()%>)</font></p>
                    <a href="${basePath}/ArticlePage/PersonalBlog2.jsp?articleId=<%=artt[i].getId() %>" class="more">Read more</a><br/><hr/>
			        <% } %>
                </div>
            <div style="height:800px;display:none;overflow:auto;" class="rottable" id="topic">
		            <%  for(int i=0; i<topiclist.size(); i++){ 
			        String name = topiclist.get(i)[0];
			        String artnum = topiclist.get(i)[1]; 
			        String focnum = topiclist.get(i)[2];%>
			        <a href="#" ><font size="4"># <%=name%> #</font></a><br/>
                    <p><font color="000000" size="2">(article:<%=artnum%> , focus:<%=focnum%>)</font><a href="#" class="more">   Read more</a></p><hr/>
                    <% } %>
	        </div> 
	        <div style="height:800px;display:none;overflow:auto;" class="rottable" id="comment"> At vero eos et accusamus et iusto odio
                    dignissimos ducimus qui blanditiis praesentium
                    voluptatum deleniti atque corrupti quos dolores et
                    quas molestias excepturi sint occaecati cupiditate
                    non provident... <a href="#" class="more">Read more</a>
            </div>
            <div style="height:800px;display:none;overflow:auto;" class="rottable" id="focustable"><br/>
			    <table style="width:130px;">
			    <%  for(int i=0; i<followlist.size(); i++){ 
			        String id = followlist.get(i)[0];
			        String name = followlist.get(i)[1]; %>
                    <tr> <td style="text-align:center;"><a href="../personal/scanpage.jsp?me='<%=he%>'&he=<%=name%>" class="personal"><%=name%></a></td> </tr>  
		        <% } %>
		        </table>
	        </div>
	        <div style="height:800px;display:none;overflow:auto;" class="rottable" id="fanstable"><br/>
			    <table style="width:130px;">
			    <%  for(int i=0; i<fanslist.size(); i++){ 
			        String id = fanslist.get(i)[0];
			        String name = fanslist.get(i)[1]; %>
                    <tr> <td style="text-align:center;"><a href="../personal/scanpage.jsp?me='<%=he%>'&he=<%=name%>" class="personal"><%=name%></a></td> </tr>  
		        <% } %>
		        </table>
	        </div>
        </div>    
        <div class="col-md-3 column">
            <div class="rotator">
                <ul id="rotmenu">
                    <li> <a href="rot1">Article</a>
                    </li>
                    <li> <a href="rot2">Topic</a>
                    </li>
                    <li> <a href="rot3">Comment</a>
                    </li>
                    <li> <a href="rot4">Follow</a>
                    </li>
                    <li> <a href="rot5">Fans</a>
                    </li>
                </ul>
		    </div>
        </div>   
		<div class="col-md-3 column">
		    <%  if (relationship.trim().equals("1")){
		        %> <font size="5"><button style="height:50px;width:150px;border-radius:10px;" id="relation" onclick="change()">取消关注</button></font>
		    <% }else{
		        %> <font size="5"><button style="height:50px;width:150px;border-radius:10px;" id="relation" onclick="change()">关注</button></font>
		    <% }%>
        </div>
	</div>
<iframe src="../header_footer/footer.jsp" id="iframe-footer"></iframe>
</body>
</html>