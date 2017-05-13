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
		<%@ include file="../thead.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h2>
				<small>学生成绩管理</small>
			</h2>
			</section>
			
			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form action="${pageContext.request.contextPath }/teacher/findClassStudentAndScore" method="get">
						<div class="form-group">
							<label>班级</label> 
							<select class="form-control" name="classId">
								<c:forEach items="${classes }" var="clazz">
									<option value="${clazz.classId }" ${classId eq clazz.classId ? 'selected' : ''}>${clazz.grade.gradeName}${clazz.className }</option>
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
								<th>姓名</th>
								<th>课程</th>
								<th>成绩</th>
								<th>成绩管理</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userClasses }" var="userClass">
								<c:forEach items="${classCourses }" var="classCourse">
									<c:set var="key" value="${userClass.users.userId}_${classCourse.course.courseId }"></c:set>
									<tr>
										<td>${userClass.users.userName }</td>
										<td>${classCourse.course.courseName }</td>
										<td>${userCourseScore[key]}</td>
										<td><button type='button' onclick="openToggle('${userClass.users.userId}', '${classCourse.course.courseId}')" class='btn btn-default'><i class='fa fa-edit'></i> 修改</button></td>
									</tr>	
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
			</c:if> 
			
			<div class="modal" id="mymodal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">成绩管理</h4>
		
						</div>
		
						<div class="modal-body">
							<form action="${pageContext.request.contextPath }/teacher/updateScore" method="post">
								<input type="hidden" name="userId">
								<input type="hidden" name="classId">
								<input type="hidden" name="courseId">
								<div class="form-group has-feedback">
									<input type="text" name="score" class="form-control" placeholder="成绩">
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
			</section>
		</div>
	</div>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script>
		function openToggle(userId, courseId) {
			$("#mymodal input[name='classId']").val($(":input[name='classId']").val());
			$("#mymodal input[name='userId']").val(userId);
			$("#mymodal input[name='courseId']").val(courseId);
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