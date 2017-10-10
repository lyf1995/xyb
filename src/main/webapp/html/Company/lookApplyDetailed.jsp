<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>查看简历详情</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/jquery.dialogbox.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/lookApplyDetailed.css">
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/lookApplyDetailed.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/jquery.dialogBox.js"></script>
	<script src="../../loading/js/loading.js"></script>
</head>
<body>
<!--聊天模态框-->
<input id="userId" type="hidden" value="${user.id }">
<input id="stuId" type="hidden" value="${studentInfo.id }">
<input id="comId" type="hidden" value="${companyInfo.id }">
<div class="modal fade" id="myModal" tabindex="-1" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				${studentInfo.relName }
			    <button class="close" data-dismiss="modal"><span style="font-size:40px;">&times;</span></button>
			</div>
			<div class="modal-body clearfix">
				<div class="clearfix">
					<span class="modal-left">你好，我是${studentInfo.relName }</span>
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
	<nav id="middle-left" >
	    <div class="middle-left-top">
	    <div id="nowPostStatus" >
	    	<span >简历状态：${nowHasPost.status }</span>
	    </div>
	    <div class="fujianContainer">
			<c:if test="${!empty studentInfo.fujianName}">
				<span style="display: inline-block;overflow: hidden;">简历附件：</span><a href="downloadFujian.html?filename=${studentInfo.fujianName }" class="aFujian">${studentInfo.fujianName }</a>
			</c:if>
			<c:if test="${empty studentInfo.fujianName}">
				<span style="display: inline-block;overflow: hidden;">简历附件：无</span>
			</c:if>
		</div>
       	<span>简历完善度</span><span class="pro-span"></span>   	
    	<div class="progress" style="width:180px; height:15px;">
			<div class="progress-bar"></div>
		</div>
	    </div>
		<ul>
			<li>
				<span id="jbxx" class="no-create">未创建</span>
				<a href="#jbxxSide">基本信息</a>
			</li>
			<li>
				<span id="grjj" class="no-create">未创建</span>
				<a href="#grjjSide">个人简介</a>
			</li>
			<li>
				<span id="qzyx" class="no-create">未创建</span>
				<a href="#qzyxSide">求职意向</a>
			</li>
			<li>
				<span id="xmjy" class="no-create">未创建</span>
				<a href="#xmjySide">项目经验</a>
			</li>
			<li>
				<span id="xnzw" class="no-create">未创建</span>
				<a href="#xnzwSide">校内职务</a>
			</li>
			<li>
				<span id="yynl" class="no-create">未创建</span>
				<a href="#yynlSide">语言能力</a>
			</li>
		</ul>
	</nav>

	<div id="middle-right">
		<div class="status clearfix">
			<button id="interview" class="btn btn-danger" data-studentid="${studentInfo.id }" data-postid="${postId }">通知面试</button>
			<button id="Inappropriate" class="btn btn-danger" data-studentid="${studentInfo.id }" data-postid="${postId }">不合适</button>
			<button id="callStudent" class="btn btn-danger" data-toggle="modal" data-target="#myModal">联系本人</button>
			<button id="return" class="btn btn-danger" data-postid="${postId }">返回</a>
		</div>
		<!--基本信息-->
		<div id="jbxxSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>基本信息</span>
			</h2>
			<div id="jbxx-show">
				<div class="jbxx-show-box clearfix">
					<div class="imgDiv">
						<c:choose>  
							<c:when test="${empty studentInfo.picture}">
								<img id="show-picture" src="../../images/defalut.png" alt="照片">
							</c:when>  
							<c:otherwise>
								<img id="show-picture" src="${studentInfo.picture }" alt="照片">
							</c:otherwise>  
						</c:choose> 
					</div>
					<div class="line-50">
						<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span>
						<span id="show-name" class="isCreate">${studentInfo.relName}</span>
					</div>
					<div class="line-50">
						<span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
						<span id="show-sex" class="isCreate">${studentInfo.sex}</span>
					</div>
					<div class="line-50">
						<span>出生年月：</span>
						<span id="show-birth" class="isCreate">${birth}</span>
					</div>
					<div class="line-50">
						<span>电话号码：</span>
						<span id="show-tel" class="isCreate">${studentInfo.tel}</span>
					</div>
					<div class="line-50">
						<span>联系邮箱：</span>
						<span id="show-email" class="isCreate">${studentInfo.email}</span>
					</div>
					<div class="line-50">
						<span>现居地址：</span>
						<span id="show-address" class="isCreate">${studentInfo.address}</span>
					</div>
					<div class="line-50">
						<span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</span>
						<span id="show-school" class="isCreate">${studentInfo.stSchoolInfo.school}</span>
					</div>
					<div class="line-50">
						<span>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</span>
						<span id="show-major" class="isCreate">${studentInfo.stSchoolInfo.major}</span>
					</div>
				</div>
			</div>
		</div>


		<!--个人简历-->
		<div id="grjjSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>个人简介</span>
			</h2>
			<div id="grjj-show">
				<div ><span id="show-grjj" class="isCreate">${studentInfo.stGrjj.grjj}</span></div>
			</div>
		</div>


		<!--求职意向-->
		<div id="qzyxSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>求职意向</span>
			</h2>
			<div id="qzyx-show">
				<div class="qzyx-show-box clearfix">
					<div class="line-50">
						<span>求职类型：</span>
						<span id="show-Jobtype" class="isCreate">${studentInfo.stQzyx.type}</span>
					</div>
					<div class="line-50">
						<span>目标地点：</span>
						<span id="show-targetAddress" class="isCreate">${studentInfo.stQzyx.targetAddress}</span>
					</div>
					<div class="line-50">
						<span>期望岗位：</span>
						<span id="show-post" class="isCreate">${studentInfo.stQzyx.post}</span>
					</div>
					<div class="line-50">
						<span>期望薪水：</span>
						<span id="show-salary" class="isCreate">${studentInfo.stQzyx.salary}</span><span>/月</span>
					</div>
				</div>
			</div>
		</div>


		<!--项目经验-->
		<div id="xmjySide">
			<h2><img src="../../images/shuxian.png" alt=""><span>项目经验</span>
			</h2>
			<div id="xmjy-show">
				<div class="xmjy-show-box clearfix">
					<c:forEach var="stXmjy" items="${studentInfo.stXmjy}">
						<div class="xmjy-list clearfix" data-xmjyid="${stXmjy.id}">
							<div class="line-50">
								<span>项目名称：</span><span class="show-itemName isCreate">${stXmjy.itemName}</span>
							</div>
							<div class="line-50">
								<span>项目时间：</span>
								<span class="show-itemTime isCreate">${stXmjy.itemStartYear}-
									<c:if test="${stXmjy.itemStartMonth>=10}">${stXmjy.itemStartMonth}</c:if>
									<c:if test="${stXmjy.itemStartMonth<10}">0${stXmjy.itemStartMonth}</c:if>~${stXmjy.itemEndYear}-
									<c:if test="${stXmjy.itemEndMonth>=10}">${stXmjy.itemEndMonth}</c:if>
									<c:if test="${stXmjy.itemEndMonth<10}">0${stXmjy.itemEndMonth}</c:if>
								</span>
								<span class="inline-xiugai1"> 修改</span>
								<span class="inline-shanchu1"> 删除</span>
							</div>
							<div class="line-50">
								<span>项目职责：</span><span class="show-itemDuty isCreate">${stXmjy.itemDuty}</span>
							</div>
							<div class="line-100">
								<span>项目描述：</span><span class="show-itemDescribe isCreate">${stXmjy.itemDescribe}</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>


		<!--校内职务-->
		<div id="xnzwSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>校内职务</span>
			   
			</h2>
			<div id="xnzw-show">
				<div class="xnzw-show-box clearfix">
					<c:forEach var="stXnzw" items="${studentInfo.stXnzw}">
						<div class="xnzw-list clearfix" data-xnzwid="${stXnzw.id }">
							<div class="line-50">
								<span>职务名称：</span>
								<span class="show-dutyName isCreate">${stXnzw.dutyName }</span>
							</div>
							<div class="line-50">
								<span>任职时间：</span>
								<span class="show-dutyTime isCreate">${stXnzw.dutyStartYear}-
									<c:if test="${stXnzw.dutyStartMonth>=10}">${stXnzw.dutyStartMonth}</c:if>
									<c:if test="${stXnzw.dutyStartMonth<10}">0${stXnzw.dutyStartMonth}</c:if>~${stXnzw.dutyEndYear}-
									<c:if test="${stXnzw.dutyEndMonth>=10}">${stXnzw.dutyEndMonth}</c:if>
									<c:if test="${stXnzw.dutyEndMonth<10}">0${stXnzw.dutyEndMonth}</c:if>
								</span>
								<span class="inline-xiugai2"> 修改</span>
								<span class="inline-shanchu2"> 删除</span>
							</div>
							<div class="line-100">
								<span>职务描述：</span>
								<span class="show-dutyDescribe isCreate">${stXnzw.dutyDescribe}</span>
							</div>
						</div>
                   </c:forEach>
				</div>
			</div>
		</div>



		<!--语言能力-->
		<div id="yynlSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>语言能力</span>
			</h2>
			<div id="yynl-show">
				<div class="yynl-show-box clearfix">
					<c:forEach var="stYynl" items="${studentInfo.stYynl}">
						<div class="yynl-list clearfix" data-yynlid="${stYynl.id }">
							<div class="line-30">
								<span>语言名称：</span>
								<span class="show-lgName isCreate">${stYynl.lgName }</span>
							</div>
							<div class="line-30">
								<span>听说能力：</span>
								<span class="show-lgTS isCreate">${stYynl.lgTS }</span>
							</div>
							<div class="line-30">
								<span>读写能力：</span>
								<span class="show-lgDX isCreate">${stYynl.lgDX }</span>
							</div>
							<div class="line-10">
								<span class="inline-xiugai3">修改</span>
								<span class="inline-shanchu3"> 删除</span>
							</div>
						</div>
					</c:forEach>
				</div>
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

<input id="status" type="hidden" value="${status }">
</body>
<script>

window.onload=function(){
	var status=document.getElementById("status").value;
	if(status=="success"){
		alert("设置成功");
	}
	
}
</script>
</html>