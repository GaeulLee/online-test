<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qneList</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<link href="${pageContext.request.contextPath}/Resources/vendor/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/vendor/chartist/css/chartist.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/css/style.css" rel="stylesheet">
<style>
	@font-face {
		font-family: 'Pretendard-SemiBold';
		src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-SemiBold.woff') format('woff');
		font-weight: 400;
		font-style: normal;
	}
</style>
</head>
<body style="font-family:'Pretendard-SemiBold';">

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
		
		<!-- 본문 -->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
								<h2 class="text-center mt-3">${test.testTitle}</h2>
								<div class="mx-3 mt-3 mb-3" style="font-size:17px;">
									<a href="${pageContext.request.contextPath}/teacher/test/qne/addQne?testNo=${test.testNo}">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="40" height="40" fill="currentColor">
											<path d="M17,13H13V17H11V13H7V11H11V7H13V11H17M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
										</svg>
										문제 추가
									</a>
								</div>
								<table class="table text-center" style="color: #3d4465; font-size: 17px;">
									<tr>
										<th>문제번호</th>
										<th class="w-50">문제</th>
										<th>편집</th>
									</tr>
									<c:if test="${empty list}">
										<tr>
											<td colspan="3">등록된 문제가 없습니다. 문제를 등록해 주세요.</td>
										</tr>
									</c:if>
									<c:forEach var="q" items="${list}">
										<tr>
											<td>${q.questionIdx}번</td>
											<td class="text-left">${q.questionTitle}</td>
											<td>
												<a href="${pageContext.request.contextPath}/teacher/test/qne/modifyQne?questionNo=${q.questionNo}&testNo=${test.testNo}">
													수정
												</a>
												<a href="${pageContext.request.contextPath}/teacher/test/qne/removeQne?questionNo=${q.questionNo}&testNo=${test.testNo}">
													삭제
												</a>
											</td>
										</tr>		
									</c:forEach>
								</table>
							</div><!-- card-body end -->
						</div>
					</div>
				</div>
			</div>
		</div><!-- content-body end -->
		
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