package board.z01_util;

import java.util.TimeZone;

import org.springframework.stereotype.Controller;

@Controller
public class GmtController {
	public GmtController() {
		// aws에서 jdbc접속시  gmt 시간 설정이 되어야 처리되기에 컨테이너
		// 메모리에 로딩.
		TimeZone tz=TimeZone.getTimeZone("Asia/Seouls");
		TimeZone.setDefault(tz);
	}
}
