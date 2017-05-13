<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息管理系统</title>
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
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/skins/_all-skins.min.css">
</head>
<body>

	<header class="main-header"> <!-- Logo --> <a
		href="index2.html" class="logo"> <span class="logo-lg">学生信息管理系统</span>
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->

	<div class="navbar-custom-menu">
		<ul class="nav navbar-nav">
			<!-- Messages: style can be found in dropdown.less-->
			<li class="dropdown messages-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                  <span class="label label-success">${fn:length(msgs)}</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">你有 ${fn:length(msgs)}条信息</li>
                  <li>
                    <!-- inner menu: contains the actual data -->
                    <ul class="menu">
                     <c:forEach items="${msgs }" var="msg">
                      <li><!-- start message -->
                        <a href="#">
                          <div class="pull-left">
                            <img src="${pageContext.request.contextPath}/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                          </div>
                          <h4>
                            ${msg.users.userName }
                            <small><i class="fa fa-clock-o"></i> ${msg.pbDate }</small>
                          </h4>
                          <p>${msg.msg }</p>
                        </a>
                      </li><!-- end message -->
                      </c:forEach>
                    </ul>
                  </li>
                </ul>
              </li>

			<!-- 退出按钮 -->
			<li>
				<a href="${pageContext.request.contextPath }/user/logout"> 
					<i class="fa fa-power-off"></i>
				</a>
			</li>
		</ul>
	</div>
	</nav> </header>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar"> <!-- Sidebar user panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img
				src="${pageContext.request.contextPath}/dist/img/user7-128x128.jpg"
				class="img-circle" alt="User Image">
		</div>
		<div class="pull-left info">
			<p>${user.userName }</p>
			<i class="fa fa-circle text-success"></i> Online
		</div>
	</div>
	<!-- search form --> <!-- /.search form --> <!-- sidebar menu: : style can be found in sidebar.less -->
	<ul class="sidebar-menu">
		<li class="header">信息查看</li>



		<li class="treeview"><a href="#"> <i class="fa fa-pie-chart"></i>
				<span>班级查看</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a
					href="${pageContext.request.contextPath}/student/seeclass"><i
						class="fa fa-circle-o text-aqua"></i> 查看班级</a></li>
			</ul></li>
		<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
				<span>课程查看</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a
					href="${pageContext.request.contextPath}/student/seecourse"><i
						class="fa fa-circle-o text-aqua"></i>查找课程信息</a></li>
				<li><a
					href="${pageContext.request.contextPath}/student/seeclasscour"><i
						class="fa fa-circle-o text-yellow"></i>查看班级课程</a></li>
			</ul></li>
		<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
				<span>个人信息管理</span> <i class="fa fa-angle-left pull-right"></i>
		</a>
			<ul class="treeview-menu">
				<li><a href="${pageContext.request.contextPath}/student/info"><i
						class="fa fa-circle-o text-aqua"></i> 查看个人信息</a></li>
				<li><a
					href="${pageContext.request.contextPath}/student/modinfo"><i
						class="fa fa-circle-o text-green"></i> 修改个人信息</a></li>
				<li><a
					href="${pageContext.request.contextPath}/student/modpasswd"><i
						class="fa fa-circle-o text-red"></i> 修改密码</a></li>
			</ul></li>
	</ul>
	</section> <!-- /.sidebar --> </aside>
	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.5 -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
</body>
</html>