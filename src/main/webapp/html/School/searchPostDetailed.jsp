﻿<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>岗位详情</title>
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/searchPostDetailed.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/jquery.dialogbox.css">
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<script type="text/javascript" src="../../js/SchoolJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/searchPostDetailed.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/jquery.dialogBox.js"></script>
	<script src="../../loading/js/loading.js"></script>
</head>
<body>
<!--dialog弹出框-->
<div id="btn-dialogBox"></div>
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
	    	<a class="a-set out" href="schoolInfo.html">
	    		<img src="../../images/set.PNG" alt="">
	    	 	<span>设置</span>
	    	</a>
	    	<div class="a-wel out-up" href="javascript:;">
	    		<span>您好,${schoolInfo.username }</span>
	    		<img src="../../images/down.png" alt="">
	    		<ul class="clearfix">
	    			<li><a href="schoolInfo.html">学校信息</a></li>
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
					<li><a href="Internship.html">实习计划</a></li>
					<li><a href="searchPost.html">查看岗位</a></li>
					<li><a href="schoolRecruit.html">我的校招</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>

<div id="middle" class="middle-1200 clearfix">
	<div class="middle-box padding">
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
			<button id="recommendPost" class="btn btn-danger" data-postid="${postPojo.id }">岗位推荐</button>
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