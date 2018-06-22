<%@page import="Bean.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%
 	String basePath = request.getContextPath();
 	pageContext.setAttribute("basePath",basePath);
 	User user = new User();
 	if(session.getAttribute("user")!=null){
 		user = (User)session.getAttribute("user");
 		pageContext.setAttribute("user", user);
 	}else{
 		
 		user.setUserId(0);
 		user.setUsername("游客");
 		pageContext.setAttribute("user",user);
 	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PersonalBlog</title>
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="../css/header_and_footer.css" rel="stylesheet" />
<link href="../css/personal_blog.css" rel="stylesheet" />
<link href="../css/comment.css" rel="stylesheet" />

<script src="${basePath}/js/jquery.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/require.js"></script>
<script src="../js/comment.js"></script>
<script>
//提交评论
function commit(){
	var username="<%=user.getUsername()%>";
	var myDate = new Date();
    //获取当前年
    var year=myDate.getFullYear();
    //获取当前月
    var month=myDate.getMonth()+1;
    //获取当前日
    var date=myDate.getDate();
    var h=myDate.getHours();       //获取当前小时数(0-23)
    var m=myDate.getMinutes();     //获取当前分钟数(0-59)
    if(m<10) m = '0' + m;
    var s=myDate.getSeconds();
    if(s<10) s = '0' + s;
    var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
    //获取输入内容
    var oSize = $('.comment-input').val();
    console.log(oSize);
    //动态创建评论模块
    oHtml = '<div class="comment-show-con clearfix"> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">Cloud : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
    $('.comment-show').prepend(oHtml);
    $('.comment-input').val('')
}

</script>
</head>
<body style="padding-top:50px; margin:8px 0 0 0;">
<iframe src="../header_footer/header.jsp" id="iframe-header" style="z-index:1000"></iframe>
<div class="container"> 
	<div class="row clearfix">
		<div class="col-md-2 column"></div>
		<div class="col-md-8 column">
			<h2>
				《人类群星闪耀时》每一段历史都是英雄人物的舞台
			</h2>
			<!-- 作者区域 -->
	        <div id="author">
	          <a id="avatar" href="#"><img style="width:58px;height:58px;" src="../image/1.jpeg" class="img-circle"/></a>          
	          <div id="info">
	            <span id="authorname"><a href="#">Leonevera</a></span>
	            <!-- 关注用户按钮 -->
	            <a id="btn btn-success follow"><span>关注</span></a>
	            <!-- 文章数据信息 -->
	            <div id="meta">
	                <span class="publish-time" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="最后编辑于 2018.05.28 00:22">2018.05.27 18:22*</span>
	              	<span class="wordage">字数 3172</span>
	            	<span class="views-count">阅读 12249</span>
	            	<span class="comments-count">评论 122</span>
	            	<span class="likes-count">喜欢 147</span>
	            	<span class="rewards-count ">赞赏 3</span></div>
	          </div>
	        </div>
	        <!-- 作者区域 -->
	        <div id="article-content" style="text-indent:34px;font-size:17px;">
				<p class="content">
				大家好,今天推荐的书是《人类群星闪耀时》。这是人类“历史上最好的传记作家”——斯蒂芬·茨威格的传记名作之一。分别向我们展现了13个决定世界历史的瞬间，比如老年歌德热恋的悲歌、滑铁卢的一分钟，英雄的瞬间，南极探险的斗争，西塞罗，威尔逊的梦想与失败以及马赛曲神佑般的创作。而这13个历史瞬间神奇地降临到13位传主的身上，他们或是被命运高高举起，送入英雄们的殿堂；或是被狠狠嘲弄，抛入千秋遗恨的行列。强烈的个人意愿碰撞上历史的潮流，擦出了不一样的灿烂烟火，将人类文明延伸至久远。曾经，这本书里的理想主义、浪漫主义和英雄主义的情绪，影响着中国一代年轻人，现在，闪耀的群星已经陨落，伟大的作品也变成了小众难懂的冷门书，但是历史还在继续，我们能做的只是在岁月流逝中，期待人类群星再次闪耀之时。请读《人类群星闪耀时》
				</p>
				<br>
				<p><strong>精选书摘</strong></p>
				<blockquote>
					<p class="content">
						生活在天涯海角的每一个自然之子都永远会对这些文明人感到诧异。一小撮黄色的金属，在这些文明人看来，竟比他们的文明所取得的一切精神上和技术上的成就都还要有价值。
					</p> <small>Someone famous <cite>Source Title</cite></small>
				</blockquote>
				<blockquote>
					<p class="content">
						那些历史的尖峰时刻都需要太长的酝酿时间，每一桩影响深远的事件都需要一个发展的过程。
					</p>
				</blockquote>
				<blockquote>
					<p class="content">
						就像避雷针的尖端汇聚了整个大气层的电流一样，那些不可胜数的事件也会挤在这最短的时间内发作，但它们的决定性影响却超越时间之上。
					</p>
				</blockquote>
				<blockquote>
					<p class="content">
						这群星闪耀的时刻——之所以这样称呼这些时刻，是因为它们宛若星辰一般永远散射着光辉，普照着暂时的黑夜。
					</p>
				</blockquote>
				<blockquote>
					<p>
						只有一件事会使人疲劳，摇摆不定和优柔寡断。而每做一件事，都会使人身心解放，即使把事情办坏了，也比什么都不做强。
					</p>
				</blockquote>
				<blockquote>
					<p>
						一个真正的具有世界历史意义的时刻，一个人类群星闪耀时刻出现以前，必然会有漫长的岁月无谓地流逝而去，在这种关键的时刻，那些平时慢慢悠悠顺序发生和并列发生的事，都压缩在这样一个决定一切的短暂时刻表现出来。这一时刻对世世代代作出不可改变的决定，它决定着一个人的生死，一个民族的存亡甚至整个人类的命运。
					</p>
					<p>
						为了说明这项工程的巨大规模，这样的比方是最形象不过了：绕在电缆里的36.7万英里长的单股铜铁丝可以绕地球13圈，如果连成一根线，能把地球和月亮连结起来。自从《圣经》上记载有通天塔一来，人类没有敢去想象有比它更宏伟的工程。
					</p>
					<p>
						通过暴力不可能建立一种符合道德的制度，因为任何一种暴力不可避免地会再产生暴力。一旦你们掌握了无期，你们也会很快建立新的专制主义。你们不是破坏专制，而是使它永存下去。
					</p>
				</blockquote>
				<br>
				<p><strong>内容简介</strong></p>
				<p>
					《人类群星闪耀时》由奥地利著名小说家创作。《人类群星闪耀时》内容：涌动着匪徒、探险家、叛乱者兼英雄血液的巴尔沃亚成为第一个看到太平洋的欧洲人；仅仅一秒钟的优柔寡断，格鲁希元帅就决定了拿破仑在滑铁卢之战中失败的命运；七十多岁的歌德像情窦初开的男孩爱上了十几岁的少女，求婚未遂之后，老人在萧萧秋色中一气呵成地创作了《玛丽恩巴德悲歌》；流亡国外的列宁不顾自己的荣辱毁誉，乘坐一列铅封的火车取道德国返回俄国，十月革命就这样开启了历史的火车头……
				</p>
				<br>
				<p><strong>作者简介</strong></p>
				<p>
					斯蒂芬·茨威格：奥地利著名小说家，传记作家，出身于富裕的犹太人家庭。主要作品有《三大师传》《象棋的放事》《昨日的世界》等。青年时代游历世界各地，结识罗曼·罗兰和罗丹等人，并受到他们的影响。第一次世界大战时从事反战工作，成为著名的和平主义者，鼓吹欧洲的统一。20世纪20年代赴苏联，认识了高尔基。1934年遭纳粹驱逐，先后流亡英国、巴西。1942年在孤寂和理想幻灭中与妻子双双自杀。
				</p>
			</div>
			<br>
			<div id="article-foot" style="color:grey;">
				<p>所属话题:&nbsp<span>读书</span>&nbsp<span>名著</span><span style="float:right;">© 著作权归作者所有</span></p>
			</div>
			<div class="commentAll">
				<h3>评论区</h3>
				<hr>
				<!--评论区域 begin-->
				<div class="page-header">
					<h4>发表评论</h4>
				</div>
				<div class="reviewArea clearfix">
					<textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)"></textarea>
					<button type="button" class="plBtn" onclick="commit()">评论</button>
				</div>
				<!--评论区域 end-->
				<!--回复区域 begin-->
				<div class="comment-show">
						<div class="comment-show-con clearfix">
							<div class="comment-show-con-list pull-left clearfix">
								<div class="pl-text clearfix">
									<a href="#" class="comment-size-name">Cloud : </a>
									<span class="my-pl-con">&nbsp;666</span>
								</div>
								<div class="date-dz">
									<span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
									<div class="date-dz-right pull-right comment-pl-block">
										<a href="javascript:;" class="removeBlock">删除</a>
										<span class="pull-left date-dz-line">|</span>
										<a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
									</div>
								</div>
								<div class="hf-list-con"></div>
							</div>
						</div>
					</div>
				<!--回复区域 end-->
			</div>
		</div>
		<div class="col-md-2 column"></div>
	</div>
</div>
<iframe src="../header_footer/footer.jsp" id="iframe-footer"></iframe>
</body>
</html>