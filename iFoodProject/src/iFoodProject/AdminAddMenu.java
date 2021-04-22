package iFoodProject;

import java.io.IOException;
import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(urlPatterns = "/adminAddMenu")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024 * 100)
public class AdminAddMenu extends HttpServlet{

//  this if directory name where the file will be uploaded and saved
  private static final String SAVE_DIR = "menuImg";
  protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
     
      try (PrintWriter out = response.getWriter()) {
    	  try {
    		  
    		  String menuname = request.getParameter("menu");
    		  String price = request.getParameter("price");
    		  String token = request.getParameter("token");
//    		  out.print(token);
    		  int tmp = Integer.parseInt(token);
    		  switch(tmp){
    		  	case 1: token = "food"; break;
    		  	case 2: token = "desert"; break;
    		  	case 3: token = "drinks"; break;
    		  	default: token = null;
    		  }
    		  String savePath = "/Users/kritikagupta/Documents/iFoodProject/iFood/iFoodProject/WebContent/static"+File.separator+SAVE_DIR;


 //            this comment will pickup the image file and have convert it into file type
    		  File fileSaveDir = new File(savePath);
    		  if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
    		  }
//          this two comment will take the name and image form web page
    		  Part part = request.getPart("file");

//          this comment will extract the file name of image
    		  String fileName = extractFileName(part);

//          this will print the image name and user provide name
    		  out.println(fileName);
    		  
              part.write(savePath + File.separator + fileName);

//              String filePath = "static/menuImg" + File.separator + fileName;
              Connection conn =  DbConnection.getDbConnection("mysql");
              Boolean status = UsersTable.addMenu(menuname,price,token, fileName, conn);
              if(status) {
            	  request.getSession().setAttribute("msg" , "New menu added successfuly.");						
            	  response.sendRedirect("adminAddMenu.jsp");
            	  
              }
    	  		}catch (Exception ex) {
    	  		out.println("error" + ex);
          }
    	  
    	  
      }
      }
//the extractFileName() is method used to extract the file name
  private String extractFileName(Part part) {
	  String contentDisp = part.getHeader("content-disposition");
	  String[] items = contentDisp.split(";");
	  for (String s : items) {
		  if (s.trim().startsWith("filename")) {
			  return s.substring(s.indexOf("=") + 2, s.length() - 1);
		  }
	  }
	  return "";
}

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	  processRequest(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	  processRequest(request, response);
  }
}
