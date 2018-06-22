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
 	User user = (User)session.getAttribute("user");
	pageContext.setAttribute("user", user);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css" type="text/css" media="screen"/>
<link href="../css/header_and_footer.css" rel="stylesheet" />
<title>personalpage</title>
<script src="../js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.easing.1.3.js" type="text/javascript"></script>
<script>
<%
//String username=request.getParameter("username");
String username=user.getUsername();
DBConn db = new DBConn();
String uId = "SELECT UserId from \"REFRESH\".USERINFO where UserName='"+username+"'";
System.out.println(uId);
String me = db.getSingleValue(uId);

String follow = "SELECT \"REFRESH\".USERINFO.UserId,\"REFRESH\".USERINFO.UserName from \"REFRESH\".USERFOCUS,\"REFRESH\".USERINFO where \"REFRESH\".USERFOCUS.FocusId='"+me+"' and \"REFRESH\".USERFOCUS.FocusedId=\"REFRESH\".USERINFO.UserId";
System.out.println(follow);
ArrayList<String[]> followlist = db.executeQuery(follow);

String fans = "SELECT \"REFRESH\".USERINFO.UserId,\"REFRESH\".USERINFO.UserName from \"REFRESH\".USERFOCUS,\"REFRESH\".USERINFO where \"REFRESH\".USERFOCUS.FocusedId='"+me+"' and \"REFRESH\".USERFOCUS.FocusId=\"REFRESH\".USERINFO.UserId";
System.out.println(fans);
ArrayList<String[]> fanslist = db.executeQuery(fans);

String topic = "SELECT NAME,ARTNUM,FOCUSNUM from \"REFRESH\".TOPIC where USERID='"+me+"' ";
System.out.println(topic);
ArrayList<String[]> topiclist = db.executeQuery(topic);

Article[] art = new Article[10];
for(int i=0; i<art.length; i++)
	art[i] = new Article();
ArticleImpl aImpl = new ArticleImpl();
art = aImpl.getMyTimeArticle(me);

Article[] artt = new Article[10];
for(int i=0; i<artt.length; i++)
	artt[i] = new Article();
ArticleImpl aImpll = new ArticleImpl();
artt = aImpll.getMyHotArticle(me);
ArrayList<String[]> articlee =new ArrayList<String[]>();
%>

function change(id){
	 var tb=document.getElementById(id);
	 if(tb.style.display=='none') tb.style.display='block';
	 else tb.style.display='none';
}

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

$(function() {
    var current = 1;
    var iterate	= function(){
        var i = parseInt(current+1);
        var lis = 3;
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
    	}
    	else if(current == 2){
    		$('#artchoose').hide();
    		$('#arttime').hide();
    		$('#arthot').hide();
    		$('#topic').show();
    		$('#comment').hide();
    	}
    	else{
    		$('#artchoose').hide();
    		$('#arttime').hide();
    		$('#arthot').hide();
    		$('#topic').hide();
    		$('#comment').show();
    	}
    }
});
</script>
</head>

<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="../header_footer/header.jsp" id="iframe-header" style="z-index:1000;"></iframe>
    <div class="row clearfix">
    	<div class="col-md-2 column"></div>
        <div class="col-md-2 column">
	        <a href="#"> <img src="../image/user.jpg" id="userimg" /> </a>
	    </div>
	    <div class="col-md-8 column">
	        <br/><br/><a href="#"> <font size="6"><%=username%></font> </a>
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
                </ul>
		    </div>
        </div>
		<div class="col-md-3 column">
			<br/><br/><button style="width:130px;height:40px;border-radius:10px;" onClick="window.location.href='../ArticlePage/publishArticle.jsp'"><font size="5">写文章</font></button><br/>
			<br/><br/><button style="width:130px;height:40px;border-radius:10px;" onClick="change('focustable')"><font size="5">关注</font></button><br/>
			<div style="display:none;" id="focustable">
			    <table style="width:130px;overflow:auto;">
			        <%  for(int i=0; i<followlist.size(); i++){ 
			        	String id = followlist.get(i)[0];
			        	String name = followlist.get(i)[1];
			            %>
                        <tr> <td style="text-align:center;"><a href="../personal/scanpage.jsp?me=<%=username%>&he=<%=name%>" class="personal"><%=name%></a></td> </tr>
			        <% } %>
			    </table>
			</div>
		    <br/><button style="width:130px;height:40px;border-radius:10px;" onClick="change('fanstable')"><font size="5">粉丝</font></button><br/>
		    <div style="display:none;" id="fanstable">
			    <table style="width:130px;overflow:auto;">
			        <%  for(int i=0; i<fanslist.size(); i++){ 
			            String id = fanslist.get(i)[0];
			            String name = fanslist.get(i)[1];%>
                        <tr> <td style="text-align:center;"><a href="../personal/scanpage.jsp?me=<%=username%>&he=<%=name%>" class="personal"><%=name%></a></td> </tr>
			        <% } %>
			    </table>
			</div>
        </div>
	</div>
<iframe src="../header_footer/footer.jsp" id="iframe-footer"></iframe>
</body>
</html>