package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload2.do")
@MultipartConfig(maxFileSize = 1024*1024*5)
public class UploadServlet_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			                                       throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		//String path = request.getRealPath("/upload/");
		String path = request.getSession().getServletContext().getRealPath("/upload/");
		System.out.println(path);
		
		// Part Type -> request에서 stream값을 받아주기 위한 Data Type 
		Collection<Part> p = request.getParts();
		for(Part data :p) {
			if(data.getContentType() != null) {
				String fileName = data.getSubmittedFileName();
				if(fileName != null && fileName.length() != 0) {
					data.write(path+fileName);
					out.print("<img src='./upload/"+fileName+"'>");
				}
			}
		}
		
	}

}
