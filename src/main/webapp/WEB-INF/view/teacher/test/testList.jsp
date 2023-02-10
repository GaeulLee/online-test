<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testList</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<link href="${pageContext.request.contextPath}/Resources/vendor/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/vendor/chartist/css/chartist.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/css/style.css" rel="stylesheet">
<style>
	@font-face {
		font-family: 'Pretendard-Regular';
		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		font-weight: 400;
		font-style: normal;
	}
</style>
</head>
<body style="font-family:'Pretendard-Regular';">
	<!-- preloader -->
	<div id="preloader">
	    <div class="sk-three-bounce">
	        <div class="sk-child sk-bounce1"></div>
	        <div class="sk-child sk-bounce2"></div>
	        <div class="sk-child sk-bounce3"></div>
	    </div>
	</div>

	<div id="main-wrapper">
		<!-- teacherMenu include -->
		<div>
			<c:import url="/WEB-INF/view/teacher/inc/teacherMenu.jsp"></c:import>
		</div>
		
		<!-- body -->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h2>전체 시험 목록</h2>
								
								
								<!-- 시험 검색 폼 -->
								<div>
									<form action="${pageContext.request.contextPath}/teacher/test/testList" method="get">
										<input type="text" name="searchWord" placeholder="시험명 검색" class="form-control input-rounded w-20" style="display: inline;">
										<button type="submit" class="btn btn-rounded btn-primary">검색</button>	
									</form>
									<span>
										<a href="${pageContext.request.contextPath}/teacher/test/addTest" class="">
											<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="40" height="40" fill="currentColor">
												<path d="M17,13H13V17H11V13H7V11H11V7H13V11H17M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
											</svg>
										</a>
									</span>
								</div>
								
								<!-- 본문 -->
								<table class="table table-borderless" style="color: #3d4465; font-size: 17px;">
									<tr>
										<th class="text-center w-25">시험 날짜</th>
										<th class="text-center">시험 제목</th>
										<th class="text-center">편집</th>
									</tr>
									<c:forEach var="t" items="${list}">
										<tr>
											<td class="text-center">${t.testDate}</td>
											<td>${t.testTitle}</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/teacher/test/modifyTest?testNo=${t.testNo}">수정</a>
												<a href="${pageContext.request.contextPath}/teacher/test/removeTest?testNo=${t.testNo}">삭제</a>
											</td>
										</tr>
									</c:forEach>
								</table>
								
								
								
								<nav>
                                    <ul class="pagination pagination-circle"  style="justify-content: center;">
                                    
                                    	<!-- 화살표 -->
                                        <li class="page-item page-indicator">
                                            <c:if test="${currentPage == 1}">
												<i class="icon-arrow-left page-link"></i>
											</c:if>
											<c:if test="${currentPage > 1}">
												<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${currentPage-1}&searchWord=${searchWord}">
													<i class="icon-arrow-left"></i>
												</a>
											</c:if>
                                        </li>
                                        
                                        <!-- 현재 페이지, 10개 출력 -->
										<c:forEach varStatus="a" begin="${startPage}" end="${endPage}" step="1">
											<c:if test="${a.current == currentPage}">
												<li class="page-item active">
													<span class="page-link">${a.current}</span>
												</li>
											</c:if>
											<c:if test="${a.current != currentPage}">
												<li class="page-item">
													<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${a.current}&searchWord=${searchWord}">${a.current}</a>
												</li>
											</c:if>
										</c:forEach>

                                        <!-- 화살표 -->
                                        <li class="page-item page-indicator">
                                            <c:if test="${currentPage == lastPage}">
												<i class="icon-arrow-right page-link"></i>
											</c:if>
                                            <c:if test="${currentPage < lastPage}">
												<a class="page-link" href="${pageContext.request.contextPath}/teacher/test/testList?currentPage=${currentPage+1}&searchWord=${searchWord}">
													<i class="icon-arrow-right"></i>
												</a>
											</c:if>
                                        </li>
                                    </ul>
                                </nav>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	
		<!-- footer -->
		<div class="footer">
		    <div class="copyright">
		        <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p>
		        <p>Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a></p>
		    </div>
		</div>
		
		
	</div><!-- main-wrapper -->
<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<script src="${pageContext.request.contextPath}/Resources/vendor/global/global.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/quixnav-init.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/custom.min.js"></script>

<script src="${pageContext.request.contextPath}/Resources/vendor/chartist/js/chartist.min.js"></script>

<script src="${pageContext.request.contextPath}/Resources/vendor/moment/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/vendor/pg-calendar/js/pignose.calendar.min.js"></script>


<script src="${pageContext.request.contextPath}/Resources/js/dashboard/dashboard-2.js"></script>
<!-- Circle progress -->
</body>
</html>