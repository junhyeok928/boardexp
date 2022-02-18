package board.z01_util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadViewer extends AbstractView {

	// 다운로드할 파일 위치 지정(공통 설정파일에서 호출) src\main\java\resource\config
	@Value("${upload}")
	private String upload;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
				HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 1. 서버에서 가지고 있는 파일 객체 만들기..
		//   	1) 파일 다운로드 컨트롤러에 넘겨온 파일이름을 모델명으로 설정하여 전달해온 파일명 가져오기
		//         d.addAttribute("downloadfile", 파일명);
		String fname = (String)model.get("downloadfile");
		//		2) 경로와 파일명을 기준으로 파일객체를 생성할 수 있다.
		File file = new File(upload+fname);
		System.out.println("# file viewer를 통한 다운로드할 파일 정보 #");
		System.out.println("파일정보:"+file.getPath());
		System.out.println("파일크기:"+file.length());
		
		// 2. response객체를 통해 파일 client에 전달하기
//				1) 파일 다운을 처리하기 위한 contentType 지정..
		response.setContentType("application/download; charset=UTF-8");
//				2) 파일의 크기
		response.setContentLength((int)file.length()); // long 타입이기에 int형으로 변환
//				3) 파일명이 한글일 때를 대비하여 변환하고, +(공백 encoding)은 " "으로 대체 처리.
		fname = URLEncoder.encode(fname, "utf-8").replaceAll("\\+", " ");
//				4) response의 header 정보에 파일명과 전송시 encoding형식을 binary로 설정.
		// filename="파일명"
		response.setHeader("Content-Disposition", "attachment;filename=\""+fname+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
//			3. File을 읽어와서 response의 OutputStream으로 전달.
		FileInputStream fis = new FileInputStream(file); // 서버에 있는 파일을 stream으로 읽어와서
		OutputStream out = response.getOutputStream(); // 네트워크로 전달 가능하게 response의 outputstream 객체 활용
//				FileInputStream을 통해 파일객체를 읽어온 것을 OutputStream에 복사하여 처리.
		FileCopyUtils.copy(fis, out);	// 
//			4. flush 처리:  전송 후, 남아 있는 메모리 비우기..
		out.flush();
		
		

	}

}
