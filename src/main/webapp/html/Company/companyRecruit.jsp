<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>校招对接</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/companyRecruit.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jquery.dialogbox.css">
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/companyRecruit.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.dialogBox.js"></script>
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
		<input type="text" name="searchTest" class="form-control" placeholder="请学校名称">
		<button type="search-btn" class="btn btn-danger">搜&nbsp;&nbsp;&nbsp;索</button>
	</div>
	<div class="recruit-show">
		<c:forEach var="recruitPojo" items="${recruitPojos }">
			<div class="recruit-show-box" data-recruitid="${recruitPojo.id }">
				<div class="operation-show clearfix">
					<a href="javascript:;" class="a-danger a-big applyRecruit">申请校招</a>
					<a href="companyRecruitDetailed.html?recruitId=${recruitPojo.id }" class="a-danger a-big lookRecruitDetailed">查看详情</a>
				</div>
				<div class="recruit-logo">
					<c:choose>  
						<c:when test="${empty recruitPojo.schLogo}">
							<img id="recruit-show-schLogo" src="../../images/defalut.png" alt="学校logo">
						</c:when>  
						<c:otherwise>
							<img id="recruit-show-schLogo" src="${recruitPojo.schLogo }" alt="学校logo">
						</c:otherwise>  
					</c:choose> 
				</div>
				<div class="recruit-show-top clearfix">
					<div class="recruit-show-name">${recruitPojo.recruitName }</div>
					<div class="school-name">${recruitPojo.schName }</div>
					<div class="recruit-show-startTime">${recruitPojo.startTimeStr }</div>
					<div class="zhi">
						至
					</div>
					<div class="recruit-show-endTime">${recruitPojo.endTimeStr }</div>
				</div>
				<div class="recruit-show-bottom clearfix">
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
</body>
</html>