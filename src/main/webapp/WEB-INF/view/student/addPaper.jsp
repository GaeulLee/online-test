<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addPaper</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<c:forEach var="q" items="${qList}" varStatus="i">
	<script>
		$(document).ready(function(){

			const index = '<c:out value="${i.index}"/>';
			const inputNameAnswerRadio = 'input[name=answer'+index+']:radio';
			const answerChecked = '.answer'+index+':checked';
			const getAnswer = '#getAnswer'+index;
			
			//const answerVal = 'input[name=answer'+index+']:radio:checked';
			
			var valueCntCk = Number(1);
			
			// console.log('index '+index);
			console.log('inputNameAnswerRadio '+inputNameAnswerRadio);
			
			// 보기의 값이 바뀌면 보기 인풋(name=answer+index)의 값을 히든으로 넘길 인풋(name=answer)에 넣음
			$(inputNameAnswerRadio).change(function(){
				$(getAnswer).attr("value", $(this).val());
			});

		});
	</script>
</c:forEach>
<script>
	$(document).ready(function(){
		
		const listSize = '<c:out value="${fn:length(qList)}"/>';
		
		$('#addPaperBtn').click(function(){
					
			if($('.answerClass:checked').length < listSize){
				console.log('length 진입');
				$('#msg').text('모든 문제에 답을 해주세요.');
				console.log('msg');
			} else if($('.answerClass:checked').length = listSize) {
				$('#addPaperForm').submit();
			}

		});
	});
</script>
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
								<h2 class="text-center mt-3 mb-4"><strong>(${testDate}) ${testTitle} 시험지</strong></h2>
								
								<form action="${pageContext.request.contextPath}/student/addPaper" method="post" id="addPaperForm">
									<table class="table" style="color: #3d4465; font-size: 17px;">
										<c:forEach var="q" items="${qList}" varStatus="i">
											<input type="hidden" name="questionNo" value="${q.questionNo}">
											<input type="hidden" name="answer" id="getAnswer${i.index}">
											<input type="hidden" name="testNo" value="${testNo}">
											<tr>
												<!-- 문제 -->
												<th>Q${q.questionIdx}. ${q.questionTitle}</th>
											</tr>
											<tr>
												<td>
													<!-- 보기 -->
													<c:forEach var="e" items="${eList}">
														<c:if test="${q.questionNo == e.questionNo}">
															<div>
																<label>
																	<input type="radio" name="answer${i.index}" class="answerClass" value="${e.exampleIdx}">
																	 ${e.exampleIdx}번 ${e.exampleTitle}
																</label>
															</div>
														</c:if>
													</c:forEach>
												</td>
											</tr>
										</c:forEach>
										<tr>
											<td class="text-right">
												<h4 class="text-center mt-3 mb-2" id="msg"><strong>${err}</strong></h4>
												<button type="button" id="addPaperBtn" class="btn btn-primary">시험지 제출</button>
											</td>
										</tr>
									</table>
									
								</form>
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