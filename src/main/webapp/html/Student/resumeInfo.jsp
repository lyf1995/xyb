<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>简历信息</title>
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/bootstrap.min.css">
	<link rel="stylesheet" href="../../loading/css/animate.css">
	<link rel="stylesheet" href="../../loading/css/global.css">
	<link rel="stylesheet" href="../../loading/css/loading.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/resumeInfo.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/build.css">
	<link rel="stylesheet" type="text/css" href="../../css/StudentCss/datePicker.css">
	
	<script type="text/javascript" src="../../js/StudentJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/resumeInfo.js"></script>
	<script type="text/javascript" src="../../js/StudentJs/jquery.date_input.pack.js"></script> 
	<script type="text/javascript" src="../../js/StudentJs/jquery.date_input.pack.js"></script> 
	<script src="../../loading/js/loading.js"></script>
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
	<nav id="middle-left" >
		<div class="fujianDiv">
			上传简历附件
		</div>
		<div class="fujianContainer">
			<c:if test="${!empty studentInfo.fujianName}">
				<a href="javascript:;" class="aFujian">${studentInfo.fujianName }</a>
				<a href="javascript:;" class="deleteFujian" style="position:absolute;right:10px;">删除</a>
			</c:if>
		</div>
		<input type="file" id="fujianFile" name="fujian">
	    <div class="middle-left-top">
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
		<div class="wrap-bread">
			<ol class="breadcrumb">
				<li><a href="#">首页</a></li>
				<li>简历信息</li>
			</ol>
		</div>


		<!--基本信息-->
		<div id="jbxxSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>基本信息</span>
			    <span id="jbxx-xiugai" class="edit" >修改</span>
			</h2>
			<div id="jbxx-show">
				<div class="jbxx-show-box clearfix">
					<div class="imgDiv">
						<c:choose>  
							<c:when test="${studentInfo.picture==null || studentInfo.picture==''}">
								<img id="show-picture" src="../../images/defalut.png" alt="照片">
							</c:when>  
							<c:otherwise>
								<img id="show-picture" src="${studentInfo.picture }" alt="照片">
							</c:otherwise>  
						</c:choose> 
					</div>
					<div class="line-40">
						<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span>
						<span id="show-name" class="isCreate">${studentInfo.relName}</span>
					</div>
					<div class="line-40">
						<span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
						<span id="show-sex" class="isCreate">${studentInfo.sex}</span>
					</div>
					<div class="line-40">
						<span>出生年月：</span>
						<span id="show-birth" class="isCreate">${birth}</span>
					</div>
					<div class="line-40">
						<span>电话号码：</span>
						<span id="show-tel" class="isCreate">${studentInfo.tel}</span>
					</div>
					<div class="line-40">
						<span>联系邮箱：</span>
						<span id="show-email" class="isCreate">${studentInfo.email}</span>
					</div>
					<div class="line-40">
						<span>现居地址：</span>
						<span id="show-address" class="isCreate">${studentInfo.address}</span>
					</div>
					<div class="line-40">
						<span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</span>
						<span id="show-school" class="isCreate">${stSchoolInfo.school}</span>
					</div>
					<div class="line-40">
						<span>专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</span>
						<span id="show-major" class="isCreate">${stSchoolInfo.major}</span>
					</div>
				</div>
			</div>
			<div id="jbxx-edit">
				<div class="jbxx-edit-box clearfix">
					<form name="jbxxForm" id="jbxxForm">
						<div class="imgDiv">
							<c:choose>  
								<c:when test="${studentInfo.picture==null || studentInfo.picture==''}">
									<img id="edit-picture" src="../../images/defalut.png" alt="照片">
								</c:when>  
								<c:otherwise>
									<img id="edit-picture" src="${studentInfo.picture }" alt="照片">
								</c:otherwise>  
							</c:choose> 
							<input type="file" id="pictureFile" name="picture">
						</div>
						<div class="line-50">
							<span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</span>
							<input id="edit-name" type="text" name="name" placeholder="姓名" class="form-control input-width" required>
						</div>
						<div class="line-50">
							<span>出生年月：</span>
							<input id="edit-birth" type="text" name="birth" placeholder="出生年月" class="form-control date_picker input-width" required>
						</div>
						<div class="line-50">
							<span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
							<div class="radio radio-danger">
								<input id="edit-male" type="radio" name="sex" value="男">
								<label for="edit-male">男</label>
							</div>
							<div class="radio radio-danger">
								<input id="edit-fmale" type="radio" name="sex" value="女">
								<label for="edit-fmale">女</label>
							</div>
						</div>
						<div class="line-50">
							<span for="edit-tel">电话号码：</span>
							<input id="edit-tel" type="text" name="tel" placeholder="电话号码" class="form-control input-width" required>
						</div>
						<div class="line-50">
							<span for="edit-email">联系邮箱：</span>
							<input id="edit-email" type="text" name="email" placeholder="联系邮箱" class="form-control input-width" required>
						</div>
						<div class="line-50">
							<span for="edit-address">现居地址：</span>
							<input id="edit-address" type="text" name="address" placeholder="现居地址" class="form-control input-width" required>
						</div>
						<div class="line-50">
							<span for="edit-school">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</span>
							<input id="edit-school" type="text" name="school" placeholder="学校" class="form-control input-width" required>
						</div>
						<div class="line-50">
							<span for="edit-major">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</span>
							<input id="edit-major" type="text" name="major" placeholder="专业" class="form-control input-width" required>
						</div>
						<div class="jbxx-edit-btn">
							<button id="jbxx-edit-btn-cancel" type="button" class="btn btn-default">取消</button>
							<button id="jbxx-edit-btn-baocun" type="button" class="btn btn-danger">保存</button>
						</div>
					</form>
					
				</div>
			</div>
		</div>


		<!--个人简历-->
		<div id="grjjSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>个人简介</span>
			    <span id="grjj-xiugai" class="edit" >修改</span>
			</h2>
			<div id="grjj-show">
				<div ><span id="show-grjj" class="isCreate">${stGrjj.grjj}</span></div>
			</div>
			<div id="grjj-edit" class="clearfix">
				<textarea id="edit-grjj" name="edit-grjj" class="form-control"></textarea>
				<div class="grjj-edit-btn">
					<button id="grjj-edit-btn-cancel" type="button" class="btn btn-default">取消</button>
					<button id="grjj-edit-btn-baocun" type="button" class="btn btn-danger">保存</button>
				</div>
			</div>
		</div>


		<!--求职意向-->
		<div id="qzyxSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>求职意向</span>
			    <span id="qzyx-xiugai" class="edit" >修改</span>
			</h2>
			<div id="qzyx-show">
				<div class="qzyx-show-box clearfix">
					<div class="line-50">
						<span>求职类型：</span>
						<span id="show-Jobtype" class="isCreate">${stQzyx.type}</span>
					</div>
					<div class="line-50">
						<span>目标地点：</span>
						<span id="show-targetAddress" class="isCreate">${stQzyx.targetAddress}</span>
					</div>
					<div class="line-50">
						<span>期望岗位：</span>
						<span id="show-post" class="isCreate">${stQzyx.post}</span>
					</div>
					<div class="line-50">
						<span>期望薪水：</span>
						<span id="show-salary" class="isCreate">${stQzyx.salary}</span><span>/月</span>
					</div>
				</div>
			</div>
			<!--修改-->
			<div id="qzyx-edit">
				<div class="qzyx-edit-box clearfix">
					<div>
						<span>求职类型：</span>
						<div class="radio radio-danger">
							<input id="edit-shixi" type="radio" name="jobType" value="shixi">
							<label for="edit-shixi">实习</label>
						</div>
						<div class="radio radio-danger">
							<input id="edit-jiuye" type="radio" name="jobType" value="jiuye">
							<label for="edit-jiuye">就业</label>
						</div>
						<div class="radio radio-danger">
							<input id="edit-shixijiuye" type="radio" name="jobType" value="shixijiuye" checked>
							<label for="edit-shixijiuye">实习+就业</label>
						</div>
					</div>
					<div class="line-50">
						<span for="edit-targetAddress">目标地点：</span>
						<input id="edit-targetAddress" type="text" name="targetAddress" placeholder="目标地点" class="form-control input-width" required>
					</div>
					<div class="line-50">
						<span for="edit-post">期望岗位：</span>
						<input id="edit-post" type="text" name="post" placeholder="期望岗位" class="form-control input-width" required>
					</div>
					<div class="line-50">
						<span for="edit-salary">期望薪水：</span>
						<input id="edit-salary" type="text" name="salary" placeholder="期望薪水" class="form-control input-width" style="width:40%;" required onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">/月
					</div>
					<div class="qzyx-edit-btn">
						<button id="qzyx-edit-btn-cancel" type="button" class="btn btn-default">取消</button>
						<button id="qzyx-edit-btn-baocun" type="button" class="btn btn-danger">保存</button>
					</div>
				</div>

		</div>


		<!--项目经验-->
		<div id="xmjySide">
			<h2><img src="../../images/shuxian.png" alt=""><span>项目经验</span>
			    <span id="xmjy-tianjia" class="edit" >添加</span>
			</h2>
			<div id="xmjy-show">
				<div class="xmjy-show-box clearfix">
					<c:forEach var="stXmjy" items="${stXmjys}">
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
			<!--修改-->
			<div id="xmjy-edit">
				<div class="xmjy-edit-box clearfix">
				<input type="hidden" name="" data-xmjyid="">
					<div class="line-100">
						<span>项目时间:</span>
						<select id="edit-itemStartYear" style="width:10%;">
							<option value="2017">2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="edit-itemStartMonth" style="width:10%;">
							<option value="01">1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="10">10月</option>
						</select>
						至
						<select id="edit-itemEndYear" style="width:10%;">
							<option value="2017">2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="edit-itemEndMonth" style="width:10%;">
							<option value="01">1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="10">10月</option>
						</select>
					</div>
					<div class="line-100" >
						<span for="edit-itemName">项目名称：</span>
						<input id="edit-itemName" type="text" name="itemName" placeholder="项目名称" class="form-control" style="display: inline-block;width:30%;" required>
					</div>
					<div class="line-100">
						<span for="edit-itemDuty">项目职责：</span>
						<input id="edit-itemDuty" type="text" name="itemDuty" placeholder="项目职责" class="form-control" style="display: inline-block;width:40%;" required>
					</div>
					<div class="line-100 clearfix">
						<span for="edit-itemDescribe" style="float:left;">项目描述：</span>
						<textarea id="edit-itemDescribe" class="form-control" rows="5" cols="90" style="float:left;width:85%"></textarea>
					</div>
					<div class="xmjy-edit-btn">
						<button id="xmjy-edit-btn-cancel" type="button" class="btn btn-default">取消</button>
						<button id="xmjy-edit-btn-baocun" type="button" class="btn btn-danger">保存</button>
					</div>
				</div>
			</div>

			<!--添加-->
			<div id="xmjy-add">
				<div class="xmjy-add-box clearfix">
					<div class="line-100">
						<span>项目时间:</span>
						<select id="add-itemStartYear" style="width:10%;">
							<option value="2017" selected>2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="add-itemStartMonth" style="width:10%;">
							<option value="01" selected>1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="10">10月</option>
						</select>
						至
						<select id="add-itemEndYear" style="width:10%;">
							<option value="2017" selected>2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="add-itemEndMonth" style="width:10%;">
							<option value="01" selected>1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="10">10月</option>
						</select>
					</div>
					<div class="line-100" >
						<span for="add-itemName">项目名称：</span>
						<input id="add-itemName" type="text" name="itemName" placeholder="项目名称" class="form-control" style="display: inline-block;width:30%;" required>
					</div>
					<div class="line-100">
						<span for="add-itemDuty">项目职责：</span>
						<input id="add-itemDuty" type="text" name="itemDuty" placeholder="项目职责" class="form-control" style="display: inline-block;width:40%;" required>
					</div>
					<div class="line-100 clearfix">
						<span for="add-itemDescribe" style="float:left;">项目描述：</span>
						<textarea id="add-itemDescribe" class="form-control" rows="5" cols="90" style="float:left;width:85%"></textarea>
					</div>
					<div class="xmjy-add-btn">
						<button id="xmjy-add-btn-cancel" type="button" class="btn btn-default">取消</button>
						<button id="xmjy-add-btn-tianjia" type="button" class="btn btn-danger">添加</button>
					</div>
				</div>
			</div>
		</div>


		<!--校内职务-->
		<div id="xnzwSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>校内职务</span>
			    <span id="xnzw-tianjia" class="edit" >添加</span>
			</h2>
			<div id="xnzw-show">
				<div class="xnzw-show-box clearfix">
					<c:forEach var="stXnzw" items="${stXnzws}">
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
			<!--修改-->
			<div id="xnzw-edit">
				<div class="xnzw-edit-box clearfix">
					<input type="hidden" name="" data-xnzwid="">
					<div class="line-100">
						<span>任职时间:</span>
						<select id="edit-dutyStartYear" style="width:10%;">
							<option value="2017">2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="edit-dutyStartMonth" style="width:10%;">
							<option value="01">1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="04">4月</option>
						</select>
						至
						<select id="edit-dutyEndYear" style="width:10%;">
							<option value="2017">2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="edit-dutyEndMonth" style="width:10%;">
							<option value="01">1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="04">4月</option>
						</select>
					</div>
					<div class="line-100">
						<span for="edit-dutyName">职务名称：</span>
						<input id="edit-dutyName" type="text" name="dutyName" placeholder="职务名称" class="form-control" style="display: inline-block;width:30%;" required>
					</div>
					<div class="line-100 clearfix">
						<span for="edit-dutyDescribe" style="float:left;">职务描述：</span>
						<textarea id="edit-dutyDescribe" class="form-control" rows="5" cols="90" style="float:left;width:85%"></textarea>
					</div>
					<div class="xnzw-edit-btn">
						<button id="xnzw-edit-btn-cancel" type="button" class="btn btn-default">取消</button>
						<button id="xnzw-edit-btn-baocun" type="button" class="btn btn-danger">保存</button>
					</div>
				</div>
			</div>
			<!--添加-->
			<div id="xnzw-add">
				<div class="xnzw-add-box clearfix">
					<div class="line-100">
						<span>任职时间:</span>
						<select id="add-dutyStartYear" style="width:10%;">
							<option value="2017">2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="add-dutyStartMonth" style="width:10%;">
							<option value="01">1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="04">4月</option>
						</select>
						至
						<select id="add-dutyEndYear" style="width:10%;">
							<option value="2017">2017年</option>
  							<option value="2016">2016年</option>
  							<option value="2015">2015年</option>
  							<option value="2014">2014年</option>
						</select>
						<select id="add-dutyEndMonth" style="width:10%;">
							<option value="01">1月</option>
  							<option value="02">2月</option>
  							<option value="03">3月</option>
  							<option value="04">4月</option>
						</select>
					</div>
					<div class="line-100">
						<span for="add-dutyName">职务名称：</span>
						<input id="add-dutyName" type="text" name="dutyName" placeholder="职务名称" class="form-control" style="display: inline-block;width:30%;" required>
					</div>
					<div class="line-100 clearfix">
						<span for="add-dutyDescribe" style="float:left;">职务描述：</span>
						<textarea id="add-dutyDescribe" class="form-control" rows="5" cols="90" style="float:left;width:85%;"></textarea>
					</div>
					<div class="xnzw-add-btn">
						<button id="xnzw-add-btn-cancel" type="button" class="btn btn-default">取消</button>
						<button id="xnzw-add-btn-tianjia" type="button" class="btn btn-danger">添加</button>
					</div>
				</div>
			</div>
		</div>



		<!--语言能力-->
		<div id="yynlSide">
			<h2><img src="../../images/shuxian.png" alt=""><span>语言能力</span>
			    <span id="yynl-tianjia" class="edit" >添加</span>
			</h2>
			<div id="yynl-show">
				<div class="yynl-show-box clearfix">
					<c:forEach var="stYynl" items="${stYynls}">
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
			<!--修改-->
			<div id="yynl-edit">
				<div class="yynl-edit-box clearfix">
					<input type="hidden" name="" data-yynlid="">
					<div class="line-100" style="text-align:center;">
						<span>语言名称：</span>
						<select id="edit-lgName" style="width:20%;">
							<option value="中文">中文</option>
  							<option value="英语">英语</option>
  							<option value="日语">日语</option>
  							<option value="韩语">韩语</option>
						</select>
					</div>
					<div class="line-100" style="text-align:center;">
						<span>听说能力：</span>
						<select id="edit-lgTS" style="width:20%;">
							<option value="一般">一般</option>
  							<option value="良好">良好</option>
  							<option value="精通">精通</option>
  							<option value="熟练">熟练</option>
						</select>
					</div>
					<div class="line-100" style="text-align:center;">
						<span>读写能力：</span>
						<select id="edit-lgDX" style="width:20%;">
							<option value="一般">一般</option>
  							<option value="良好">良好</option>
  							<option value="精通">精通</option>
  							<option value="熟练">熟练</option>
						</select>
					</div>
					<div class="yynl-edit-btn">
						<button id="yynl-edit-btn-cancel" type="button" class="btn btn-default">取消</button>
						<button id="yynl-edit-btn-baocun" type="button" class="btn btn-danger">保存</button>
					</div>
				</div>
			</div>
			<!--添加-->
			<div id="yynl-add">
				<div class="yynl-add-box clearfix">
					<div class="line-100" style="text-align:center;">
						<span>语言名称：</span>
						<select id="add-lgName" style="width:20%;">
							<option value="中文">中文</option>
  							<option value="英语">英语</option>
  							<option value="日语">日语</option>
  							<option value="韩语">韩语</option>
						</select>
					</div>
					<div class="line-100" style="text-align:center;">
						<span>听说能力：</span>
						<select id="add-lgTS" style="width:20%;">
							<option value="一般">一般</option>
  							<option value="良好">良好</option>
  							<option value="精通">精通</option>
  							<option value="熟练">熟练</option>
						</select>
					</div>
					<div class="line-100" style="text-align:center;">
						<span>读写能力：</span>
						<select id="add-lgDX" style="width:20%;">
							<option value="一般">一般</option>
  							<option value="良好">良好</option>
  							<option value="精通">精通</option>
  							<option value="熟练">熟练</option>
						</select>
					</div>
					<div class="yynl-add-btn">
						<button id="yynl-add-btn-cancel" type="button" class="btn btn-default">取消</button>
						<button id="yynl-add-btn-tianjia" type="button" class="btn btn-danger">添加</button>
					</div>
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
</body>
</html>