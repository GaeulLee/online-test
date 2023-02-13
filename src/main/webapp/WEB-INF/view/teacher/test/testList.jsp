<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script>
	$(document).ready(function(){
		
		// 추가 폼 유효성
		$('#addBtn').click(function(){
			
			if($('#addTitle').val() == ''){
				alert('등록할 시험 제목을 입력해주세요.');
				return;
			}
			
			if($('#addDate').val() == ''){
				alert('등록할 시험 날짜를 선택해주세요.');
				return;
			}
			
			$('#addForm').submit();
		});
	});
</script>
<c:forEach items="${list}" varStatus="i">
	<script>
		$(document).ready(function(){
			
			// 수정 폼 유효성
			var index = '<c:out value="${i.index}"/>';
			var btnId = '#modiBtn'+index;
			var titleId = '#modiTitle'+index;
			var dateId = '#modiDate'+index;
			var formId = '#modiForm'+index;
	
			$(btnId).click(function(){
				if($(titleId).val() == ''){
					alert('수정할 시험 제목을 입력해주세요.');
					return;
				}
				if($(dateId).val() == ''){
					alert('수정할 시험 날짜를 선택해주세요.');
					return;
				}
				$(formId).submit();
			});
		});
	</script>
</c:forEach>
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
							
								<!-- 시험 추가 버튼 -->
								<div class="mx-3 mt-2" style="font-size:17px;">
									<a data-toggle="modal" href="#add"><!-- 시험등록 모달버튼 -->
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="40" height="40" fill="currentColor">
											<path d="M17,13H13V17H11V13H7V11H11V7H13V11H17M12,2A10,10 0 0,0 2,12A10,10 0 0,0 12,22A10,10 0 0,0 22,12A10,10 0 0,0 12,2Z" />
										</svg>
										새 시험 등록
									</a>
								</div>
								
								<!-- 시험 검색 폼 -->	
								<div class="text-right mb-3">
									<form action="${pageContext.request.contextPath}/teacher/test/testList" method="get">
										<input type="text" name="searchWord" placeholder="시험명 검색" class="form-control input-rounded w-20" style="display: inline;">
										<button type="submit" class="btn btn-rounded btn-primary">검색</button>	
									</form>
								</div>
								
								<!-- 시험등록 모달 컨텐츠 -->
								<div class="modal fade" id="add">
									<div class="modal-dialog modal-dialog-centered" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">시험 등록</h5>
												<button type="button" class="close" data-dismiss="modal"><span>&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<form action="${pageContext.request.contextPath}/teacher/test/addTest" method="post" id="addForm">
													<table class="table table-borderless" style="color: #3d4465; font-size: 17px;">
														<tr>
															<th class="text-center">시험 제목</th>
															<td>
																<input type="text" name="testTitle" placeholder="시험명 입력" id="addTitle" class="form-control">
															</td>
														</tr>
														<tr>
															<th class="text-center">시험 날짜</th>
															<td>
																<input type="date" name="testDate" id="addDate" class="form-control">
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
								
								<!-- 본문 -->
								<table class="table table-borderless" style="color: #3d4465; font-size: 17px;">
									<tr>
										<th class="text-center w-25">시험 날짜</th>
										<th class="text-center">시험 제목</th>
										<th class="text-center">편집</th>
									</tr>
									<c:forEach var="t" items="${list}" varStatus="i">
										<tr>
											<td class="text-center">${t.testDate}</td>
											<td>${t.testTitle}</td>
											<td class="text-center">
												<!-- Modal btn -->
												<a data-toggle="modal" href="#modify${i.index}">수정</a>
												<a data-toggle="modal" href="#remove${i.index}">삭제</a>
												
												<!-- 수정 Modal content -->
			                                    <div class="modal fade" id="modify${i.index}">
													<div class="modal-dialog modal-dialog-centered" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">시험 수정</h5>
																<button type="button" class="close" data-dismiss="modal"><span>&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<form action="${pageContext.request.contextPath}/teacher/test/modifyTest" method="post" id="modiForm${i.index}">
																	<input type="hidden" name="testNo" value="${t.testNo}">
																	<table>
																		<tr>
																			<th>시험 제목</th>
																			<td>
																				<input type="text" name="testTitle" id="modiTitle${i.index}" value="${t.testTitle}" placeholder="시험명 입력" class="form-control">
																			</td>
																		</tr>
																		<tr>
																			<th>시험 날짜</th>
																			<td>
																				<input type="date" name="testDate" id="modiDate${i.index}" value="${t.testDate}" class="form-control">
																			</td>
																		</tr>
																	</table>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-primary" id="modiBtn${i.index}">수정</button>
																	</div>
																</form>
															</div>
														</div>
													</div>
												</div>
			                                    
			                                    <!-- 삭제 Modal content -->
			                                    <div class="modal fade" id="remove${i.index}">
			                                        <div class="modal-dialog modal-dialog-centered" role="document">
			                                            <div class="modal-content">
			                                                <div class="modal-header">
			                                                    <h5 class="modal-title">시험 삭제</h5>
			                                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
			                                                    </button>
			                                                </div>
			                                                <div class="modal-body">
																정말 등록된 시험을 삭제하시겠습니까?
			                                                </div>
			                                                <div class="modal-footer">
			                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			                                                    <button type="submit" class="btn btn-primary"
			                                                    		onclick="location.href='${pageContext.request.contextPath}/teacher/test/removeTest?testNo=${t.testNo}'">삭제</button>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
			                                    
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