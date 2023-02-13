<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentHome</title>
<title>empHome</title>
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
				<!-- 달력 -->
				<div class="row">
					<div class="col-lg-12">
                        <div class="card">
                            <div class="card-body w-50 mx-auto">
                                <div class="year-calendar">
                                <div class="pignose-calendar pignose-calendar-blue pignose-calendar-default">                                    <div class="pignose-calendar-top">                                      <a href="#" class="pignose-calendar-top-nav pignose-calendar-top-prev">                                          <span class="icon-arrow-left pignose-calendar-top-icon"></span>                                      </a>                                      <div class="pignose-calendar-top-date">                                          <span class="pignose-calendar-top-month">February</span>                                          <span class="pignose-calendar-top-year">2023</span>                                      </div>                                      <a href="#" class="pignose-calendar-top-nav pignose-calendar-top-next">                                          <span class="icon-arrow-right pignose-calendar-top-icon"></span>                                      </a>                                    </div>                                    <div class="pignose-calendar-header"><div class="pignose-calendar-week pignose-calendar-week-sun">SUN</div><div class="pignose-calendar-week pignose-calendar-week-mon">MON</div><div class="pignose-calendar-week pignose-calendar-week-tue">TUE</div><div class="pignose-calendar-week pignose-calendar-week-wed">WED</div><div class="pignose-calendar-week pignose-calendar-week-thu">THU</div><div class="pignose-calendar-week pignose-calendar-week-fri">FRI</div><div class="pignose-calendar-week pignose-calendar-week-sat">SAT</div></div>                                    <div class="pignose-calendar-body"><div class="pignose-calendar-row"><div class="pignose-calendar-unit pignose-calendar-unit-sun"></div><div class="pignose-calendar-unit pignose-calendar-unit-mon"></div><div class="pignose-calendar-unit pignose-calendar-unit-tue"></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2023-02-01"><a href="#">1</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2023-02-02"><a href="#">2</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri" data-date="2023-02-03"><a href="#">3</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2023-02-04"><a href="#">4</a></div></div><div class="pignose-calendar-row"><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2023-02-05"><a href="#">5</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon" data-date="2023-02-06"><a href="#">6</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2023-02-07"><a href="#">7</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2023-02-08"><a href="#">8</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2023-02-09"><a href="#">9</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri pignose-calendar-unit-active pignose-calendar-unit-first-active" data-date="2023-02-10"><a href="#">10</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2023-02-11"><a href="#">11</a></div></div><div class="pignose-calendar-row"><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2023-02-12"><a href="#">12</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon" data-date="2023-02-13"><a href="#">13</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2023-02-14"><a href="#">14</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2023-02-15"><a href="#">15</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2023-02-16"><a href="#">16</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri" data-date="2023-02-17"><a href="#">17</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2023-02-18"><a href="#">18</a></div></div><div class="pignose-calendar-row"><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2023-02-19"><a href="#">19</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon" data-date="2023-02-20"><a href="#">20</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2023-02-21"><a href="#">21</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-wed" data-date="2023-02-22"><a href="#">22</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-thu" data-date="2023-02-23"><a href="#">23</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-fri" data-date="2023-02-24"><a href="#">24</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sat" data-date="2023-02-25"><a href="#">25</a></div></div><div class="pignose-calendar-row"><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-sun" data-date="2023-02-26"><a href="#">26</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-mon" data-date="2023-02-27"><a href="#">27</a></div><div class="pignose-calendar-unit pignose-calendar-unit-date pignose-calendar-unit-tue" data-date="2023-02-28"><a href="#">28</a></div><div class="pignose-calendar-unit pignose-calendar-unit-wed"></div><div class="pignose-calendar-unit pignose-calendar-unit-thu"></div><div class="pignose-calendar-unit pignose-calendar-unit-fri"></div><div class="pignose-calendar-unit pignose-calendar-unit-sat"></div></div></div>                                  </div></div>
                            </div>
                        </div>
                    </div>
				</div>
				<!-- 시험 목록 -->
				<div class="row">
					<!-- 지난 시험 -->
					<div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
								<h3 class="text-center mt-3 mb-4"><strong>지난 시험</strong></h3>
								<table class="table" style="color: #3d4465; font-size: 17px;">
									<tr>
										<th class="text-center">시험일정</th>
										<th colspan="2" class="text-center">시험명</th>
									</tr>
									<c:if test="${empty pastTList}">
										<tr>
											<td colspan="3" class="text-center">지난 시험이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${pastTList != null}">
										<c:forEach var="ct" items="${pastTList}">
											<tr>
												<td class="text-center">${ct.testDate}</td>
												<td colspan="2">${ct.testTitle}</td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
							</div><!-- card-body end -->
						</div>
					</div>
					<!-- 오늘 시험 -->
					<div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                            	<h3 class="text-center mt-3 mb-4"><strong>오늘 볼 시험</strong></h3>
								<table class="table" style="color: #3d4465; font-size: 17px;">
									<tr>
										<th class="text-center">시험일정</th>
										<th colspan="2" class="text-center">시험명</th>
									</tr>
									<c:if test="${empty currentTList}">
										<tr>
											<td colspan="3" class="text-center">오늘 볼 시험이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${currentTList != null}">
										<c:forEach var="ct" items="${currentTList}">
											<tr>
												<td class="text-center">${ct.testDate}</td>
												<td>${ct.testTitle}</td>
												<td>
													<a href="${pageContext.request.contextPath}/student/addPaper?testNo=${ct.testNo}">응시하기</a>
												</td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
                            </div>
                        </div>
                    </div>
                    <!-- 예정 시험 -->
                    <div class="col-lg-3">
                        <div class="card">
                            <div class="card-body">
                            	<h3 class="text-center mt-3 mb-4"><strong>예정 시험</strong></h3>
								<table class="table" style="color: #3d4465; font-size: 17px;">
									<tr>
										<th class="text-center">시험일정</th>
										<th colspan="2" class="text-center">시험명</th>
									</tr>
									<c:if test="${empty futureTList}">
										<tr>
											<td colspan="3" class="text-center">예정된 시험이 없습니다.</td>
										</tr>
									</c:if>
									<c:if test="${futureTList != null}">
										<c:forEach var="ft" items="${futureTList}">
											<tr>
												<td class="text-center">${ft.testDate}</td>
												<td colspan="2">${ft.testTitle}</td>
											</tr>
										</c:forEach>
									</c:if>
								</table>
                            </div>
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