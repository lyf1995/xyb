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
	<link rel="stylesheet" type="text/css" href="../../css/SchoolCss/lookApplyDetailed.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jquery.dialogbox.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<script type="text/javascript" src="../../js/CompanyJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/SchoolJs/lookApplyDetailed.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.dialogBox.js"></script>
	<script src="../../loading/js/loading.js"></script>
</head>
<body>
<!--聊天模态框-->
<input id="userId" type="hidden" value="${user.id }">
<input id="schId" type="hidden" value="${schoolInfo.id }">
<input id="comId" type="hidden" value="${companyInfo.id }">
<div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				${postPojo.comName }
			    <button class="close" data-dismiss="modal"><span style="font-size:40px;">&times;</span></button>
			</div>
			<div class="modal-body clearfix">
				<div class="clearfix">
				</div>
			</div>
			<div class="modal-footer">
				<textarea id="content" class="modalTextarea form-control"></textarea>
				<button id="send" class="btn btn-danger">发送</button>
			</div>
		</div>
	</div>
</div>
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
			<li class="on"><a href="javascript:;">企业信息</a></li>
			<li id="nowRecruitStatus">公司状态：${nowHasRecruit.status }</li>
		</ul>
	</nav>
	<div id="middle-right">
		<div class="status clearfix">
			<button id="agree" class="btn btn-danger" data-companyid="${companyInfo.id }" data-recruitid="${recruitId }">同意对接</button>
			<button id="Inappropriate" class="btn btn-danger" data-companyid="${companyInfo.id }" data-recruitid="${recruitId }">不合适</button>
			<button id="callCompany" class="btn btn-danger" data-toggle="modal" data-target="#myModal">联系公司</button>
			<button id="return" class="btn btn-danger" data-recruitid="${recruitId }">返回</a>
		</div>
		<hr>
		<div id="com-info" class="form-inline" action="" autocomplete>
			<div class="com-info-div clearfix">
				<ul>
					<li> 
   						<label for="comLogo">企业Logo：</label>
   						
					</li>
					<li> 
   						<label for="comName">企业名称：${companyInfo.comName }</label>
					</li>
					<li>
						<label for="comContacts">联系人：${companyInfo.comContacts }</label>
					</li>
					<li>
						<label for="comIndustry">所属行业：${companyInfo.comIndustry }联网</label>
					</li>
					<li>
						<label for="comEmail">联系邮箱：${companyInfo.comEmail }</label>
					</li>
					<li>
						<label for="comAddress">详细地址：${companyInfo.comAddress }</label>
					</li>
					<li>
						<label for="comProfile">公司简介：</label>
						<label>${companyInfo.comProfile }</label>
					</li>
				</ul>
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