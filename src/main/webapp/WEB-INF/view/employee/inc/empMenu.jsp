<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
	사원 등록 시 ID 체크(사원+강사+학생)
	강사 목록, 강사 삭제 (수정불가)
	학생 목록, 학생 삭제 (수정불가)
-->

<!--Nav header start-->
<div class="nav-header">
	<!-- 홈 링크 및 로고-->
    <a class="brand-logo">
        <img class="logo-abbr" src="${pageContext.request.contextPath}/Resources/images/logo.png" alt="">
        <img class="logo-compact" src="${pageContext.request.contextPath}/Resources/images/logo-text.png" alt="">
        <span class="brand-title" style="color:white; font-weight:bold; font-size:25px;">ONLINE</span>
    </a>
	<!-- 사이드 바 접고말고 -->
    <div class="nav-control">
        <div class="hamburger">
            <span class="line"></span><span class="line"></span><span class="line"></span>
        </div>
    </div>
</div>
<!--Nav header end-->

<!--Header start-->
<div class="header">
    <div class="header-content">
        <nav class="navbar navbar-expand">
            <div class="collapse navbar-collapse justify-content-between">
                <div class="header-left">
                    <div class="search_bar dropdown">
                        
                        <div class="h2"><strong>Employee</strong></div>
                        
                    </div>
                </div>
				<!-- 헤더 오른쪽 프로필 -->
                <ul class="navbar-nav header-right">
                    <li class="nav-item dropdown header-profile">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                            <i class="mdi mdi-account"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="${pageContext.request.contextPath}/employee/modifyEmpPw" class="dropdown-item">
                                <i class="icon-user"></i>
                                <span class="ml-2">비밀번호 변경 </span>
                            </a>
                            <a href="${pageContext.request.contextPath}/employee/logout" class="dropdown-item">
                                <i class="icon-key"></i>
                                <span class="ml-2">로그아웃 </span>
                            </a>
                        </div>
                    </li>
                </ul>
                
            </div>
        </nav>
    </div>
</div>
<!--Header end ti-comment-alt-->

<!--**********************************
    Sidebar start
***********************************-->
<div class="quixnav">
    <div class="quixnav-scroll">
        <ul class="metismenu" id="menu">
            
            <!-- 메인메뉴 -->
            <li class="nav-label first">Main Menu</li>
            <li>
            	<a href="${pageContext.request.contextPath}/employee/empList" aria-expanded="false">
            		<i>
            			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
	            			<path d="M20,6C20.58,6 21.05,6.2 21.42,6.59C21.8,7 22,7.45 22,8V19C22,19.55 21.8,20 21.42,20.41C21.05,20.8 20.58,21 20,21H4C3.42,21 2.95,20.8 2.58,20.41C2.2,20 2,19.55 2,19V8C2,7.45 2.2,7 2.58,6.59C2.95,6.2 3.42,6 4,6H8V4C8,3.42 8.2,2.95 8.58,2.58C8.95,2.2 9.42,2 10,2H14C14.58,2 15.05,2.2 15.42,2.58C15.8,2.95 16,3.42 16,4V6H20M4,8V19H20V8H4M14,6V4H10V6H14M12,9A2.25,2.25 0 0,1 14.25,11.25C14.25,12.5 13.24,13.5 12,13.5A2.25,2.25 0 0,1 9.75,11.25C9.75,10 10.76,9 12,9M16.5,18H7.5V16.88C7.5,15.63 9.5,14.63 12,14.63C14.5,14.63 16.5,15.63 16.5,16.88V18Z" />
	            		</svg>
            		</i>
            		
            		<span class="nav-text">사원관리</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/employee/student/studentList" aria-expanded="false">
            		<i>
	            		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
	            			<path d="M18 10.5V6L15.89 7.06C15.96 7.36 16 7.67 16 8C16 10.21 14.21 12 12 12C9.79 12 8 10.21 8 8C8 7.67 8.04 7.36 8.11 7.06L5 5.5L12 2L19 5.5V10.5H18M12 9L10 8C10 9.1 10.9 10 12 10C13.1 10 14 9.1 14 8L12 9M14.75 5.42L12.16 4.1L9.47 5.47L12.07 6.79L14.75 5.42M12 13C14.67 13 20 14.33 20 17V20H4V17C4 14.33 9.33 13 12 13M12 14.9C9 14.9 5.9 16.36 5.9 17V18.1H18.1V17C18.1 16.36 14.97 14.9 12 14.9Z" />
	            		</svg>
            		</i>
            		<span class="nav-text">학생관리</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/employee/teacher/teacherList" aria-expanded="false">
            		<i>
	            		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
	            			<path d="M20,17A2,2 0 0,0 22,15V4A2,2 0 0,0 20,2H9.46C9.81,2.61 10,3.3 10,4H20V15H11V17M15,7V9H9V22H7V16H5V22H3V14H1.5V9A2,2 0 0,1 3.5,7H15M8,4A2,2 0 0,1 6,6A2,2 0 0,1 4,4A2,2 0 0,1 6,2A2,2 0 0,1 8,4Z" />
	            		</svg>
            		</i>
            		
            		<span class="nav-text">강사관리</span>
            	</a>
            </li>
            
			<!-- 비밀번호 변경 및 로그아웃 -->
            <li class="nav-label">Personal</li>
            <li>
            	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
            		<i class="icon icon-single-04"></i>
            		<span class="nav-text">마이페이지</span>
            	</a>
                <ul aria-expanded="false">
                    <li><a href="${pageContext.request.contextPath}/employee/modifyEmpPw">비밀번호 변경</a></li>
                    <li><a href="${pageContext.request.contextPath}/employee/logout">로그아웃</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!--Sidebar end-->