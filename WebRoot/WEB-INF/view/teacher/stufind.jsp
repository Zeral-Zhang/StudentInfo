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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<title>学生信息管理系统</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@ include file="../thead.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h2>
				<small>查找学生</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form action="${pageContext.request.contextPath}/teacher/findStudent" method="post">
						<div class="form-group has-feedback">
							<input type="text" name="userName" class="form-control" placeholder="姓名">
						</div>
						<div class="row">
							<div class="col-xs-4">
								<button class="btn btn-primary btn-block btn-flat" id="findBtn" type="submit">查找</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
				<!-- /.form-box -->
			</div>
			<!-- /.register-box --> </section>
			<c:if test="${not empty students}">
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
					<c:forEach items="${students }" var="user">
					<tr>
						<td>${user.userCard }</td>
						<td>${user.userName }</td>
						<td>${user.userSex }</td>
						<td>${user.userTel }</td>
						<td>${user.userAddress }</td>
						<td>${user.userIdcard }</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
	</div>

	<!-- /.example-modal -->

<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
</body>
</html>