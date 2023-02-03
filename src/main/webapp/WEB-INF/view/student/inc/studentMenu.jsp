<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div>
	<a href="${pageContext.request.contextPath}/studentHome">홈</a>
	
	<!-- 오늘날짜를 기준으로 시험 참여 가능 여부 분기 -->
	<!--
		지나간 시험(table : test) 리스트 + 점수 -> 점수 확인버튼 -> 제출 답안지 확인(O/X)(table : paper)
			+ 이번 시험 회차의 평균 점수, 응시자 수, 내 등수 등등 추가 정보
		오늘 날짜 시험 리스트는 응시버튼 -> 시험지 출력(table : question(문제) JOIN example(보기)) -> 답안 제출(table : paper)
		누가 몇회의 어떤 시험의 여러 문제의 답
	-->
	<a href="${pageContext.request.contextPath}/student/studentTestList">로그아웃</a>
	
	<a href="${pageContext.request.contextPath}/student/modifystudentPw">비밀번호 변경</a> <!-- 비빌번호 수정 -->
	<a href="${pageContext.request.contextPath}/student/logout">로그아웃</a>
</div>
