<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
	  <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><i class="fa fa-link"></i> <span>개인정보수정</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>스터디 관리</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/mypage/studyRequest" target="mainContent">신청중</a></li>
            <li><a href="#">진행중</a></li>
            <li><a href="#">모집중</a></li>
          </ul>
           <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>쪽지함</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
          	<li><a href="#">쪽지쓰기</a></li>
            <li><a href="#">받은쪽지함</a></li>
            <li><a href="#">보낸쪽지함</a></li>
          </ul>
          <li><a href="#"><i class="fa fa-link"></i> <span>관리자모드- 코드관리</span></a></li>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>