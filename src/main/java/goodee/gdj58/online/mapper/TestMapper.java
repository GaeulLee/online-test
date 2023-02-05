package goodee.gdj58.online.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Test;

@Mapper
public interface TestMapper {

	// 시험 회차 삭제
	int deleteTest(int testNo);
	
	// 시험 회차 수정
	int updateTest(Test test);
	
	// 시험 회차 추가
	int insertTest(Test test);
	
	// 수정 시 불러올 시험 정보
	Test selectTestOne(int testNo);
	
	// 시험 회차 목록
	List<Test> selectTestList();
}
