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
				<small>查找班级</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form id="className" method="post">
						<div class="form-group has-feedback">
							<input type="text" name="className" class="form-control" placeholder="班级名">
						</div>
						<div class="row">
							<div class="col-xs-4">
								<button class="btn btn-primary btn-block btn-flat" id="findBtn" type="button">查询</button>
							</div>
							<table id="example2" class="table table-bordered table-hover"  style="display: none;">
							<thead>
								<tr>
									<th>学院</th>
									<th>年级</th>
									<th>班级</th>
									<th>班主任</th>
									<th>修改</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${classDep }</td>
									<td>${grade }</td>
									<td>${className }</td>
									<td></td>
								</tr>
							</tbody>
						</table>
							<!-- /.col -->
						</div>
					</form>
				</div>
				<!-- /.form-box -->
			</div>
			<!-- /.register-box --> </section>
		</div>
	</div>
	<div class="modal" id="mymodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">班级信息</h4>
				</div>
				<div class="modal-body">
					<form id="classInfo" method="post">
						<input type="hidden" name="classId">
						<div class="form-group has-feedback">
							<input type="text"  name="classDep" class="form-control" placeholder="学院">
						</div>
						<div class="form-group">
							<select class="form-control" name="grade.gradeId">
								<c:forEach items="${grades }" var="grade">
									<option value="${grade.gradeId }">${grade.gradeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group has-feedback">
							<input type="text"  name="className" class="form-control" placeholder="班级">
						</div>
						<div class="form-group has-feedback">
							<input type="text"  name="classTeacher" class="form-control" placeholder="教师">
						</div>
						<div class="row">
							<div class="col-xs-4">
								<button type="button" id="changeClass" class="btn btn-primary btn-block btn-flat">修改</button>
							</div>
							<!-- /.col -->
						</div>
					</form>
				</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->





	<script>
		var trTemp = "<tr><td>#classDep#</td><td>#gradeName#</td><td>#className#</td><td>#classTeacher#</td><td><button type='button' onclick='openToggle(#clazz#)' class='btn btn-default'>"
        + "<i class='fa fa-edit'></i> 修改</button></td>"
		+ "</tr>";
		function openToggle(clazz) {
			$("#mymodal input[name='classId']").val(clazz.classId);
			$("#mymodal input[name='classDep']").val(clazz.classDep);
			$("#mymodal input[name='className']").val(clazz.className);
			$("#mymodal input[name='gradeId']").val(clazz.gradeId);
			$("#mymodal input[name='gradeName']").val(clazz.gradeName);
			$("#mymodal input[name='className']").val(clazz.className);
			$("#mymodal input[name='classTeacher']").val(clazz.classTeacher);
			$("#mymodal").modal("toggle");
		};
		$(function() {
			$("#changeClass").click(function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/updateClass",
					type: "post",
					data: $("#classInfo").serialize(),
					success : function(rs){
						$("#mymodal").modal("hide");
						$("#example2").hide();
					}
				});
			});
			$("#findBtn").click(function() {
				var $table = $("#example2");
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/findClassByName",
					type: "post",
					dataType: "json",
					data: $('#className').serialize(),
					success : function(rs){
						$table.show();
						$("tbody", $table).empty();
						for(var i=0,length=rs.length; i<length; i++) {
							$("tbody", $table).append(trTemp.replace("#classDep#", rs[i].classDep).replace("#gradeName#", rs[i].gradeName).replace("#className#", rs[i].className).replace("#classTeacher#", rs[i].classTeacher).replace("#clazz#", JSON.stringify(rs[i])));
						}
					}
				});
			});
		});
	</script>
</body>
</html>