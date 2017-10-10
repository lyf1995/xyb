﻿<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>查看校招详情</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/companyRecruitDetailed.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jquery.dialogbox.css">
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/companyRecruitDetailed.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.dialogBox.js"></script>
	<script src="../../loading/js/loading.js"></script>
</head>
<body>
<!--聊天模态框-->
<div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				浙江互联网科技有限公司
			    <button class="close" data-dismiss="modal"><span style="font-size:40px;">&times;</span></button>
			</div>
			<div class="modal-body clearfix">
				<div class="modal-left">
					他说：你好，这里是浙江互联网科技有限公司。
				</div>
				<div class="modal-right">
					我说：你好，我想问问你们公司招人的具体情况。
				</div>
			</div>
			<div class="modal-footer">
				<textarea class="modalTextarea"></textarea>
				<button class="btn btn-danger">发送</button>
			</div>
		</div>
	</div>
</div>
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
	<div class="middle-box clearfix padding">
	<input id="recruitId" type="hidden" value="${recruit.id }">
		<div class="recruit-div clearfix">
			<div class="line-90 clearfix">
				<span class="recruit-name">${recruit.recruitName }</span>
				<button id="callSchool" class="btn btn-danger" data-toggle="modal" data-target="#myModal">联系学校</button>
			</div>
			<div class="line-90 clearfix marginTop30 paddingLeft20">
				<span class="school-name">学校：${recruit.schoolInfo.schName }</span>
				<span class="startTime">校招时间：${recruit.startTimeStr }</span><span class="zhi">至</span>
				<span class="endTime">${recruit.endTimeStr }</span>
				<button id="applyRecruit" class="btn btn-danger">申请校招</button>
			</div>
			<div class="line-90 clearfix marginTop20 paddingLeft20">
				<span  class="address">详细地址：</span><span class="address">${recruit.address }</span>
				<span  class="time">发布时间：${recruit.releaseTimeStr }</span>
			</div>
			<div class="line-90 clearfix marginTop20 paddingLeft20">
				<span class="recruit-detail">校招详情：</span><br>
				<span class="recruit-detail paddingLeft20">${recruit.recruitDetail }</span>
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