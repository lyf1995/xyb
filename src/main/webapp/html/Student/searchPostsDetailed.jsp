<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
    <%
	    String path = request.getContextPath();
   		String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>岗位详情</title>
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/searchPostsDetailed.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/jquery.dialogbox.css">
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<script type="text/javascript" src="../../js/StudentJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/searchPostsDetailed.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/jquery.dialogBox.js"></script>
	<script src="../../loading/js/loading.js"></script>
</head>
<body>
<!--聊天模态框-->
<div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				${postPojo.comName }
			    <button class="close" data-dismiss="modal"><span style="font-size:40px;">&times;</span></button>
			</div>
			<div class="modal-body clearfix">
				<div class="clearfix">
				</div>
			</div>
			<div class="modal-footer">
				<textarea id="content" class="modalTextarea form-control"></textarea>
				<button id="send" class="btn btn-danger">发送</button>
			</div>
		</div>
	</div>
</div>
<!--dialog弹出框-->
<div id="btn-dialogBox"></div>
<header>
	<div class="top-bar">
	    <div class="top-bar-1200 clearfix">	
	    	<a class="a-ext out" href="exit.html">
	    		<img src="../../images/ext.PNG" alt="">
	    		<span>退出</span>
	    	</a>
	    	<a class="a-info out" href="javascript:;">
	    		<img src="../../images/info.PNG" alt="">
	    		<span>消息</span>
	    	</a>
	    	<a class="a-set out" href="studentInfo.html">
	    		<img src="../../images/set.PNG" alt="">
	    	 	<span>设置</span>
	    	</a>
	    	<div class="a-wel out-up" href="javascript:;">
	    		<span>您好,${studentInfo.username}</span>
	    		<img src="../../images/down.png" alt="">
	    		<ul class="clearfix">
	    			<li><a href="studentInfo.html">个人信息</a></li>
	    			<li><a href="javascript:;">修改密码</a></li>
	    		</ul>
	    	</div>
	    </div>
	</div>
	<div class="logo-bar">
		<div class="logo-bar-1200 clearfix">
			<div class="logo">
				<img src="../../images/logo.PNG" alt="">
			</div>
			<div class="logo-right clearfix">
				<ul id="logo-right-ul" class="clearfix">
					<li><a href="searchPosts.html">查看岗位</a></li>
					<li><a href="teacherRecommend.html">教师推荐</a></li>
					<li>求职管理<img src="../../images/down2.png"  alt="">
						<ul id="logo-right-child-ul" class="clearfix">
							<li><a href="resumeInfo.html">简历管理</a></li>
							<li><a href="hasPost.html">已投递的简历</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>

<div id="middle" class="middle-1200 clearfix">
	<div class="middle-box padding">
		<input id="userId" type="hidden" value="${user.id }">
		<input id="stuId" type="hidden" value="${studentInfo.id }">
		<input id="comId" type="hidden" value="${postPojo.comId }">
		<input id="postId" type="hidden" value="${postPojo.id }">
		<div class="line-90 clearfix">
			<span class="post-name">${postPojo.postName }</span>
			<span class="post-compantyName">${postPojo.comName }</span>
			<button id="callCompanty" class="btn btn-danger" data-toggle="modal" data-target="#myModal">联系公司</button>
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-salary">${postPojo.postSalary }元/月</span>
			<span class="post-jobExp">工作经验：${postPojo.jobExp }</span>
			<span class="post-nature">工作性质：${postPojo.jobNature }</span>
			<span class="post-eduRequset">最低学历：${postPojo.education }</span>
			<c:if test="${postPojo.has=='no' }"><button class="postResume btn btn-danger">投递简历</button></c:if>
			<c:if test="${postPojo.has=='yes' }"><button class="btn btn-has">已经投递</button></c:if>
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-majorRequest">专业范围：${postPojo.postMajor }</span>
			<span class="post-number">招聘人数：${postPojo.postNumber }人</span>
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-address">详细地址：${postPojo.comAddress }</span>
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-contact">联系人：${postPojo.comContacts }</span>
			<span class="post-contactEmail">联系邮箱：${postPojo.comEmail }</span>
			<span class="post-postTime">发布时间：${postPojo.postTimeStr }</span>
		</div>
		<div class="line-90 clearfix margin-top60">
			<div class="gwfl">岗位福利</div>
			<div class="gwfl-detail">
				<input id="gwfl" type="hidden" value="${postPojo.gwfl }">
			</div>
		</div>
		<div class="line-90 clearfix margin-top60">
			<div class="gwzz">岗位职责</div>
			<div class="gwzz-detail">
				<input id="gwzz" type="hidden" value="${postPojo.gwzz }">
			</div>
		</div>
		<div class="line-90 clearfix margin-top60">
			<div class="gwyq">岗位要求</div>
			<div class="gwyq-detail">
				<input id="gwyq" type="hidden" value="${postPojo.gwyq }">
			</div>
		</div>
	</div>
</div>


<footer>
	<div class="footer-1200 clearfix">
		<div class="footer-left">
			© 2013-2017 xybsyw.com Corporation,All Rights Reserved <br>
			浙江校友邦人力资源有限公司 版权所有<br>
			浙ICP备14000179号 
		</div>
		<div class="footer-right">
			网站首页&nbsp;&nbsp;&nbsp;关于我们&nbsp;&nbsp;&nbsp; 联系我们 <br><br>
			加入我们&nbsp;&nbsp;&nbsp;联系中心
		</div>
	</div>			
</footer>

</body>
</html>