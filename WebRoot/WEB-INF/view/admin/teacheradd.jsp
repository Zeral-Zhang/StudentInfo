<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/AdminLTE.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
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
				<small>新增教师</small>
			</h2>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form action="" method="post">
						<div class="form-group has-feedback">
							<input type="text" name="userName" class="form-control" placeholder="姓名">
							<span class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							<input type="password" name="userPasswd" class="form-control" placeholder="密码">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							<input type="text" name="userAccount" class="form-control" placeholder="账号">
						</div>
						<div class="form-group has-feedback">
							<input type="text" name="userTel" class="form-control" placeholder="电话">
						</div>
						<div class="form-group has-feedback">
							<input type="text" name="userAddress" class="form-control" placeholder="地址">
						</div>
						<div class="form-group has-feedback">
							<input type="text" name="userIdcard" class="form-control" placeholder="身份证">
						</div>
						
						<div class="radio" style="text-align: center">
							<label> <input type="radio" name="userSex"
								id="optionsRadios2" value="男"> 男
							</label> <label> <input type="radio" name="userSex"
								id="optionsRadios2" value="女"> 女
							</label>
						</div>
						<div class="row">
							<div class="col-xs-4">
								<button type="submit" class="btn btn-primary btn-block btn-flat">新增</button>
							</div>
							<!-- /.col -->
						</div>
					</form>


				</div>
				<!-- /.form-box -->
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