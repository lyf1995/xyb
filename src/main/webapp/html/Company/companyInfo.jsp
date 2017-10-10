<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>企业信息</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/companyInfo.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/build.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/datePicker.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/companyInfo.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.date_input.pack.js"></script> 
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
	<nav id="middle-left">
		<ul>
			<li class="on"><a href="companyInfo.html">企业信息</a></li>
		</ul>
	</nav>
	<div id="middle-right">
		<div class="wrap-bread">
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li>企业信息</li>
			</ol>
		</div>
		<form id="com-form" class="form-inline" action="editCompanyInfo.html" method="post" autocomplete enctype="multipart/form-data">
			<div class="com-form-div clearfix">
				<ul>
					 <li class="imgLi"> 
						<label style="vertical-align: top;">企业Logo：</label>
						<c:choose>  
							<c:when test="${companyInfo.comLogo==null || companyInfo.comLogo==''}">
								<img id="show-picture" src="../../images/defalut.png" alt="企业logo">
							</c:when>  
							<c:otherwise>
								<img id="show-picture" src="${companyInfo.comLogo }" alt="企业logo">
							</c:otherwise>  
						</c:choose> 
						<input type="file" id="pictureFile" name="comLogo">
					</li> 
					<li> 
   						<label for="comName">企业名称：</label>
   						<input id="comName" type="text" name="comName" value="${companyInfo.comName}" placeholder="企业名称" class="form-control" required>
					</li>
					<li>
						<label for="comContacts">联系人：</label>
   						<input id="comContacts" type="text" name="comContacts" value="${companyInfo.comContacts}" placeholder="联系人" class="form-control" required>
   						<c:if test="${companyInfo.contactsSex=='男'}">
	   						<div class="radio radio-danger">
								<input id="male" type="radio" name="contactsSex" value="男" checked>
								<label for="male">男士</label>
							</div>
							<div class="radio radio-danger">
								<input id="fmale" type="radio" name="contactsSex" value="女">
								<label for="fmale">女士</label>
							</div>
						</c:if>
						<c:if test="${companyInfo.contactsSex=='女' }">
							<div class="radio radio-danger">
								<input id="male" type="radio" name="contactsSex" value="男">
								<label for="male">男士</label>
							</div>
							<div class="radio radio-danger">
								<input id="fmale" type="radio" name="contactsSex" value="女" checked>
								<label for="fmale">女士</label>
							</div>
						</c:if>
						<c:if test="${companyInfo.contactsSex=='' }">
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
						<label for="comIndustry">所属行业：</label>
						<input id="comIndustry" type="text" name="comIndustry" value="${companyInfo.comIndustry }" placeholder="所属行业" class="form-control" required>
					</li>
					<li>
						<label for="comEmail">联系邮箱：</label>
						<input id="comEmail" type="email" name="comEmail" value="${companyInfo.comEmail }" placeholder="联系邮箱" class="form-control" required>
					</li>
					<li>
						<label for="comAddress">详细地址：</label>
						<input id="comAddress" type="text" name="comAddress" value="${companyInfo.comAddress }" placeholder="详细地址" class="form-control" required>
					</li>
					<li>
						<label for="comProfile" style="vertical-align: top">公司简介：</label>
						<textarea id="comProfile" name="comProfile" class="form-control" rows="4" cols="80"">${companyInfo.comProfile }</textarea>
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