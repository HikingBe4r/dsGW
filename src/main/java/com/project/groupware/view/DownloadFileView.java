package com.project.groupware.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

// 파일 다운로드 뷰
public class DownloadFileView extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		/*String originalFileName = (String) model.get("originalFileName");
		String systemFileName = (String) model.get("systemFileName");

		response.setContentType("application/octet-stream");
		originalFileName = URLEncoder.encode(originalFileName, "utf-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\";");

		FileInputStream fis = null;
		ServletOutputStream sos = null;

		try {
			fis = new FileInputStream(UploadFileUtils.UPLOAD_PATH + File.separator + systemFileName);
			sos = response.getOutputStream();
			
			FileCopyUtils.copy(fis, sos);
			
		} catch (Exception e) {
			
		} finally {
			if(fis != null) fis.close();
			if(sos != null) sos.close();
		}*/
	}
}
