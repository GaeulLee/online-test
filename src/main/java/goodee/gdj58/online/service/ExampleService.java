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
	
	// 전체 보기 갯수
	public int getExampleCnt(String searchWord) {
		return exampleMapper.selectExampleCnt(searchWord);
	}
	
	// 전체 문제 보기 목록
	public List<Map<String, Object>> getExampleListAll(int rowPerPage, int currentPage, String searchWord){
		
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return exampleMapper.selectExampleListAll(paramMap);
	}
	
	// 문제 보기 목록
	public List<Example> getExampleList(int questionNo){
		return exampleMapper.selectExampleList(questionNo);
	}
}
