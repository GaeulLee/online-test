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
	public int removeTest(int testNo) {
		return testMapper.deleteTest(testNo);
	}
	
	// 시험 회차 수정
	public int modifyTest(Test test) {
		return testMapper.updateTest(test);
	}
	
	// 시험 회차 추가
	public int addTest(Test test) {
		return testMapper.insertTest(test);
	}
	
	// 수정 시 불러올 시험 정보
	public Test getTestOne(int testNo) {
		return testMapper.selectTestOne(testNo);
	}
	
	// 시험 회차 목록
	public List<Test> getTestList(){
		return testMapper.selectTestList();
	}
}
