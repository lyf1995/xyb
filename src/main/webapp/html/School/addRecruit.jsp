<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>添加校招</title>
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/addRecruit.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/datePicker.css">
	<script type="text/javascript" src="../../js/StudentJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/addRecruit.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/jquery.date_input.pack.js"></script>
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
	<div class="middle-box clearfix padding">
		<form id="post-form" class="form-inline" action="addRecruit.html" autocomplete method="post">
			<div class="post-form-div">
				<ul>
					<li class="clearfix"> 
						<label>校招名称：</label>
						<input id="name" type="text" name="recruitName" placeholder="校招名称" class="form-control">
					</li>
					<li class="clearfix"> 
   						<div class="wrap-date">
							<label>校招时间：</label>
							<input id="startTime" readonly  type="text" name="startTimeStr" placeholder="开始日期" class="form-control date_picker" required>
						</div>
						<div class="wrap-date">
							<label>至：</label>
							<input id="endTime" readonly  type="text" name="endTimeStr" placeholder="结束日期" class="form-control date_picker" required>
						</div>
					</li>
					<li>
						<label>详细地址：</label>
						<input id="address" type="text" name="address" placeholder="详细地址" class="form-control">
					</li>
					<li>
						<label style="vertical-align: top;">校招简介：</label>
						<textarea id="RecruitDetail" type="text" name="recruitDetail" placeholder="校招简介" class="form-control"></textarea>
					</li>
					<button type="submit" class="btn btn-danger">添加</button>
				</ul>
			</div>
		</form>
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