<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyQne</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<link href="${pageContext.request.contextPath}/Resources/vendor/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/vendor/chartist/css/chartist.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/css/style.css" rel="stylesheet">
<script>
	$(document).ready(function(){
		
		$('#modiBtn').click(function(){
			// 1) 문제 유효성
			if($('#questionTitle').val() == ''){
				alert('문제를 입력하세요.');
				return;
			}
			
			// 2) 보기 유효성
			// 2-1) input text
			if($('#eT1').val() == '' || $('#eT2').val() == '' || $('#eT3').val() == '' || $('#eT4').val() == ''){
				alert('보기를 입력하세요.');
				return;
			}
			
			// 2-2) input select
			// 전체가 오답이면 안됨
			if($('#eO1').val() == '오답' && $('#eO2').val() == '오답' && $('#eO3').val() == '오답' && $('#eO4').val() == '오답'){
				alert('하나의 정답을 선택하세요.');
				return;
			}
			
			// 정답은 하나여야만 됨
			var cnt = 0;
			var ox = [];
			ox[0] = $('#eO1 option:selected').val();
			ox[1] = $('#eO2 option:selected').val();
			ox[2] = $('#eO3 option:selected').val();
			ox[3] = $('#eO4 option:selected').val();
			console.log(ox[0]);
			
			for(let i=0; i<4; i++){
				if(ox[i] == '정답'){
					cnt++;
				}
			}
			console.log('cnt---->'+cnt);
			
			if(cnt > 1){
				alert('정답은 하나만 선택가능합니다.');
				return;
			}
			
			// 폼 전송
			$('#modiForm').submit();
		});
	});
</script>
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
		
		<!-- body -->
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h2 class="text-center mt-3 mb-4"><strong>${test.testTitle} 문제 수정</strong></h2>
								<form action="${pageContext.request.contextPath}/teacher/test/qne/modifyQne" method="post" id="modiForm">
									<input type="hidden" name="testNo" value="${test.testNo}">
									<input type="hidden" name="questionNo" value="${question.questionNo}">
									
									<!-- 문제 입력 -->
									<table class="table text-center" style="color: #3d4465; font-size: 17px;">
										<tr>
											<th>문제번호</th>
											<td><input type="number" name="questionIdx" id="questionIdx" value="${question.questionIdx}" readonly="readonly" class="form-control w-25"></td>
										</tr>
										<tr>
											<th class="align-middle">문제</th>
											<td><textarea name="questionTitle" id="questionTitle" rows="5" cols="50" class="form-control">${question.questionTitle}</textarea></td>
										</tr>
									</table>
									
									<!-- 보기 입력 -->
									<!-- 정답 오답 : 정답의 갯수는 1개, 오답이 4개이면 안됨 -->
									<table class="table text-center" style="color: #3d4465; font-size: 17px;">
										<tr>
											<th>보기번호</th>
											<th>보기</th>
											<th>정답유무</th>
										</tr>
										<tr>
											<td>1번</td>
											<td><input type="text" name="exampleTitle" value="${eList.get(0).exampleTitle}" id="eT1" class="form-control"></td>
											<td>
												<c:if test="${eList.get(0).exampleOx == '정답'}">
													<select name="exampleOx" class="form-control" id="eO1">
														<option value="오답">오답</option>
														<option value="정답" selected>정답</option>
													</select>
												</c:if>
												<c:if test="${eList.get(0).exampleOx == '오답'}">
													<select name="exampleOx" class="form-control" id="eO1">
														<option value="오답" selected>오답</option>
														<option value="정답">정답</option>
													</select>
												</c:if>
											</td>
										</tr>
										<tr>
											<td>2번</td>
											<td><input type="text" name="exampleTitle" value="${eList.get(1).exampleTitle}" id="eT2" class="form-control"></td>
											<td>
												<c:if test="${eList.get(1).exampleOx == '정답'}">
													<select name="exampleOx" class="form-control" id="eO2">
														<option value="오답">오답</option>
														<option value="정답" selected>정답</option>
													</select>
												</c:if>
												<c:if test="${eList.get(1).exampleOx == '오답'}">
													<select name="exampleOx" class="form-control" id="eO2">
														<option value="오답" selected>오답</option>
														<option value="정답">정답</option>
													</select>
												</c:if>
											</td>
										</tr>
										<tr>
											<td>3번</td>
											<td><input type="text" name="exampleTitle" value="${eList.get(2).exampleTitle}" id="eT3" class="form-control"></td>
											<td>
												<c:if test="${eList.get(2).exampleOx == '정답'}">
													<select name="exampleOx" class="form-control" id="eO3">
														<option value="오답">오답</option>
														<option value="정답" selected>정답</option>
													</select>
												</c:if>
												<c:if test="${eList.get(2).exampleOx == '오답'}">
													<select name="exampleOx" class="form-control" id="eO3">
														<option value="오답" selected>오답</option>
														<option value="정답">정답</option>
													</select>
												</c:if>
											</td>
										</tr>
										<tr>
											<td>4번</td>
											<td><input type="text" name="exampleTitle" value="${eList.get(3).exampleTitle}" id="eT4" class="form-control"></td>
											<td>
												<c:if test="${eList.get(3).exampleOx == '정답'}">
													<select name="exampleOx" class="form-control" id="eO4">
														<option value="오답">오답</option>
														<option value="정답" selected>정답</option>
													</select>
												</c:if>
												<c:if test="${eList.get(3).exampleOx == '오답'}">
													<select name="exampleOx" class="form-control" id="eO4">
														<option value="오답" selected>오답</option>
														<option value="정답">정답</option>
													</select>
												</c:if>
											</td>
										</tr>
										<tr>
											<td colspan="3" class="text-right">
												<button type="button" id="modiBtn" class="btn btn-primary btn-lg mt-2 mr-3">문제수정</button>
											</td>
										</tr>
									</table>
								</form>
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