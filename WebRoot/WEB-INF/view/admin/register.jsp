<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
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
				<small>新增学生</small>
			</h2>
			<ol class="breadcrumb">
				<form action="${pageContext.request.contextPath }/admin/importStudentsByExcel" method="post" enctype="multipart/form-data">
					<div class="info-box">
						<input class="btn btn-app" type="file" name="file">
						<a id="btn-import-students" class="btn btn-success btn-block btn-social"> <i
							class=" fa fa-users"></i>批量上传
						</a>
					</div>
					<!-- /.info-box -->
				</form>
				<div class="alert alert-danger alert-dismissable" style="display: none;">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h4><i class="icon fa fa-ban"></i> 上传错误!</h4>
                  <div></div>
                </div>
				<div class="alert alert-success alert-dismissable" style="display: none;">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  <h4><i class="icon fa fa-ban"></i> 上传成功</h4>
                  <div></div>
                </div>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content">
			<div class="register-box">
				<div class="register-box-body">

					<form action="" method="post">
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="userName" placeholder="姓名">
							<span class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							<input type="password" class="form-control" name="userPasswd" placeholder="密码">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="userCard" placeholder="学号">
						</div>
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="userAccount" placeholder="账号">
						</div>
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="userTel" placeholder="电话">
						</div>
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="userAddress" placeholder="地址">
						</div>
						<div class="form-group has-feedback">
							<input type="text" class="form-control" name="userIdcard" placeholder="身份证">
						</div>
						<div class="form-group">
							<label>年级</label> 
							<select class="form-control" id="grade">
								<c:forEach items="${grades }" var="grade">
									<option value="${grade.gradeId }">${grade.gradeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<select class="form-control" name="classId" id="classes">
								<c:forEach items="${classes }" var="clazz">
									<option value="${clazz.classId }">${clazz.classDep}${clazz.className }</option>
								</c:forEach>
							</select>
						</div>
						<div class="radio" style="text-align: center">
							<label> <input type="radio" name="userSex"
								id="optionsRadios2" value="男"> 男
							</label> <label> <input type="radio" name="userSex"
								id="optionsRadios2" value="女"> 女
							</label>
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
	<!-- iCheck -->
	<script src="${pageContext.request.contextPath }/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery.form.js"></script>
	<script>
		function exceptionHandler(jqXHR){
			if(jqXHR == null || jqXHR.responseText.indexOf("<html>") > -1 || jqXHR.responseText == ""){
				/* window.location = "${pageContext.request.contextPath }/user/login"; */
			}else{
				var errorObj = JSON.parse(jqXHR.responseText);
				if(errorObj.msg){
					var errorMessage = errorObj.msg;
					$(".alert-danger").show().children("div").html(msg);
				}else{
					$(".alert-danger").show();
				}
			}	
		}	
		$(function() {
			$("#btn-import-students").click(function(){
				$(this).closest("form").ajaxSubmit({
					dataType:"text",
					success:function(m){
						if(m == '导入成功！') {
							$(".alert-success").show().children("div").html(m);
						}else {
							$(".alert-danger").show().children("div").html(m);	
						}
					},
					error:exceptionHandler
				});
			});
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
			
			$("#grade").change(function() {
				var gradeId = $(this).val();
				$.ajax({
					url: "${pageContext.request.contextPath}/admin/register/gradeClasses/" + gradeId,
					type: "get",
					dataType: "json",
					success: function(rs){
						$("#classes").empty();
						for(var i=0,length=rs.length; i < length; i++) {
							$("#classes").append("<option value='"+rs[i].classId+"'>"+rs[i].classDep+rs[i].className+"</option>");	
						}
						
					}
				});
			});
		});
	</script>
</body>
</html>