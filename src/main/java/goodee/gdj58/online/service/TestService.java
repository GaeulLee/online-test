package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TestMapper;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TestService {
	@Autowired TestMapper testMapper;
	
	// 문제 등록시 불러올 시험 정보
	public List<Test> getTestListForQuestion(){
		return testMapper.selectTestListForAddQuestion();
	}
	
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