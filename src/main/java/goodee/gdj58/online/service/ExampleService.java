package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.ExampleMapper;
import goodee.gdj58.online.vo.Example;

@Service
@Transactional
public class ExampleService {
	@Autowired ExampleMapper exampleMapper;
	
	// 오답인 문제 보기 출력
	public List<Example> getWrongExampleList(int testNo, int studentNo){
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("testNo", testNo);
		paramMap.put("studentNo", studentNo);
		
		return exampleMapper.selectWrongExampleList(paramMap);
	}
	
	// 응시할 시험 보기 출력
	public List<Map<String, Object>> getExampleByTestNo(int testNo){
		return exampleMapper.selectExampleByTestNo(testNo);
	}
	
	// 문제 보기 삭제
	public int removeExample(int questionNo) {
		return exampleMapper.deleteExample(questionNo);
	}
	
	// 문제 보기 수정
	public int modifyExample(Example example) {
		return exampleMapper.updateExample(example);
	}
	
	// 문제 보기 추가
	public int addExample(Example example) {
		return exampleMapper.insertExample(example);
	}
	
	// 문제 보기 목록
	public List<Example> getExampleList(int questionNo){
		return exampleMapper.selectExampleList(questionNo);
	}
}
