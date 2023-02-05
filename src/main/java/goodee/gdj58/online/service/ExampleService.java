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
	
	// 문제 보기 삭제
	public int removeExample(int exampleNo) {
		return exampleMapper.deleteExample(exampleNo);
	}
	
	// 문제 보기 수정
	public int modifyExample(Example example) {
		return exampleMapper.updateExample(example);
	}
	
	// 문제 보기 추가
	public int addExample(Example example, int questionNo) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();

		paramMap.put("exampleIdx", example.getExampleIdx());
		paramMap.put("exampleTitle", example.getExampleTitle());
		paramMap.put("exampleOx", example.getExampleOx());
		paramMap.put("questionNo", questionNo);
		
		return exampleMapper.insertExample(paramMap);
	}
	
	// 수정 시 불러올 보기
	public Example getExampleOne(int exampleNo) {
		return exampleMapper.selectExampleOne(exampleNo);
	}
	
	// 문제 보기 목록
	public List<Example> getExampleList(int questionNo){
		return exampleMapper.selectExampleList(questionNo);
	}
}
