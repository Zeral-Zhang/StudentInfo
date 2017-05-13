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
				<small>查找学生</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content">
			<div class="register-box-body">

				<form action="${pageContext.request.contextPath }/admin/findStudent" method="post">
					<div class="form-group has-feedback">
						<input type="text" name="userName" class="form-control" placeholder="姓名">
					</div>
					<div class="row">
						<div class="col-xs-4">
							<button class="btn btn-primary btn-block btn-flat" type="submit">查询</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
			</div>
			<!-- /.form-box --> <!-- /.box-header --> <!-- /.box-body -->
			<c:if test="${not empty users }">
			<table id="example2" class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>学号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>电话</th>
						<th>地址</th>
						<th>身份证</th>
						<th>修改</th>
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
						<td><button type='button' onclick="openToggle(this, '${user.userId}')" class='btn btn-default'><i class='fa fa-edit'></i> 修改</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:if>
		</div>
		<!-- /.register-box -->
		</section>
	</div>

	<div class="modal" id="mymodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">学生信息</h4>

				</div>

				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/admin/updateStudent" method="post">
						<input type="hidden" name="userId">
						<div class="form-group has-feedback">
							<input type="text" name="userName" class="form-control" placeholder="姓名">
							<span class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							<input type="text" name="userCard" class="form-control" placeholder="学号">
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
						<div class="row">
							<div class="col-xs-4">
								<button type="submit" class="btn btn-primary btn-block btn-flat">修改</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->




	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script>
		function openToggle(el, userId) {
			var $tds = $(el).parent().siblings();
			$("#mymodal input[name='userId']").val(userId);
			$("#mymodal input[name='userCard']").val($tds.eq(0).text());
			$("#mymodal input[name='userName']").val($tds.eq(1).text());
			$("#mymodal input[name='userTel']").val($tds.eq(3).text());
			$("#mymodal input[name='userAddress']").val($tds.eq(4).text());
			$("#mymodal input[name='userIdcard']").val($tds.eq(5).text());
			$("#mymodal").modal("show");
		}
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