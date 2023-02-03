package goodee.gdj58.online.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.TestMapper;
import goodee.gdj58.online.vo.Test;

@Service
@Transactional
public class TestService {
	@Autowired TestMapper testMapper;
	
	// 시험 회차 삭제
	
	// 시험 회차 수정
	
	// 시험 회차 추가
	public int addTest(Test test) {
		return testMapper.insertTest(test);
	}
	
	// 시험 회차 목록
	public List<Test> getTestList(){
		return testMapper.selectTestList();
	}
}
