package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TestMapper;
import goodee.gdj58.online.vo.Question;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TestService {
	@Autowired TestMapper testMapper;
	
	// ******************************* 학생
	
	// 응시한 시험 목록
	public List<Test> getStudentTestList(int studentNo) {
		return testMapper.selectStudentTestList(studentNo);
	}
	
	// 응시할 시험 불러오기
	public List<Map<String, Object>> getTestListForPaper(int testNo){
		return testMapper.selectTestListForPaper(testNo);
	}
	
	// 지난 시험
	public List<Test> getPastTestList(){
		return testMapper.selectPastTestList();
	}
	
	// 오늘 시험
	public List<Test> getCurrnetTestList(){
		return testMapper.selectCurrnetTestList();
	}
	
	// 예정 시험
	public List<Test> getFutureTestList(){
		return testMapper.selectFutureTestList();
	}
	
	
	// ******************************* 강사
	
	// 문제 등록시 불러올 시험 정보
	public List<Test> getTestListForQuestion(){
		return testMapper.selectTestListForAddQuestion();
	}
	
	
	// ******** 문제 및 보기 CRUD
	
	// 문제 삭제
	
	// 문제 수정
	
	// 문제 번호 최댓값
	public int getMaxQueIdx(int testNo) {
		return testMapper.selectMaxQueIdx(testNo);
	}
	
	
	// ******** 시험 CRUD
	
	// 시험 회차 삭제
	public int removeTest(int testNo) {
		return testMapper.deleteTest(testNo);
	}
	
	// 시험 회차 수정
	public int modifyTest(Test test) {
		return testMapper.updateTest(test);
	}
	
	// 시험 회차 추가
	public int addTest(Test test) {
		return testMapper.insertTest(test);
	}
	
	// 수정 시 불러올 시험 정보
	public Test getTestOne(int testNo) {
		return testMapper.selectTestOne(testNo);
	}
	
	// 최근 등록 시험
	public List<Test> getRecentTestList(){
		return testMapper.selectRecentTestList();
	}
	
	// 전체 시험 갯수
	public int getTestCnt(String searchWord) {
		return testMapper.selectTestCnt(searchWord);
	}
	
	// 시험 회차 목록
	public List<Test> getTestList(int rowPerPage, int currentPage, String searchWord){

		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return testMapper.selectTestList(paramMap);
	}
}
