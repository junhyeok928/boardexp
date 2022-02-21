package board.z01_util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class A01_DownLoadController {
	// view단에서 아래와 같은 형태로 파일명으로 호출하면
	// location.href="${path}/download.do?fname="+fname;
	@RequestMapping("/download.do")
	public String download(@RequestParam("fname") String fname, Model d) {
		// downloadviewer에서 사용하는 이름으로 모델 데이터를 파일명으로 설정
		// model.get("downloadfile");
		d.addAttribute("downloadfile", fname);
		
		// 스프링 container에서 선언된 view이름 호출..
		return "download";
	}
}
