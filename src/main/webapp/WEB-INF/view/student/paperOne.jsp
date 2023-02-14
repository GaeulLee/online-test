<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paperOne</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
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
	
		<!-- studentMenu include -->
		<div>
			<c:import url="/WEB-INF/view/student/inc/studentMenu.jsp"></c:import>
		</div>
		
		<!-- 본문 -->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
                        <div class="card">
                            <div class="card-body w-75 mx-auto">
								<h2 class="text-center mt-3 mb-4"><strong>(${testDate}) ${testTitle} 점수 확인</strong></h2>
								<h3 class="text-right mt-3 mb-4 mr-5"><strong>총점: ${totalScore}점</strong></h3>
								<table class="table" style="color: #3d4465; font-size: 17px;">
									<c:forEach var="p" items="${list}">
										<tr>
											<th>Q${p.questionIdx}. ${p.questionTitle}</th>
										</tr>
										<tr>
											<td>
												<div style="color:green;">정답 : ${p.exampleIdx}. ${p.exampleTitle}</div>
												<br>
												<c:forEach var="w" items="${wrongList}">
													<c:if test="${p.questionNo == w.questionNo}">
														<div>${w.exampleIdx}. ${w.exampleTitle}</div>
													</c:if>
												</c:forEach>
												<br>
												<div style="color:pink;">내 답 : ${p.answer}번</div>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div><!-- card-body end -->
						</div>
					</div>
				</div>
			</div>
		</div><!-- body end -->		
		
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