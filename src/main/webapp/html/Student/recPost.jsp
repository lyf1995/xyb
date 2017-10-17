<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>教师推荐岗位</title>
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/recPost.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/jquery.dialogbox.css">
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<script type="text/javascript" src="../../js/StudentJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/recPost.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/jquery.dialogBox.js"></script>
	<script src="../../loading/js/loading.js"></script>
</head>
<body>
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
	    		<span>您好,${studentInfo.username }</span>
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
	<div class="search-box">
		<span>全部</span>
		<ul>
			<li>全部</li>
			<li>实习</li>
			<li>就业</li>
			<li>实习+就业</li>
		</ul>
		<input type="text" name="searchTest" class="form-control" placeholder="请输入公司或者职位名称">
		<button type="search-btn" class="btn btn-danger">搜&nbsp;&nbsp;&nbsp;索</button>
	</div>
	<div class="post-show">
		<c:forEach var="post" items="${posts}">
			<div class="post-show-box" data-postid="${post.id }">
				<div class="operation-show clearfix">
					<a href="searchPostsDetailed.html?postId=${post.id }" class="a-danger a-big searchPostsDetailed">查看岗位详情</a>
					<c:if test="${post.has=='no'}"><a href="javascript:;" class="a-danger a-big postResume">投递简历</a></c:if>
					<c:if test="${post.has=='yes'}"><a href="javascript:;" class="a-has a-big">已经投递</a></c:if>
				</div>
				<div class="company-logo">
					<c:choose>  
						<c:when test="${empty post.companyInfo.comLogo}">
							<img id="post-show-comLogo" src="../../images/defalut.png" alt="企业logo">
						</c:when>  
						<c:otherwise>
							<img id="post-show-comLogo" src="${post.companyInfo.comLogo }" alt="企业logo">
						</c:otherwise>  
					</c:choose> 
				</div>
				<div class="post-show-top">
					<div class="post-show-name">${post.postName }</div>
					<div class="post-show-salary">${post.postSalary }元/月</div>
					<div class="post-show-jobExp">工作经验：${post.jobExp }</div>
					<div class="post-show-nature">工作性质：${post.jobNature }</div>
				</div>
				<div class="post-show-bottom">
					<div class="post-show-company">${post.companyInfo.comName }</div>
					<div class="post-show-address">${post.companyInfo.comAddress }</div>
					<div class="post-show-time">发布时间：${post.postTimeStr }</div>
				</div>
			</div>
		</c:forEach>
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