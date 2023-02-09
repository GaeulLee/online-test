package goodee.gdj58.online.service;

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
	
	// 응시 시험 문제 출력
	public List<Map<String, Object>> getQuestionByTestNo(int testNo){
		return questionMapper.selectQuestionByTestNo(testNo);
	}
	
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
	public int addQuestion(Question question) {	
		return questionMapper.insertQuestion(question);
	}
	
	// 수정 시 불러올 시험 문제
	public Question getQuestionOne(int questionNo) {
		return questionMapper.selectQuestionOne(questionNo);
	}
	
	// 최근 시험 문제
	public List<Question> getRecentQuestionList(){
		return questionMapper.selectRecentQuestionList();
	}
	
	// 문제 목록
	public List<Question> getQuestionList(int testNo){
		return questionMapper.selectQuestionList(testNo);
	}
}
