<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 지난 시험, 오늘 볼 시험 , 앞으로 볼 시험(날짜로 분기) -->

<!-- 오늘날짜를 기준으로 시험 참여 가능 여부 분기 -->
<!--
	지나간 시험(table : test) 리스트 + 점수 -> 점수 확인버튼 -> 제출 답안지 확인(O/X)(table : paper)
		+ 이번 시험 회차의 평균 점수, 응시자 수, 내 등수 등등 추가 정보
	오늘 날짜 시험 리스트는 응시버튼 -> 시험지 출력(table : question(문제) JOIN example(보기)) -> 답안 제출(table : paper)
	누가 몇회의 어떤 시험의 여러 문제의 답
-->
<!--Nav header start-->
<div class="nav-header">
	<!-- 홈 링크 및 로고-->
    <a href="index.html" class="brand-logo">
        <img class="logo-abbr" src="./images/logo.png" alt="">
        <img class="logo-compact" src="./images/logo-text.png" alt="">
        <img class="brand-title" src="./images/logo-text.png" alt="">
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
                        
                        <div class="h2"><strong>Student</strong></div>
                        
                    </div>
                </div>
				<!-- 헤더 오른쪽 프로필 -->
                <ul class="navbar-nav header-right">
                    <li class="nav-item dropdown header-profile">
                        <a class="nav-link" href="#" role="button" data-toggle="dropdown">
                            <i class="mdi mdi-account"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a href="${pageContext.request.contextPath}/student/modifyStudentPw" class="dropdown-item">
                                <i class="icon-user"></i>
                                <span class="ml-2">비밀번호 변경 </span>
                            </a>
                            <a href="${pageContext.request.contextPath}/student/logout" class="dropdown-item">
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
            	<a href="${pageContext.request.contextPath}/student/studentHome" aria-expanded="false">
            		<i>
            			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
            			<path width="18" height="18" d="M12 5.69L17 10.19V18H15V12H9V18H7V10.19L12 5.69M12 3L2 12H5V20H11V14H13V20H19V12H22" />
            			</svg>
            		</i>
            		<span class="nav-text">Home</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/student/studentTestList" aria-expanded="false">
            		<i>
            			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor">
            				<path width="18" height="18" d="M18.13 12L19.39 10.74C19.83 10.3 20.39 10.06 21 10V9L15 3H5C3.89 3 3 3.89 3 5V19C3 20.1 3.89 21 5 21H11V19.13L11.13 19H5V5H12V12H18.13M14 4.5L19.5 10H14V4.5M19.13 13.83L21.17 15.87L15.04 22H13V19.96L19.13 13.83M22.85 14.19L21.87 15.17L19.83 13.13L20.81 12.15C21 11.95 21.33 11.95 21.53 12.15L22.85 13.47C23.05 13.67 23.05 14 22.85 14.19Z" />
            			</svg>
            		</i>
            		<span class="mdi mdi-note-edit-outline"></span>
            		<span class="nav-text">점수확인</span>
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
                    <li><a href="${pageContext.request.contextPath}/student/modifyStudentPw">비밀번호 변경</a></li>
                    <li><a href="${pageContext.request.contextPath}/student/logout">로그아웃</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!--Sidebar end-->
