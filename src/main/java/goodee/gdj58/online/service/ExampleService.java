package goodee.gdj58.online.service;

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
	
	// 문제 보기 수정
	
	// 문제 보기 추가
	public int addExample(Example example, int questionNo) {
		
		// map 반환
		
		return exampleMapper.insertExample(null);
	}
	
	// 문제 보기 목록
}
