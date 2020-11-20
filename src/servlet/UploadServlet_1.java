package servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload1.do")
@MultipartConfig(location = "C:/develope/upload",maxFileSize = 1024*1024*5)
public class UploadServlet_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			                                       throws ServletException, IOException {
		
		String fileName = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		Collection<Part> p = request.getParts();
		for(Part data :p) {
			if(data.getContentType() != null) {
				fileName = data.getSubmittedFileName();
				if(fileName != null && fileName.length() != 0) {
					data.write(fileName);
				}
			}
		}
		
	}

}
