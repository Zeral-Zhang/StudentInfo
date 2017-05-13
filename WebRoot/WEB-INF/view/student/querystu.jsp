<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="../shead.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h2>
					<small>学生信息管理系统</small>
				</h2>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">个人信息</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>学号</th>
									<th>姓名</th>
									<th>性别</th>
									<th>电话</th>
									<th>地址</th>
									<th>身份证</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${user.userCard }</td>
									<td>${user.userName }</td>
									<td>${user.userSex }</td>
									<td>${user.userTel }</td>
									<td>${user.userAddress }</td>
									<td>${user.userIdcard }</td>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
				<div class="register-box">
					<div class="register-box-body">
						<div class="box box-primary">
							<div class="box-body box-profile">
								<img class="profile-user-img img-responsive img-circle"
									src="${pageContext.request.contextPath}/dist/img/user7-128x128.jpg"
									alt="User profile picture">
								<h3 class="profile-username text-center">${user.userName }</h3>
								<p class="text-muted text-center">个人信息</p>

								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>学号</b> <a
										class="pull-right">${user.userCard }</a></li>
									<li class="list-group-item"><b>姓名</b> <a
										class="pull-right">${user.userName }</a></li>
									<li class="list-group-item"><b>性别</b> <a
										class="pull-right">${user.userSex }</a></li>
									<li class="list-group-item"><b>电话</b> <a
										class="pull-right">${user.userTel }</a></li>
									<li class="list-group-item"><b>地址</b> <a
										class="pull-right">${user.userAddress }</a></li>
									<li class="list-group-item"><b>身份证</b> <a
										class="pull-right">${user.userIdcard }</a></li>
								</ul>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>
			</section>
			<!-- /.content -->
		</div>
	</div>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script>
		$(function() {
			$('#example2').DataTable({
				"paging" : false,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : false,
				"info" : false,
				"autoWidth" : false
			});
		});
	</script>
</body>