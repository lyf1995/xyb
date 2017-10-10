<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>岗位管理</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jquery.dialogbox.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jobManager.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jobManager.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.dialogBox.js"></script>
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
	<div class="search-box">
		<span>全部</span>
		<ul>
			<li>全部</li>
			<li>实习</li>
			<li>就业</li>
			<li>实习+就业</li>
		</ul>
		<input type="text" name="searchTest" class="form-control" placeholder="请职位名称">
		<button type="search-btn" class="btn btn-danger">搜&nbsp;&nbsp;&nbsp;索</button>
	</div>
	<div class="post-show">
		<div class="middle-box-top">
			<h4>已发布的招聘</h4>
		</div>
		<hr>
		<a href="addPost.html" class="a-danger a-big addPost">+添加招聘岗位</a>
		<c:forEach var="postPojo" items="${postPojos }">
			<div class="post-show-box" data-postId=${postPojo.id }>
				<div class="operation-show clearfix">
					<a href="editPost.html?postId=${postPojo.id }" class="a-danger a-big editPost">修&nbsp;&nbsp;&nbsp;改</a>
					<a href="lookApply.html?postId=${postPojo.id }" class="a-danger a-big lookPost">查看应聘</a>
					<a href="javascript:;" class="a-danger a-big deletePost">删&nbsp;&nbsp;&nbsp;除</a>
				</div>
				<div class="company-logo">
					<c:choose>  
						<c:when test="${empty postPojo.comLogo}">
							<img id="post-show-comLogo" src="../../images/defalut.png" alt="企业logo">
						</c:when>  
						<c:otherwise>
							<img id="post-show-comLogo" src="${postPojo.comLogo }" alt="企业logo">
						</c:otherwise>  
					</c:choose> 
				</div>
				<div class="post-show-top">
					<div class="post-show-name">${postPojo.postName }</div>
					<div class="post-show-salary">${postPojo.postSalary }/月</div>
					<div class="post-show-jobExp">工作经验：${postPojo.jobExp }</div>
					<div class="post-show-nature">工作性质：${postPojo.jobNature }</div>
				</div>
				<div class="post-show-bottom">
					<div class="post-show-company">${postPojo.comName }</div>
					<div class="post-show-address">${postPojo.comAddress }</div>
					<div class="post-show-time">发布时间：${postPojo.postTimeStr }</div>
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