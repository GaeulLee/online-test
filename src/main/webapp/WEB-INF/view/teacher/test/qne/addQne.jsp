<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addQne</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
<link href="${pageContext.request.contextPath}/Resources/vendor/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/vendor/chartist/css/chartist.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Resources/css/style.css" rel="stylesheet">
<script>
	$(document).ready(function(){
		$('#addBtn').click(function(){
			$('#addForm').submit();
		});
	});
</script>
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
	
								<h2 class="text-center mt-3 mb-4"><strong>${test.testTitle}</strong></h2>
								
								<form action="${pageContext.request.contextPath}/teacher/test/qne/addQne" method="post" id="addForm">
									<input type="hidden" name="testNo" value="${test.testNo}">
									<!-- 문제 입력 -->
									<table class="table table-borderless text-center" style="color: #3d4465; font-size: 17px;">
										<tr>
											<th>문제번호</th> <!-- db에서 testNo로 해당 시험의 questionIdx max값+1, 리스트가 비어있으면 1 -->
											<td><input type="number" name="questionIdx" id="questionIdx" value="${maxQueIdx}" readonly="readonly" class="form-control"></td>
										</tr>
										<tr>
											<th class="align-middle">문제</th>
											<td><textarea name="questionTitle" id="questionTitle" rows="5" cols="50" class="form-control"></textarea></td>
										</tr>
									</table>
									
									<!-- 보기 입력 -->
									<!-- 정답 오답 : 정답의 갯수는 1개, 오답이 4개이면 안됨 -->
									<table class="table table-borderless text-center" style="color: #3d4465; font-size: 17px;">
										<tr>
											<th>보기번호</th>
											<th>보기</th>
											<th>정답유무</th>
										</tr>
										<tr>
											<td>1번</td>
											<td><input type="text" name="exampleTitle" class="exampleTitle" class="form-control"></td>
											<td>
												<select name="exampleOx" class="form-control">
													<option value="오답">오답</option>
													<option value="정답">정답</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>2번</td>
											<td><input type="text" name="exampleTitle" class="exampleTitle" class="form-control"></td>
											<td>
												<select name="exampleOx" class="form-control">
													<option value="오답">오답</option>
													<option value="정답">정답</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>3번</td>
											<td><input type="text" name="exampleTitle" class="exampleTitle" class="form-control"></td>
											<td>
												<select name="exampleOx" class="form-control">
													<option value="오답">오답</option>
													<option value="정답">정답</option>
												</select>
											</td>
										</tr>
										<tr>
											<td>4번</td>
											<td><input type="text" name="exampleTitle" class="exampleTitle" class="form-control"></td>
											<td>
												<select name="exampleOx" class="form-control">
													<option value="오답">오답</option>
													<option value="정답">정답</option>
												</select>
											</td>
										</tr>
										<tr>
											<td colspan="3" class="text-right">
												<button type="button" id="addBtn" class="btn btn-primary btn-lg mt-2 mr-3">문제등록</button>
											</td>
										</tr>
									</table>
								</form>
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