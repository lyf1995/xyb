<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>修改岗位</title>
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/editPost.css">
	<link rel="stylesheet" type="text/css" href="../../css/CompanyCss/build.css">
	<script type="text/javascript" src="../../js/CompanyJs/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="../../js/CompanyJs/editPost.js"></script>
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
	<div class="middle-box clearfix padding">
		<form id="post-form" class="form-inline" action="editPost.html?postId=${post.id }" autocomplete method="post">
			<div class="post-form-div">
				<ul>
					<li> 
   						<label for="postName">岗位名称：</label>
   						<input id="postName" type="text" name="postName" value="${post.postName }" placeholder="岗位名称" class="form-control">
					</li>
					<li>
						<label>工作性质：</label>
						<c:if test="${post.jobNature=='实习+就业'}">
							<div class="radio radio-danger">
								<input id="shixijiuye" type="radio" name="jobNature" value="实习+就业" checked>
								<label for="shixijiuye">实习+就业</label>
							</div>
							<div class="radio radio-danger">
								<input id="shixi" type="radio" name="jobNature" value="实习">
								<label for="shixi">实习</label>
							</div>
							<div class="radio radio-danger">
								<input id="jiuye" type="radio" name="jobNature" value="就业">
								<label for="jiuye">就业</label>
							</div>
						</c:if>
						<c:if test="${post.jobNature=='实习'}">
							<div class="radio radio-danger">
								<input id="shixijiuye" type="radio" name="jobNature" value="实习+就业" >
								<label for="shixijiuye">实习+就业</label>
							</div>
							<div class="radio radio-danger">
								<input id="shixi" type="radio" name="jobNature" value="实习" checked>
								<label for="shixi">实习</label>
							</div>
							<div class="radio radio-danger">
								<input id="jiuye" type="radio" name="jobNature" value="就业">
								<label for="jiuye">就业</label>
							</div>
						</c:if>
						<c:if test="${post.jobNature=='就业'}">
							<div class="radio radio-danger">
								<input id="shixijiuye" type="radio" name="jobNature" value="实习+就业">
								<label for="shixijiuye">实习+就业</label>
							</div>
							<div class="radio radio-danger">
								<input id="shixi" type="radio" name="jobNature" value="实习">
								<label for="shixi">实习</label>
							</div>
							<div class="radio radio-danger">
								<input id="jiuye" type="radio" name="jobNature" value="就业" checked>
								<label for="jiuye">就业</label>
							</div>
						</c:if>
					</li>
					<li>
						<label for="postSalary">薪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;水：</label>
   						<input id="postSalary" type="text" name="postSalary" value="${post.postSalary }" placeholder="薪水" class="form-control">&nbsp;&nbsp;元/月
					</li>
					<li>
						<label>工作经验：</label>
						<c:if test="${post.jobExp=='不限' }">
							<select name="jobExp" style="width:180px;height:30px;">
								<option value="不限" selected>不限</option>
								<option value="一年以上">一年以上</option>
								<option value="两年以上">两年以上</option>
								<option value="五年以上">五年以上</option>
								<option value="其它">其它</option>
							</select>
						</c:if>
						<c:if test="${post.jobExp=='一年以上' }">
							<select name="jobExp" style="width:180px;height:30px;">
								<option value="不限">不限</option>
								<option value="一年以上" selected>一年以上</option>
								<option value="两年以上">两年以上</option>
								<option value="五年以上">五年以上</option>
								<option value="其它">其它</option>
							</select>
						</c:if>
						<c:if test="${post.jobExp=='两年以上' }">
							<select name="jobExp" style="width:180px;height:30px;">
								<option value="不限">不限</option>
								<option value="一年以上">一年以上</option>
								<option value="两年以上" selected>两年以上</option>
								<option value="五年以上">五年以上</option>
								<option value="其它">其它</option>
							</select>
						</c:if>
						<c:if test="${post.jobExp=='五年以上' }">
							<select name="jobExp" style="width:180px;height:30px;">
								<option value="不限">不限</option>
								<option value="一年以上">一年以上</option>
								<option value="两年以上">两年以上</option>
								<option value="五年以上" selected>五年以上</option>
								<option value="其它">其它</option>
							</select>
						</c:if>
						<c:if test="${post.jobExp=='其它' }">
							<select name="jobExp" style="width:180px;height:30px;">
								<option value="不限">不限</option>
								<option value="一年以上">一年以上</option>
								<option value="两年以上">两年以上</option>
								<option value="五年以上">五年以上</option>
								<option value="其它" selected>其它</option>
							</select>
						</c:if>
					</li>
					<li>
						<label for="postNumber">招聘人数：</label>
						<input id="postNumber" type="text" name="postNumber" value="${post.postNumber }" placeholder="招聘人数" class="form-control">&nbsp;&nbsp;人
					</li>	
					<li>
						<label>最低学历：</label>
						<c:if test="${post.education=='无' }">
							<div class="radio radio-danger">
								<input id="none" type="radio" name="education" value="无" checked>
								<label for="none">无</label>
							</div>
							<div class="radio radio-danger">
								<input id="dazhuan" type="radio" name="education" value="大专">
								<label for="dazhuan">大专</label>
							</div>
							<div class="radio radio-danger">
								<input id="benke" type="radio" name="education" value="本科">
								<label for="benke">本科</label>
							</div>
							<div class="radio radio-danger">
								<input id="other" type="radio" name="education" value="硕士及以上">
								<label for="other">硕士及以上</label>
							</div>
						</c:if>
						<c:if test="${post.education=='大专' }">
							<div class="radio radio-danger">
								<input id="none" type="radio" name="education" value="无">
								<label for="none">无</label>
							</div>
							<div class="radio radio-danger">
								<input id="dazhuan" type="radio" name="education" value="大专" checked>
								<label for="dazhuan">大专</label>
							</div>
							<div class="radio radio-danger">
								<input id="benke" type="radio" name="education" value="本科">
								<label for="benke">本科</label>
							</div>
							<div class="radio radio-danger">
								<input id="other" type="radio" name="education" value="硕士及以上">
								<label for="other">硕士及以上</label>
							</div>
						</c:if>
						<c:if test="${post.education=='本科' }">
							<div class="radio radio-danger">
								<input id="none" type="radio" name="education" value="无">
								<label for="none">无</label>
							</div>
							<div class="radio radio-danger">
								<input id="dazhuan" type="radio" name="education" value="大专">
								<label for="dazhuan">大专</label>
							</div>
							<div class="radio radio-danger">
								<input id="benke" type="radio" name="education" value="本科" checked>
								<label for="benke">本科</label>
							</div>
							<div class="radio radio-danger">
								<input id="other" type="radio" name="education" value="硕士及以上">
								<label for="other">硕士及以上</label>
							</div>
						</c:if>
						<c:if test="${post.education=='硕士及以上' }">
							<div class="radio radio-danger">
								<input id="none" type="radio" name="education" value="无">
								<label for="none">无</label>
							</div>
							<div class="radio radio-danger">
								<input id="dazhuan" type="radio" name="education" value="大专">
								<label for="dazhuan">大专</label>
							</div>
							<div class="radio radio-danger">
								<input id="benke" type="radio" name="education" value="本科">
								<label for="benke">本科</label>
							</div>
							<div class="radio radio-danger">
								<input id="other" type="radio" name="education" value="硕士及以上" checked>
								<label for="other">硕士及以上</label>
							</div>
						</c:if>
					</li>
					<li class="li-100">
						<label for="postMajor">专业范围：</label>
						<input id="postMajor" type="text" name="postMajor" value="${post.postMajor }" placeholder="专业范围" class="form-control">
					</li>
					<li class="li-100">
						<label class="label-block">岗位福利：</label>
						<div class="add-box">
							
						</div>
						<div class="addDiv gwfl">
							+添加岗位福利
						</div>
						<input type="hidden" name="gwfl" value="${post.gwfl }">
					</li>	
					<li class="li-100">
						<label class="label-block">岗位职责：</label>
						<div class="add-box">
							
						</div>
						<div class="addDiv gwzz">
							+添加岗位职责
						</div>
						<input type="hidden" name="gwzz" value="${post.gwzz }">
					</li>	
					<li class="li-100">
						<label class="label-block">岗位要求：</label>
						<div class="add-box">
							
						</div>
						<div class="addDiv gwyq">
							+添加岗位要求
						</div>
						<input type="hidden" name="gwyq" value="${post.gwyq }">
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
<input id="status" type="hidden" value="${status }">
</body>
<script type="text/javascript">
window.onload=function(){
	var status=document.getElementById("status").value;
	if(status=='sucess'){
		alert("修改成功");
	}
}
</script>
</html>