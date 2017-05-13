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
				<small>新增课程</small>
			</h2>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form action="" method="post">
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="courseName" placeholder="课程名">
						</div>
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="courseNum" placeholder="课程学分">
						</div>
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="courseTime" placeholder="课程学时">
						</div>
						<div class="form-group">
							<select class="form-control" name="classId" id="classes">
								<c:forEach items="${classes }" var="clazz">
									<option value="${clazz.classId }">${clazz.grade.gradeName}${clazz.className }</option>
								</c:forEach>
							</select>
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

</body>
</html>