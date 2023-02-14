<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	시험회차(table : test) 관리(CRUD) 
	개별 시험 회차 클릭하면 그 회차의 문제 리스트 출력(문제CRUD)
	개별 문제를 클릭하면 문제에 해당하는 보기 리스트 출력(보기 CRUD)
		-> 하나 하나 들어가게 하는 것과 밖에 시험문제 관리, 보기관리 도 구현  
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
                        
                        <div class="h2"><strong>Teacher</strong></div>
                        
                    </div>
                </div>
				<!-- 헤더 오른쪽 프로필 -->
                <ul class="navbar-nav header-right">
                    <li class="nav-item dropdown header-profile">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                            <i class="mdi mdi-account"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw" class="dropdown-item">
                                <i class="icon-user"></i>
                                <span class="ml-2">비밀번호 변경 </span>
                            </a>
                            <a href="${pageContext.request.contextPath}/teacher/logout" class="dropdown-item">
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
        
            <li class="nav-label first">Home</li>
            <li>
            	<a href="${pageContext.request.contextPath}/teacher/teacherHome" aria-expanded="false">
            		<i>
            			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
            			<path width="18" height="18" d="M12 5.69L17 10.19V18H15V12H9V18H7V10.19L12 5.69M12 3L2 12H5V20H11V14H13V20H19V12H22" />
            			</svg>
            		</i>
            		<span class="nav-text">Home</span>
            	</a>
            </li>
            
            <!-- 메인메뉴 -->
            <li class="nav-label">Main Menu</li>
            <li>
            	<a href="${pageContext.request.contextPath}/teacher/test/testList" aria-expanded="false">
            		<i>
            			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
            				<path width="18" height="18" d="M18.13 12L19.39 10.74C19.83 10.3 20.39 10.06 21 10V9L15 3H5C3.89 3 3 3.89 3 5V19C3 20.1 3.89 21 5 21H11V19.13L11.13 19H5V5H12V12H18.13M14 4.5L19.5 10H14V4.5M19.13 13.83L21.17 15.87L15.04 22H13V19.96L19.13 13.83M22.85 14.19L21.87 15.17L19.83 13.13L20.81 12.15C21 11.95 21.33 11.95 21.53 12.15L22.85 13.47C23.05 13.67 23.05 14 22.85 14.19Z" />
            			</svg>
            		</i>
            		<span class="mdi mdi-note-edit-outline"></span>
            		<span class="nav-text">시험관리</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/teacher/test/qne/testListForAdd" aria-expanded="false">
            		<i>
	            		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
	            			<path width="18" height="18" d="M15 3H5A2 2 0 0 0 3 5V19A2 2 0 0 0 5 21H19A2 2 0 0 0 21 19V9L15 3M19 19H5V5H14V10H19M17 14H7V12H17M14 17H7V15H14" />
	            		</svg>
            		</i>
            		<span class="nav-text">문제관리</span>
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
                    <li><a href="${pageContext.request.contextPath}/teacher/modifyTeacherPw">비밀번호 변경</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacher/logout">로그아웃</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!--Sidebar end-->