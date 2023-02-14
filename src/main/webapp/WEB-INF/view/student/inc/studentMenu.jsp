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
            				<path d="M17,21L14.25,18L15.41,16.84L17,18.43L20.59,14.84L21.75,16.25M12.8,21H5C3.89,21 3,20.11 3,19V5C3,3.89 3.89,3 5,3H19C20.11,3 21,3.89 21,5V12.8C20.39,12.45 19.72,12.2 19,12.08V5H5V19H12.08C12.2,19.72 12.45,20.39 12.8,21M12,17H7V15H12M14.68,13H7V11H17V12.08C16.15,12.22 15.37,12.54 14.68,13M17,9H7V7H17" />
            			</svg>
            		</i>
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