<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teacherList</title>
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
                            
                            	<!-- 강사 추가 버튼 -->
								<div class="mx-4" style="font-size: 17px;">
									<a data-toggle="modal" href="#add"><!-- 강사등록 모달버튼 -->
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="40" height="40" fill="currentColor">
											<path d="M17,13H13V17H11V13H7V11H11V7H13V11H17M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
										</svg>
										강사 등록
									</a>
								</div>
								
								<!-- 강사 검색 폼 -->	
								<div class="text-right mb-5">
									<form action="${pageContext.request.contextPath}/employee/teacher/teacherList" method="get">
										<input type="text" name="searchWord" placeholder="이름 검색" class="form-control input-rounded w-20" style="display: inline;">
										<button type="submit" class="btn btn-rounded btn-primary">검색</button>	
									</form>
								</div>
								
								<!-- 강사등록 모달 컨텐츠 -->
								<div class="modal fade" id="add">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">강사 등록</h5>
												<button type="button" class="close" data-dismiss="modal"><span>&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="${pageContext.request.contextPath}/employee/teacher/addTeacher" method="post" id="addForm">
													<table class="table table-borderless" style="color: #3d4465; font-size: 17px;">
														<tr>
															<th>아이디 중복체크</th>
															<td>
																<input type="text" id="idForCk" placeholder="사용할 아이디 입력" class="form-control w-75" style="display: inline;">
																<button type="button" class="btn btn-primary" id="ckBtn">검사</button>
															</td>
														</tr>
														<tr>
															<th class="text-center">아이디</th>
															<td>
																<input type="text" name="teacherId" id="id" value="${userTId}" readonly="readonly" class="form-control">
															</td>
														</tr>
														<tr>
															<th class="text-center">이름</th>
															<td>
																<input type="text" name="teacherName" id="name" value="${userTName}" class="form-control">
															</td>
														</tr>
														<tr>
															<th class="text-center">비밀번호</th>
															<td>
																<input type="password" name="teacherPw" id="pw" value="${userTPw}" class="form-control">
															</td>
														</tr>
													</table>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary" id="addBtn">등록</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
		
								<table class="table table-borderless text-center mx-auto" style="color: #3d4465; font-size: 17px;">
									<tr>
										<th style="width:30%;">강사 ID</th>
										<th style="width:50%;">강사명</th>
										<th style="width:20%;">편집</th>
									</tr>
									<c:forEach var="t" items="${list}">
										<tr>
											<td>${t.teacherId}</td>
											<td>${t.teacherName}</td>
											<td>
												<!-- 모달 버튼 -->
												<a data-toggle="modal" href="#remove${i.index}">삭제</a>
												
												<!-- 삭제 Modal content -->
			                                    <div class="modal fade" id="remove${i.index}">
			                                        <div class="modal-dialog modal-dialog-centered" role="document">
			                                            <div class="modal-content">
			                                                <div class="modal-header">
			                                                    <h5 class="modal-title">강사 삭제</h5>
			                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
			                                                    </button>
			                                                </div>
			                                                <div class="modal-body">
																정말 등록된 강사를 삭제하시겠습니까?
			                                                </div>
			                                                <div class="modal-footer">
			                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			                                                    <button type="submit" class="btn btn-primary"
			                                                    		onclick="location.href='${pageContext.request.contextPath}/employee/teacher/removeTeacher?teacherNo=${t.teacherNo}'">삭제</button>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
											</td>
										</tr>
									</c:forEach>
								</table>
								
								<!-- paging -->
								<nav>
                                    <ul class="pagination pagination-circle"  style="justify-content: center;">
                                    
                                    	<!-- 화살표 -->
                                        <li class="page-item page-indicator">
                                            <c:if test="${currentPage == 1}">
												<i class="icon-arrow-left page-link"></i>
											</c:if>
											<c:if test="${currentPage > 1}">
												
												<a class="page-link" href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${currentPage-1}&searchWord=${searchWord}">
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
													<a class="page-link" href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${a.current}&searchWord=${searchWord}">${a.current}</a>
												</li>
											</c:if>
										</c:forEach>

                                        <!-- 화살표 -->
                                        <li class="page-item page-indicator">
                                            <c:if test="${currentPage == lastPage}">
												<i class="icon-arrow-right page-link"></i>
											</c:if>
                                            <c:if test="${currentPage < lastPage}">
												<a class="page-link" href="${pageContext.request.contextPath}/employee/teacher/teacherList?currentPage=${currentPage+1}&searchWord=${searchWord}">
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
		</div><!-- body -->
		
		
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