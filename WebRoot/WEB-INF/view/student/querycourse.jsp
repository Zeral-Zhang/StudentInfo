<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">
    <%@ include file="../shead.jsp" %> 
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
                  <h3 class="box-title">课程信息</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
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
                      <tr>
                      	<td>${user.userCard }</td>
                      	<td>${user.userName }</td>
                        <td>${user.userSex }</td>
                        <td>${user.userTel }</td>
                        <td>${user.userAddress }</td>
                        <td>${user.userIdcard }</td>
                      </tr>
                    </tfoot>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
        </section><!-- /.content -->
      </div>
   </div>
    <!-- DataTables -->
    <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script>
      $(function () {
        $('#example2').DataTable({
          "paging": false,
          "lengthChange": false,
          "searching": false,
          "ordering": false,
          "info": true,
          "autoWidth": false
        });
      });
    </script>
</body>