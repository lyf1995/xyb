<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>查看申请</title>
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/lookApply.css">
	<script type="text/javascript" src="../../js/StudentJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/lookApply.js"></script>
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
					<!-- <li><a href="Internship.html">实习计划</a></li> -->
					<li><a href="searchPost.html">查看岗位</a></li>
					<li><a href="schoolRecruit.html">我的校招</a></li>
				</ul>
			</div>
		</div>
	</div>
</header>


<div id="middle" class="middle-1200 clearfix">
	<div class="middle-box clearfix padding">
		<div class="recruit-div clearfix">
			<div class="line-90 clearfix">
				<span class="recruit-name">${recruitPojo.recruitName }</span>
			</div>
			<div class="line-90 clearfix marginTop30 paddingLeft20">
				<span class="school-name">学校：${recruitPojo.schName }</span>
				<span class="startTime">校招时间：${recruitPojo.startTimeStr }</span><span class="zhi">至</span>
				<span class="endTime">${recruitPojo.endTimeStr }</span>
			</div>
			<div class="line-90 clearfix marginTop20 paddingLeft20">
				<span class="address">详细地址：</span><span class="address">${recruitPojo.address }</span>
				<span class="time">发布时间：${recruitPojo.releaseTimeStr }</span>
			</div>
			<div class="line-90 clearfix marginTop20 paddingLeft20">
				<span class="recruit-detail">校招详情：</span><br>
				<span class="recruit-detail paddingLeft20">${recruitPojo.recruitDetail }</span>
			</div>
		</div>
		<div class="line-90 clearfix margin-top60">
		    <table class="applyTable">
				<caption>应招公司：</caption>
				<thead>
					<tr>
						<th>公司名称</th>
						<th>所属行业</th>
						<th>联系人</th>
						<th>联系电话</th>
						<th>申请时间</th>
						<th>查看公司详情</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hasRecruit" items="${hasRecruits }">
						<tr>
							<td>${hasRecruit.companyInfo.comName }</td>
							<td>${hasRecruit.companyInfo.comIndustry }</td>
							<td>${hasRecruit.companyInfo.comContacts }</td>
							<td>${hasRecruit.companyInfo.comEmail }</td>
							<td>${hasRecruit.sendTimeStr }</td>
							<td><a href="lookApplyDetailed.html?companyInfoId=${hasRecruit.companyInfo.id}&&recruitId=${recruitPojo.id}">查看</a></td>
							<td>${hasRecruit.status }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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