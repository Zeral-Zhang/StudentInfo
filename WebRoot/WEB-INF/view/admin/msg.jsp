<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<title>学生信息管理系统</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="../head.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h2>
				<small>信息发布</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content">
			<div class="post clearfix">
				<div class='user-block'>
					<img class='img-circle img-bordered-sm'
						src='${pageContext.request.contextPath}/dist/img/user2-160x160.jpg' alt='user image'> <span
						class='username'> <a href="#">发布消息</a>
					</span> 
				</div>
				<!-- /.user-block -->
				<form action="msgAdd" class='form-horizontal' method="post">
					<div class='form-group margin-bottom-none'>
						<div class='col-sm-9'>
							<input class="form-control input-sm" name="msg" placeholder="请输入消息">
						</div>
						<div class='col-sm-3'>
							<button type="submit" class='btn btn-danger pull-right btn-block btn-sm'>发布</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.post --> </section>
</body>
</html>