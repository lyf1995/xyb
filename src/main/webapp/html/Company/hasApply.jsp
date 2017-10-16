<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>	我的校招</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/hasApply.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jquery.dialogbox.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/hasApply.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.dialogBox.js"></script>
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
	    	<a class="a-set out" href="companyInfo.html">
	    		<img src="../../images/set.PNG" alt="">
	    	 	<span>设置</span>
	    	</a>
	    	<div class="a-wel out-up" href="javascript:;">
	    		<span>您好,${companyInfo.username }</span>
	    		<img src="../../images/down.png" alt="">
	    		<ul class="clearfix">
	    			<li><a href="companyInfo.html">企业信息</a></li>
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
					<li><a href="jobManager.html">岗位管理</a></li>
					<li>校招管理<img src="../../images/down2.png"  alt="">
						<ul id="logo-right-child-ul" class="clearfix">
							<li><a href="companyRecruit.html">校招对接</a></li>
							<li><a href="hasApply.html">我的校招</a></li>
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
				<h4>已申请的校招</h4>
			</div>
			<hr>
			<div class="middle-box-bar clearfix">
				<ul>
					<li class="on">全部</li>
					<li>同意对接</li>
					<li>拒绝对接</li>
					<li>未处理</li>
				</ul>
		</div>
		<div class="recruit-show">
			<c:forEach var="hasRecruit" items="${hasRecruits }">
				<div class="recruit-show-box">
					<div class="recruit-show-top clearfix">
						<div class="sendTime">申请时间：${hasRecruit.sendTimeStr }</div>
						<div class="recruit-show-name">${hasRecruit.recruit.recruitName }</div>
						<div class="school-name">${hasRecruit.recruit.schoolInfo.schName }</div>
						<div class="recruit-show-startTime">${hasRecruit.startTimeStr }</div>
						<div class="zhi">
							至
						</div>
						<div class="recruit-show-endTime">${hasRecruit.endTimeStr }</div>
					</div>
					<div class="recruit-show-bottom clearfix">
						<div class="recruit-status">${hasRecruit.status }</div>
						<div class="recruit-show-address">${hasRecruit.recruit.address }</div>
						<div class="recruit-show-time">发布时间：${hasRecruit.releaseTimeStr }</div>
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