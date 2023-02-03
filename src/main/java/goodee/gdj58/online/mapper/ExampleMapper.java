package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Example;

@Mapper
public interface ExampleMapper {
	
	// 문제 보기 삭제
	int deleteExample(int exampleNo);
	
	// 문제 보기 수정
	int updateExample(Example example);
	
	// 문제 보기 추가
	int insertExample(Map<String, Object> paramMap);
	
	// 문제 보기 목록
	List<Example> selectExampleList();
}
