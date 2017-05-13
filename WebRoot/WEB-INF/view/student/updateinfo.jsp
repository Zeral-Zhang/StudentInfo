<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<title>学生信息管理系统</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="../shead.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h2>
				<small>修改个人信息</small>
			</h2>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="box register-box">
				<div class="box-header with-border">
					<h3 class="box-title">用户信息</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" action="${pageContext.request.contextPath }/student/modinfo" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="userName" class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.userName }"
								placeholder="姓名" name="userName" id="userName"> 
							</div>
						</div>
						<div class="form-group">
							<label for="userCard" class="col-sm-2 control-label">学号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.userCard }"
								placeholder="学号" name="userCard" id="userCard" disabled="disabled">
							</div>
						</div>
						<div class="form-group">
							<label for="userAccount" class="col-sm-2 control-label">账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
								value="${user.userAccount }" placeholder="账号" name="userAccount"
								id="userAccount">
							</div>
						</div>
						<div class="form-group">
							<label for="userTel" class="col-sm-2 control-label">电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" value="${user.userTel }"
								placeholder="电话" name="userTel" id="userTel">
							</div>
						</div>
						<div class="form-group">
							<label for="userAddress" class="col-sm-2 control-label">地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
								value="${user.userAddress }" placeholder="地址" name=userAddress
								id="userAddress">
							</div>
						</div>
						<div class="form-group">
							<label for="userIdCard" class="col-sm-2 control-label">身份证</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
								value="${user.userIdcard }" placeholder="身份证" name="userIdcard"
								id="userIdcard">
							</div>
						</div>
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-info center-block">修改信息</button>
					</div>
					<!-- /.box-footer -->
				</form>
			</div>
			<!-- /.register-box --> </section>
		</div>
	</div>

	<!-- iCheck -->
	<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>
</body>
</html>