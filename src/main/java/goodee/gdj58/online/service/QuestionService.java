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
	
	// 시험 문제 삭제
	
	// 시험 문제 수정
	
	// 시험 문제 추가
	public int addQuestion(Question question, int testNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("question", question);
		paramMap.put("testNo", testNo);
		
		return questionMapper.insertQuestion(paramMap);
	}
	
	// 시험 문제 목록
	public List<Question> getQuestionList(int testNo){
		return questionMapper.selectTestList(testNo);
	}
}
