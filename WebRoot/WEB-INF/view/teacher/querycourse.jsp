<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="../thead.jsp"%>
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
						<h3 class="box-title">课程信息</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>课程名</th>
									<th>课程学分</th>
									<th>课程学时</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${courses }" var="course">
									<tr>
										<td>${course.courseName }</td>
										<td>${course.courseNum }</td>
										<td>${course.courseTime }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
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
			$('#example2').DataTable(
							{
								"paging" : true,
								"lengthChange" : false,
								"searching" : false,
								"ordering" : false,
								"info" : true,
								"autoWidth" : false,
								"language" : {
									"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
									"oPaginate" : {
										"sFirst" : "首页",
										"sPrevious" : "上页",
										"sNext" : "下页",
										"sLast" : "末页"
									},

								},
							});
		});
	</script>
</body>