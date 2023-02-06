package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;
import goodee.gdj58.online.vo.Question;

@Mapper
public interface QuestionMapper {

	// 응시 시험 문제 출력
	List<Map<String, Object>> selectQuestionByTestNo(int testNo);
	
	// 보기 등록시 불러올 문제 목록
	List<Map<String, Object>> selectQuestionListForAddExample();
	
	// 시험 문제 삭제
	int deleteQuestion(int questionNo);
	
	// 시험 문제 수정
	int updateQuestion(Question question);
	
	// 시험 문제 추가
	int insertQuestion(Map<String, Object> paramMap);
	
	// 수정 시 불러올 보기
	Question selectQuestionOne(int questionNo);
	
	// 최근 시험 문제
	List<Question> selectRecentQuestionList();
	
	// 전체 문제 개수
	int selectQuestionCnt(String searchWord);
	
	// 전체 시험 문제 목록
	List<Map<String, Object>> selectQuestionListAll(Map<String, Object> paramMap);
	
	// 시험 문제 목록
	List<Question> selectQuestionList(int testNo);
}
