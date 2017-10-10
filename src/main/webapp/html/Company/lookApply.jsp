<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>查看应聘</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/lookApply.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jquery.dialogbox.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/lookApply.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.dialogBox.js"></script>
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
	<div class="middle-box padding">
		<div class="line-90 clearfix">
			<span class="post-name">${post.postName }</span>
			<span class="post-companyName">${post.companyInfo.comName }</span>	
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-salary">${post.postSalary }元/月</span>
			<span class="post-jobExp">工作经验：${post.jobExp }</span>
			<span class="post-nature">工作性质：${post.jobNature }</span>
			<span class="post-eduRequset">最低学历：${post.education }</span>
			
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-majorRequest">专业范围：${post.postMajor }</span>
			<span class="post-number">招聘人数：${post.postNumber }人</span>
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-address">详细地址：${post.companyInfo.comAddress }</span>
		</div>
		<div class="line-90 clearfix margin-top20">
			<span class="post-contact">联系人：${post.companyInfo.comContacts }</span>
			<span class="post-contactEmail">联系邮箱：${post.companyInfo.comEmail }</span>
			<span class="post-postTime">发布时间：${post.postTimeStr }</span>
		</div>
		<div class="line-90 clearfix margin-top60">
			<div class="gwfl">岗位福利</div>
			<div class="gwfl-detail">
				<input id="gwfl" type="hidden" value="${post.gwfl }">
			</div>
		</div>
		<div class="line-90 clearfix margin-top60">
			<div class="gwzz">岗位职责</div>
			<div class="gwzz-detail">
				<input id="gwzz" type="hidden" value="${post.gwzz }">
			</div>
		</div>
		<div class="line-90 clearfix margin-top60">
			<div class="gwyq">岗位要求</div>
			<div class="gwyq-detail">
				<input id="gwyq" type="hidden" value="${post.gwyq }">
			</div>
		</div>
		<div class="line-90 clearfix margin-top60">
			<table class="applyTable">
				<caption>应聘人员：</caption>
				<thead>
					<tr>
						<th>姓名</th>
						<th>性别</th>
						<th>电话</th>
						<th>学校</th>
						<th>专业</th>
						<th>投递时间</th>
						<th>查看简历详情</th>
						<th>状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="hasPost" items="${hasPosts }">
					    <tr>
							<td>${hasPost.studentInfo.relName }</td>
							<td>${hasPost.studentInfo.sex }</td>
							<td>${hasPost.studentInfo.tel }</td>
							<td>${hasPost.studentInfo.stSchoolInfo.school }</td>
							<td>${hasPost.studentInfo.stSchoolInfo.major }</td>
							<td>${hasPost.sendTimeStr }</td>
							<td><a href="lookApplyDetailed.html?studentId=${hasPost.studentInfo.id }&&postId=${post.id}">查看</a></td>
							<td>${hasPost.status }</td>
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