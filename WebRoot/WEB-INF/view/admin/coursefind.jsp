<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<small>查找课程</small>
			</h2>
			</section>
			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form id="courseName" method="post">
						<div class="form-group has-feedback">
							<input type="text" name="courseName" class="form-control" placeholder="课程名,可以根据课程名模糊查询">
						</div>
						<div class="row">
							<div class="col-xs-4">
								<button class="btn btn-primary btn-block btn-flat" id="findBtn" type="button">查询</button>
						
							</div>
							<!-- /.col -->
						</div>
					</form>
							<table id="example2" class="table table-bordered table-hover" style="display: none;">
								<thead>
									<tr>
										<th>课程名</th>
										<th>课程学分</th>
										<th>课程学时</th>
										<th>修改</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${courseName }</td>
										<td>${courseNum }</td>
										<td>${courseTime }</td>
										<td></td>
									</tr>
								</tbody>
						</table>
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
					<h4 class="modal-title">课程信息</h4>
				</div>
				<div class="modal-body">
					<form id="courseInfo" method="post">
						<input type="hidden" name="courseId">
						<div class="form-group has-feedback">
							<input type="text" name="courseName" class="form-control" placeholder="课程名">
						</div>
						<div class="form-group has-feedback">
							<input type="text" name="courseNum" class="form-control" placeholder="课程学分">
						</div>
						<div class="form-group has-feedback">
							<input type="text" name="courseTime" class="form-control" placeholder="课程学时">
						</div>
						<div class="row">
							<div class="col-xs-4">
								<button type="button" id="changeCourse" class="btn btn-primary btn-block btn-flat">修改</button>
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






	<script>
		var trTemp = "<tr><td>#courseName#</td><td>#courseNum#</td><td>#courseTime#</td><td><button type='button' onclick='openToggle(#course#)' class='btn btn-default'>"
        + "<i class='fa fa-edit'></i> 修改</button></td>"
		+ "</tr>";
		function openToggle(course) {
			$("#mymodal input[name='courseId']").val(course.courseId);
			$("#mymodal input[name='courseName']").val(course.courseName);
			$("#mymodal input[name='courseNum']").val(course.courseNum);
			$("#mymodal input[name='courseTime']").val(course.courseTime);
			$("#mymodal").modal("toggle");
		};
		$(function() {
			$("#changeCourse").click(function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/updateCourse",
					type: "post",
					data: $("#courseInfo").serialize(),
					success : function(rs){
						$("#mymodal").modal("hide");
						$("#example2").hide();
					}
				});
			});
			$("#findBtn").click(function() {
				var $table = $("#example2");
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/findCourseByName",
					type: "post",
					dataType: "json",
					data: $('#courseName').serialize(),
					success : function(rs){
						$table.show();
						$("tbody", $table).empty();
						for(var i=0,length=rs.length; i<length; i++) {
							$("tbody", $table).append(trTemp.replace("#courseName#", rs[i].courseName).replace("#courseNum#", rs[i].courseNum).replace("#courseTime#", rs[i].courseTime).replace("#course#", JSON.stringify(rs[i])));
						}
					}
				});
			});
		});
	</script>
</body>
</html>