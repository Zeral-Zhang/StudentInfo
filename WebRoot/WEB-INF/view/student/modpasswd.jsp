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
						<h3 class="box-title">修改密码</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form action="modps" method="post" class="form-horizontal"
							onsubmit="return insertManager()">
							<div class="box-body">
								<div class="form-group">
									<label for="inputEmail3" class="col-sm-2 control-label">新密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control" id="inputPassword"
											placeholder="Password">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPassword3" class="col-sm-2 control-label">确认密码</label>
									<div class="col-sm-10">
										<input type="password" class="form-control"
											placeholder="Password" name="userPasswd" id="userPasswd">
									</div>
								</div>
								<div class="form-group"></div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="regest" class="btn btn-default">重置</button>
								<button type="submit" class="btn btn-info pull-right">确认</button>
							</div>
							<!-- /.box-footer -->
						</form>
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
		function insertManager() {
			var password = document.getElementById("inputPassword").value;
			var repassword = document.getElementById("userPasswd").value;
			debugger;
			if (password != repassword) {
				window.alert("您输入的新密码与确认密码确认不一致");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>