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
						<h3 class="box-title">班级信息</h3>
					</div>
					<!-- /.box-header -->
					
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
				<div class="register-box">
					<div class="register-box-body">
						<div class="box box-primary">
							<div class="box-body box-profile">

								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>学院</b><div
										class="pull-right">${clazz.classDep }</div></li>
									<li class="list-group-item"><b>年级</b> <div
										class="pull-right">${grade.gradeName }</div></li>
									<li class="list-group-item"><b>班级</b> <div
										class="pull-right">${clazz.className }</div></li>
									<li class="list-group-item"><b>班主任</b><div
										class="pull-right">${clazz.classTeacher }</div></li>
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