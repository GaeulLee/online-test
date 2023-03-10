package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;

@Mapper
public interface ExampleMapper {
	
	// 오답인 문제 보기 출력
	List<Example> selectWrongExampleList(Map<String, Object> paramMap);
	
	// 응시할 시험 보기 출력
	List<Map<String, Object>> selectExampleByTestNo(int testNo);
	
	// 문제 보기 삭제
	int deleteExample(int questionNo);
	
	// 문제 보기 수정
	int updateExample(Example example);
	
	// 문제 보기 추가
	int insertExample(Example example);
	
	// 문제 보기 목록
	List<Example> selectExampleList(int questionNo);
}
