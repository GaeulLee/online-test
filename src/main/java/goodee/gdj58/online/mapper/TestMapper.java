package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {
	
	// 응시할 시험 불러오기
	List<Map<String, Object>> selectTestListForPaper(int testNo);
	
	// 지난 시험
	List<Test> selectPastTestList();
	
	// 오늘 시험
	List<Test> selectCurrnetTestList();
	
	// 예정 시험
	List<Test> selectFutureTestList();
	
	// 문제 등록시 불러올 시험 정보
	List<Test> selectTestListForAddQuestion();
	
	// 시험 회차 삭제
	int deleteTest(int testNo);
	
	// 시험 회차 수정
	int updateTest(Test test);
	
	// 시험 회차 추가
	int insertTest(Test test);
	
	// 수정 시 불러올 시험 정보
	Test selectTestOne(int testNo);
	
	// 전체 시험 개수
	int selectTestCnt(String searchWord);
	
	// 최근 등록 시험
	List<Test> selectRecentTestList();
	
	// 시험 회차 목록
	List<Test> selectTestList(Map<String, Object> paramMap);
}
