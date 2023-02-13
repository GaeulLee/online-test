<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Teacher</title>
<link href="${pageContext.request.contextPath}/Resources/css/style.css" type="text/css" rel="stylesheet">
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
	
		<!-- empMenu include -->
		<div>
			<c:import url="/WEB-INF/view/employee/inc/empMenu.jsp"></c:import>
		</div>
		
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
								<h1>강사 추가</h1>
								<div>${errMsg}</div>
								<form action="${pageContext.request.contextPath}/employee/teacher/addTeacher" method="post" id="addForm">
									<table>
										<tr>
											<td colspan="2">
												<input type="text" id="idForCk" placeholder="사용할 아이디 입력">
												<button type="button" id="ckBtn">중복검사</button>
											</td>
										</tr>
										<tr>
											<th>이름</th>
											<td>
												<input type="text" name="teacherName" id="name" value="${userTName}">
											</td>
										</tr>
										<tr>
											<th>아이디</th>
											<td>
												<input type="text" name="teacherId" id="id" value="${userTId}" readonly="readonly">
											</td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td>
												<input type="password" name="teacherPw" id="pw" value="${userTPw}">
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<button type="button" id="addBtn">등록</button>
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
<script>
	$('#ckBtn').click(function(){
		$.ajax({
			url:'idck'
			, type:'get'
			, data : {idForCk:$('#idForCk').val()}
			, success:function(model){ // model : 'YES' / 'NO'
				if(model=='yes') {
					// 사용가능한 아이디
					$('#id').val($('#idForCk').val());
				} else {
					// 사용중인 아이디
					alert($('#idForCk').val()+'는 사용중인 아이디입니다');
				}
			}
		});
	});
	
	$('#addBtn').click(function(){
		
		// 폼 유효성 검사
		if($('#id').val() == ''){
			alert('아이디가 입력되지 않았습니다.');
			return;
		}
		if($('#name').val() == ''){
			alert('이름이 입력되지 않았습니다.');
			return;
		}
		if($('#pw').val() == ''){
			alert('비밀번호가 입력되지 않았습니다.');
			return;
		}
		
		// 폼 액션 전송
		$('#addForm').submit();
		
	});
</script>
</html>