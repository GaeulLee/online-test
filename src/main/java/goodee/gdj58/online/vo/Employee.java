package goodee.gdj58.online.vo;

import lombok.Data;

@Data // lombok 라이브러리(어노테이션-@)를 사용하여 세터게터 외 다양한 (생성)메서드를 자동으로 만듦
public class Employee {
	private int empNo;
	private String empId;
	private String empPw;
	private String empName;
}
