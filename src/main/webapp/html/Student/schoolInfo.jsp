<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>学籍信息</title>
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/schoolInfo.css">
	<script type="text/javascript" src="../../js/StudentJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/schoolInfo.js"></script>
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
	<nav id="middle-left">
		<ul>
			<li><a href="studentInfo.html">个人信息</a></li>
			<li class="on"><a href="schoolInfo.html">学籍信息</a></li>
			<li><a href="resumeInfo.html">简历信息</a></li>
		</ul>
	</nav>
	<div id="middle-right">
		<div class="wrap-bread">
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li>学籍信息</li>
			</ol>
		</div>
		<form id="per-form" class="form-inline" action="editSchoolInfo.html" method="post" autocomplete>
			<div class="per-form-div">
				<ul>
					<li> 
   						<label for="school">学&nbsp;校：</label>
   						<input id="school" type="text" name="school" value="${stSchoolInfo.school }" placeholder="学校" class="form-control" required>
					</li>
					<li>
						<label for="depart">院&nbsp;系：</label>
						<input id="depart" type="text" name="depart" value="${stSchoolInfo.depart }" placeholder="院系" class="form-control" required>
					</li>
					<li>
						<label for="major">专&nbsp;业：</label>
						<input id="major" type="text" name="major" value="${stSchoolInfo.major }" placeholder="专业" class="form-control" required>
					</li>
					<li>
						<label for="class">班&nbsp;级：</label>
						<input id="class" type="text" name="classes" value="${stSchoolInfo.classes }" placeholder="班级" class="form-control" required>
					</li>
					<li>
						<label for="no">学&nbsp;号：</label>
						<input id="no" type="text" name="no" value="${stSchoolInfo.no }" placeholder="学号" class="form-control" required>
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
<input type="hidden" id="status" value="${status }">
</body>
<script>
window.onload=function(){
	var status=document.getElementById("status").value;
	if(status=="sucess")
		alert("保存成功");
};
</script>

</html>