<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Index</title>
<link href="${pageContext.request.contextPath}/Resources/css/style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		// 선생 로그인 유효성 검사
		$('#tB').click(function(){
			if($('#tId').val() == ''){
				alert('아이디를 입력하세요.');
				return;
			}
			if($('#tPw').val() == ''){
				alert('비밀번호를 입력하세요.');
				return;
			}
			$('#tF').submit();
		});
		
		// 학생 로그인 유효성 검사
		$('#sB').click(function(){
			if($('#sId').val() == ''){
				alert('아이디를 입력하세요.');
				return;
			}
			if($('#sPw').val() == ''){
				alert('비밀번호를 입력하세요.');
				return;
			}
			$('#sF').submit();
		});
		
		// 강사 로그인 유효성 검사
		$('#eB').click(function(){
			if($('#eId').val() == ''){
				alert('아이디를 입력하세요.');
				return;
			}
			if($('#ePw').val() == ''){
				alert('비밀번호를 입력하세요.');
				return;
			}
			$('#eF').submit();
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
<body class="h-100">
    <div class="authincation h-100">
        <div class="container-fluid h-100">
            <div class="row justify-content-center h-100 align-items-center">
                <div class="col-md-5">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-xl-12">

						    <div class="card">
						    	<!-- card-title -->
						        <h2 class="text-center mb-2 mt-5">ONLINE TEST</h2>

						        <label class="text-center"><strong>${teacherErrMsg}</strong></label>
						        <label class="text-center"><strong>${studentErrMsg}</strong></label>
						        <label class="text-center"><strong>${empErrMsg}</strong></label>
						        
						        <div class="card-body w-75 mx-auto">
						        	<!-- 상단 탭 -->
						            <ul class="nav nav-pills mb-4" style="justify-content: center;">
						                <li class=" nav-item">
						                    <a href="#navpills-1" class="nav-link" data-toggle="tab" aria-expanded="false" style="border-radius: 5px;">Teacher</a>
						                </li>
						                <li class="nav-item">
						                    <a href="#navpills-2" class="nav-link active" data-toggle="tab" aria-expanded="false" style="border-radius: 5px;">Student</a>
						                </li>
						                <li class="nav-item">
						                    <a href="#navpills-3" class="nav-link" data-toggle="tab" aria-expanded="false" style="border-radius: 5px;">Employee</a>
						                </li>
						            </ul>
						            
						            <div class="tab-content">
						            	<!-- 첫번째 탭 -->
						                <div id="navpills-1" class="tab-pane">
						                    <div class="auth-form pt-2">
						                        <!-- 강사 로그인 -->
												<form action="${pageContext.request.contextPath}/loginTeacher" method="post" id="tF">
													<div class="form-group">
														<label><strong>TEACHER ID</strong></label>
														<input type="text" name="teacherId" id="tId" class="form-control" value="teacher">
													</div>
													<div class="form-group">
														<label><strong>PASSWORD</strong></label>
														<input type="password" name="teacherPw" id="tPw" class="form-control" value="1234">
													</div>
													<div class="text-center pt-2">
														<button type="button" id="tB" class="btn btn-primary btn-block">LOGIN</button>
													</div>
												</form>
						                    </div>
						                </div>
						                
						                <!-- 두번째 탭 -->
						                <div id="navpills-2" class="tab-pane active">
						                    <div class="auth-form pt-2">
						                    	<!-- 학생 로그인 -->
												<form action="${pageContext.request.contextPath}/loginStudent" method="post" id="sF">
													<div class="form-group">
														<label><strong>STUDENT ID</strong></label>
														<input type="text" name="studentId" id="sId" class="form-control" value="student">
													</div>
													<div class="form-group">
														<label><strong>PASSWORD</strong></label>
														<input type="password" name="studentPw" id="sPw" class="form-control" value="1234">
													</div>
													<div class="text-center pt-2">
														<button type="button" id="sB" class="btn btn-primary btn-block">LOGIN</button>
													</div>
												</form>
						                    </div>
						                </div>
						                
						                <!-- 세번째 탭 -->
						                <div id="navpills-3" class="tab-pane">
						                    <div class="auth-form pt-2">
						                        <!-- 사원 로그인 -->
												<form action="${pageContext.request.contextPath}/loginEmp" method="post" id="eF">
													<div class="form-group">
														<label><strong>EMPLOYEE ID</strong></label>
														<input type="text" name="empId" id="eId" class="form-control" value="admin">
													</div>
													<div class="form-group">
														<label><strong>PASSWORD</strong></label>
														<input type="password" name="empPw" id="ePw" class="form-control" value="1234">
													</div>
													<div class="text-center pt-2">
														<button type="button" id="eB" class="btn btn-primary btn-block">LOGIN</button>
													</div>
												</form>
						                    </div>
						                </div>
						                
						            </div>
						        </div>
						    </div>
						    
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	
<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<script src="${pageContext.request.contextPath}/Resources/vendor/global/global.min.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/quixnav-init.js"></script>
<script src="${pageContext.request.contextPath}/Resources/js/custom.min.js"></script>
</body>
</html>