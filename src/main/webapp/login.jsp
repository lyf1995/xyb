<!DOCTYPE HTML>
<html lang="en">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
	<title>校友邦</title>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./css/index.css">
	<script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="./js/index.js"></script>
	<style> 
</style>
</head>
<body>
	<div class="login">
	    <form id="login-form" action="login.html" method="post" autocomplete>
	        <ul>
	        	<li id="stu" class="on">我是学生</li>
	        	<li id="tea" class="off">我是教师</li>
	        	<li id="com" class="off">我是企业</li>
	        </ul>
	        <input type="hidden" id="loginType" name="type" value=1>		    
	    	<div class="input-group input-group-defined login-input">
				<label for="username" style="width:50px;" class="input-group-addon ">账号</label>
				<input id="username" name="username" type="text" class="form-control" required style="width:250px;">
			</div>
		
			<div class="input-group input-group-defined login-input">
				<label  for="password" style="width:50px;" class="input-group-addon">密码</label>
				<input id="password" name="password" type="password" class="form-control" required style="width:250px;">
			</div>
			<button type="submit" class="btn btn-danger btn-login">登录</button>
			<span>没账号？<a href=""#>快来注册</a></span>
			<span><a href=""#>忘记密码</a></span>		    		   
	    </form>
	</div>
</body>
</html>