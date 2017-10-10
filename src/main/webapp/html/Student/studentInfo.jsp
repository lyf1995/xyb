<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>个人信息</title>
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/studentInfo.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/build.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/datePicker.css">
	<script type="text/javascript" src="../../js/StudentJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/studentInfo.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/jquery.date_input.pack.js"></script> 
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
			<li class="on"><a href="studentInfo.html">个人信息</a></li>
			<li><a href="schoolInfo.html">学籍信息</a></li>
			<li><a href="resumeInfo.html">简历信息</a></li>
		</ul>
	</nav>
	<div id="middle-right">
		<div class="wrap-bread">
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li>个人信息</li>
			</ol>
		</div>
		<form id="per-form" class="form-inline" action="editStudentInfo.html" method="post" autocomplete enctype="multipart/form-data">
			<div class="per-form-div">
				<ul>
					<li class="imgLi">
						<label style="vertical-align: top;">照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：</label>
						<c:choose>  
							<c:when test="${studentInfo.picture==null || studentInfo.picture==''}">
								<img id="show-picture" src="../../images/defalut.png" alt="照片">
							</c:when>  
							<c:otherwise>
								<img id="show-picture" src="${studentInfo.picture }" alt="照片">
							</c:otherwise>  
						</c:choose> 
						<input type="file" id="pictureFile" name="picture">
					</li>
					<li> 
   						<label for="relName">真实姓名：</label>
   						<input id="relName" type="text" name="relName" value="${studentInfo.relName}" placeholder="真实姓名" class="form-control" required>
					</li>
					<li>
						<label>性别：</label>
						<c:if test="${studentInfo.sex=='男'}">
					        <div class="radio radio-danger">
								<input id="male" type="radio" name="sex" value="男" checked>
								<label for="male">男</label>
							</div>
							<div class="radio radio-danger">
								<input id="fmale" type="radio" name="sex" value="女">
								<label for="fmale">女</label>
							</div>
					    </c:if>
				        <c:if test="${studentInfo.sex=='女'}">
				         	<div class="radio radio-danger">
								<input id="male" type="radio" name="sex" value="男">
								<label for="male">男</label>
							</div>
					        <div class="radio radio-danger">
								<input id="fmale" type="radio" name="sex" value="女" checked>
								<label for="fmale">女</label>
							</div>
				         </c:if>
				         <c:if test="${studentInfo.sex=='' || studentInfo.sex==null}">
				         	<div class="radio radio-danger">
								<input id="male" type="radio" name="sex" value="男" checked>
								<label for="male">男</label>
							</div>
					        <div class="radio radio-danger">
								<input id="fmale" type="radio" name="sex" value="女">
								<label for="fmale">女</label>
							</div>
				         </c:if>
					</li>
					<li>
						<div class="wrap-date">
							<label for="birth">出生年月：</label>
							<input id="birth" readonly type="text" name="birth" value="${birth}" placeholder="出生年月" class="form-control date_picker" required>
						</div>	
					</li>
					<li>
						<label for="tel">电话号码：</label>
						<input id="tel" type="text" name="tel" value="${studentInfo.tel}" placeholder="电话号码" class="form-control" required>
					</li>
					<li>
						<label for="email">联系邮箱：</label>
						<input id="email" type="email" name="email" value="${studentInfo.email}" placeholder="联系邮箱" class="form-control" required>
					</li>
					<li>
						<label for="address">现居地址：</label>
						<input id="address" type="text" name="address" value="${studentInfo.address}" placeholder="现居地址" class="form-control" required>
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