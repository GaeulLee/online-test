package goodee.gdj58.online;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan // @필터, 리스너를 인식시켜 달라는 의미
public class OnlineTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineTestApplication.class, args);
	}

}
