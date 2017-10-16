﻿<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>学校信息</title>
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/schoolInfo.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/build.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/datePicker.css">
	<script type="text/javascript" src="../../js/SchoolJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/schoolInfo.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/jquery.date_input.pack.js"></script> 
</head>
<body>
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
	<nav id="middle-left">
		<ul>
			<li class="on"><a href="schoolInfo.html">学校信息</a></li>
		</ul>
	</nav>
	<div id="middle-right">
		<div class="wrap-bread">
			<ol class="breadcrumb">
				<li><a href="schoolInfo.html">首页</a></li>
				<li>学校信息</li>
			</ol>
		</div>
		<form id="sch-form" class="form-inline" action="editSchoolInfo.html" method="post" autocomplete enctype="multipart/form-data">
			<div class="sch-form-div clearfix">
				<ul>
					<li class="imgLi"> 
   						<label style="vertical-align: top;">学校Logo：</label>
						<c:choose>  
							<c:when test="${schoolInfo.schLogo==null || schoolInfo.schLogo==''}">
								<img id="show-picture" src="../../images/defalut.png" alt="学校logo">
							</c:when>  
							<c:otherwise>
								<img id="show-picture" src="${schoolInfo.schLogo }" alt="学校logo">
							</c:otherwise>  
						</c:choose> 
						<input type="file" id="pictureFile" name="schLogo">
					</li>
					<li> 
   						<label for="schName">学校名称：</label>
   						<input id="schName" type="text" name="schName" value="${schoolInfo.schName }" placeholder="学校名称" class="form-control" required>
					</li>
					<li>
						<label for="schContacts">联系人：</label>
   						<input id="schContacts" type="text" name="schContacts" value="${schoolInfo.schContacts }" placeholder="联系人" class="form-control" required>
   						<c:if test="${schoolInfo.contactsSex=='男' }">
	   						<div class="radio radio-danger">
								<input id="male" type="radio" name="contactsSex" value="男" checked>
								<label for="male">男士</label>
							</div>
							<div class="radio radio-danger">
								<input id="fmale" type="radio" name="contactsSex" value="女">
								<label for="fmale">女士</label>
							</div>
						</c:if>
						<c:if test="${schoolInfo.contactsSex=='女' }">
	   						<div class="radio radio-danger">
								<input id="male" type="radio" name="contactsSex" value="男">
								<label for="male">男士</label>
							</div>
							<div class="radio radio-danger">
								<input id="fmale" type="radio" name="contactsSex" value="女" checked>
								<label for="fmale">女士</label>
							</div>
						</c:if>
						<c:if test="${schoolInfo.contactsSex=='' ||schoolInfo.contactsSex==null }">
	   						<div class="radio radio-danger">
								<input id="male" type="radio" name="contactsSex" value="男" checked>
								<label for="male">男士</label>
							</div>
							<div class="radio radio-danger">
								<input id="fmale" type="radio" name="contactsSex" value="女">
								<label for="fmale">女士</label>
							</div>
						</c:if>
					</li>
					<li>
						<label for="schEmail">联系邮箱：</label>
						<input id="schEmail" type="email" name="schEmail" value="${schoolInfo.schEmail }" placeholder="联系邮箱" class="form-control" required>
					</li>
					<li>
						<label for="schAddress">详细地址：</label>
						<input id="schAddress" type="text" name="schAddress" value="${schoolInfo.schAddress }" placeholder="详细地址" class="form-control" required>
					</li>
					<li>
						<label for="schProfile" style="vertical-align: top">学校简介：</label>
						<textarea id="schProfile" name="schProfile" placeholder="学校简介" class="form-control" rows="4" cols="80"">${schoolInfo.schProfile }</textarea>
					</li>
				</ul>
				<button type="submit" class="btn btn-danger">保存</button>
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
<input id="status" type="hidden" value="${status }" 
</body>
<script>
window.onload=function(){
	var status=document.getElementById("status").value;
	if(status=='success'){
		alert('修改成功');
	}
}
</script>
</html>