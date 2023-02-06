package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.QuestionMapper;
import goodee.gdj58.online.vo.Question;

@Service
@Transactional
public class QuestionService {
	@Autowired QuestionMapper questionMapper;
	
	// 보기 등록시 불러올 문제 정보
	public List<Map<String, Object>> getQuestionListForAddExample(){
		return questionMapper.selectQuestionListForAddExample();
	}
	
	// 시험 문제 삭제
	public int removeQuestion(int questionNo) {
		return questionMapper.deleteQuestion(questionNo);
	}
	
	// 시험 문제 수정
	public int modifyQuestion(Question question) {
		return questionMapper.updateQuestion(question);
	}
	
	// 시험 문제 추가
	public int addQuestion(Question question, int testNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("questionIdx", question.getQuestionIdx());
		paramMap.put("questionTitle", question.getQuestionTitle());
		paramMap.put("testNo", testNo);
		
		return questionMapper.insertQuestion(paramMap);
	}
	
	// 수정 시 불러올 시험 문제
	public Question getQuestionOne(int questionNo) {
		return questionMapper.selectQuestionOne(questionNo);
	}
	
	// 최근 시험 문제
	public List<Question> getRecentQuestionList(){
		return questionMapper.selectRecentQuestionList();
	}
	
	// 전체 문제 갯수
	public int getQuestionCnt(String searchWord) {
		return questionMapper.selectQuestionCnt(searchWord);
	}
	
	// 전체 시험 문제 목록
	public List<Map<String, Object>> getQuestionListAll(int rowPerPage, int currentPage, String searchWord){
		
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return questionMapper.selectQuestionListAll(paramMap);
	}
	
	// 시험 문제 목록
	public List<Question> getQuestionList(int testNo){
		return questionMapper.selectQuestionList(testNo);
	}
}
