<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<style>
.example-modal .modal {
	position: relative;
	top: auto;
	bottom: auto;
	right: auto;
	left: auto;
	display: block;
	z-index: 1;
}

.example-modal .modal {
	background: transparent !important;
}
</style>
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
				<small>查找班级学生信息</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form action="${pageContext.request.contextPath }/admin/findClassStudent" method="post">
						<div class="form-group">
							<select class="form-control" name="classId">
								<c:forEach items="${classes }" var="clazz">
									<option value="${clazz.classId }">${clazz.grade.gradeName}${clazz.className }</option>
								</c:forEach>
							</select>
						</div>
						<div class="row">
							<div class="col-xs-4">
								<button type="submit" class="btn btn-primary btn-block btn-flat">查找</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
				<!-- /.form-box -->
			</div>
			<!-- /.register-box -->

			<c:if test="${not empty userClasses }">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">学生信息</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="example2" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>学号</th>
								<th>账号</th>
								<th>姓名</th>
								<th>性别</th>
								<th>电话</th>
								<th>地址</th>
								<th>身份证</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userClasses }" var="userClass">
								<tr>
									<td>${userClass.users.userCard }</td>
									<td>${userClass.users.userAccount }</td>
									<td>${userClass.users.userName }</td>
									<td>${userClass.users.userSex }</td>
									<td>${userClass.users.userTel }</td>
									<td>${userClass.users.userAddress }</td>
									<td>${userClass.users.userIdcard }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
			</c:if> 
			</section>
		</div>
	</div>
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
</html>