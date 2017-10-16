<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>我的校招</title>
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/schoolRecruit.css">
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/jquery.dialogbox.css">
	<script type="text/javascript" src="../../js/SchoolJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/schoolRecruit.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/jquery.dialogBox.js"></script>
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
	    	<a class="a-set out" href="schoolInfo.html">
	    		<img src="../../images/set.PNG" alt="">
	    	 	<span>设置</span>
	    	</a>
	    	<div class="a-wel out-up" href="javascript:;">
	    		<span>您好,${schoolInfo.username }</span>
	    		<img src="../../images/down.png" alt="">
	    		<ul class="clearfix">
	    			<li><a href="schoolInfo.html">个人信息</a></li>
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

<div id="middle" class="middle-1200 clearfix" style="background: white;">
	
	<hr>
	<div class="middle-box-bar clearfix">
		<ul>
			<li class="on">全部</li>
			<li>未结束</li>
			<li>已结束</li>
		</ul>
	</div>
	<a href="addRecruit.html" class="a-danger a-big addPost">+添加校招</a>
	<div class="recruit-show">
		<c:forEach var="recruitPojo" items="${recruitPojos }">
			<div class="recruit-show-box" data-recruitid="${recruitPojo.id }">
				<div class="operation-show clearfix">
					<a href="editRecruit.html?recruitId=${recruitPojo.id }" class="a-danger a-big editRecruit">修&nbsp;&nbsp;&nbsp;改</a>
					<a href="lookApply.html?recruitId=${recruitPojo.id }" class="a-danger a-big lookRecruit">查看申请</a>
					<a href="javascript:;" class="a-danger a-big deleteRecruit">删&nbsp;&nbsp;&nbsp;除</a>
				</div>
				<div class="school-logo">
					<c:choose>  
						<c:when test="${empty recruitPojo.schLogo}">
							<img id="recruit-show-schLogo" src="../../images/defalut.png" alt="学校logo">
						</c:when>  
						<c:otherwise>
							<img id="recruit-show-schLogo" src="${recruitPojo.schLogo }" alt="学校logo">
						</c:otherwise>  
					</c:choose> 
				</div>
				<div class="recruit-show-top">
					<div class="recruit-show-name">${recruitPojo.recruitName }</div>
					<div class="school-name">${recruitPojo.schName }</div>
					<div class="recruit-show-startTime">${recruitPojo.startTimeStr }</div>
						<div class="zhi">
							至
						</div>
						<div class="recruit-show-endTime">${recruitPojo.endTimeStr }</div>
				</div>
				<div class="recruit-show-bottom">
					<div class="recruit-show-address">${recruitPojo.address }</div>
					<div class="recruit-show-time">发布时间：${recruitPojo.releaseTimeStr }</div>
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
<input id="addStatus" type="hidden" value="${addStatus }">
<input id="deleteStatus" type="hidden" value="${deleteStatus }"> 
</body>
<script>
window.onload=function(){
	var addStatus=document.getElementById("addStatus").value;
	if(addStatus=="sucess"){
		alert("添加成功");
	}
	var deleteStatus=document.getElementById("deleteStatus").value;
	if(deleteStatus=="sucess"){
		alert("删除成功");
	}
}
</script>
</html>