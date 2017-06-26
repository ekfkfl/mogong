<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
	  <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}${sessionScope.userDTO.path}" class="img-circle" alt="User Image" style="height:50px">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.userDTO.name}</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Administrator</li>
        <li><a href="#"><i class="fa fa-link"></i> <span>관리자모드- 코드관리</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>