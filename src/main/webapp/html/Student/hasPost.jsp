<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>已投递的简历</title>
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/hasPost.css">
	<script type="text/javascript" src="../../js/StudentJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/hasPost.js"></script>
</head>
<body>
<header>
	<div class="top-bar">
	    <div class="top-bar-1200 clearfix">	
	    	<a class="a-ext out" href="javascript:;">
	    		<img src="../../images/ext.PNG" alt="">
	    		<span>退出</span>
	    	</a>
	    	<a class="a-info out" href="javascript:;">
	    		<img src="../../images/info.PNG" alt="">
	    		<span>消息</span>
	    	</a>
	    	<a class="a-set out" href="personInfo.html">
	    		<img src="../../images/set.PNG" alt="">
	    	 	<span>设置</span>
	    	</a>
	    	<div class="a-wel out-up" href="javascript:;">
	    		<span>您好,${studentInfo.username}</span>
	    		<img src="../../images/down.png" alt="">
	    		<ul class="clearfix">
	    			<li><a href="personInfo.html">个人信息</a></li>
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
	<div class="middle-box">
		<div class="middle-box-top">
			<h4>已投递的简历</h4>
		</div>
		<hr>
		<div class="middle-box-bar clearfix">
			<ul>
				<li class="on">全部</li>
				<li>被查看</li>
				<li>待沟通</li>
				<li>邀请面试</li>
				<li>不合适</li>
			</ul>
		</div>
		<div class="middle-box-lists">
			<c:forEach var="hasPost" items="${hasPosts }">
				<div class="middle-box-content clearfix">
					<div class="middle-box-content-top clearfix">
						<div class="deliverTime">投递时间：${hasPost.sendTimeStr }</div>
						<div class="post-name">${hasPost.post.postName }</div>
						<div class="post-salary">${hasPost.post.postSalary }元/月</div>
						<div class="post-jobExp">工作经验:${hasPost.post.jobExp }</div>
						<div class="post-eduRequset">最低学历：${hasPost.post.education }</div>
					</div>
					<div class="middle-box-content-bottom clearfix">
						<div class="post-status">${hasPost.status }</div>
						<div class="post-company">${hasPost.post.companyInfo.comName }</div>
						<div class="post-address">${hasPost.post.companyInfo.comAddress }</div>
						<div class="post-time">发布时间：${hasPost.postTimeStr }</div>
					</div>
				</div>
			</c:forEach>
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