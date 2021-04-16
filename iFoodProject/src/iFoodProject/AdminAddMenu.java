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
    		  	case 3: token = "drink"; break;
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
    		  
          
          /*if you may have more than one files with same name then you can calculate 
          some random characters and append that characters in fileName so that it will 
          make your each image name identical.*/
              part.write(savePath + File.separator + fileName);
 /*  You need this loop if you submitted more than one file
                        for (Part part : request.getParts()) {
                        String fileName = extractFileName(part);
                        part.write(savePath + File.separator + fileName);
         }*/
//              String filePath = "static/menuImg" + File.separator + fileName;
              Connection conn =  DbConnection.getDbConnection("mysql");
              Boolean status = UsersTable.addMenu(menuname,price,token, fileName, conn);
              if(status) {
            	  response.sendRedirect("admin/addmenu.jsp");
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


//	private static final int BUFFER_SIZE = 4096;
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//            //get values of text fields
//            String name = request.getParameter("menu");
//            String price = request.getParameter("price");
//            String token = request.getParameter("token");
//            
//            InputStream inputStream = null; // input stream of the upload file
//            // obtains the upload file part in this multipart request
//            
//            Part filePart = request.getPart("photo");
//            if (filePart != null) {
//                // prints out some information for debugging
//                System.out.println(filePart.getName());
//                System.out.println(filePart.getSize());
//                System.out.println(filePart.getContentType());
//
//                //obtains input stream of the upload file
//                //the InputStream will point to a stream that contains
//                //the contents of the file
//                inputStream = filePart.getInputStream();
//            }
//            
//            Connection conn = null; // connection to the database
//            String message = null; // message will be sent back to client
//            try {
//                // connects to the database
//                conn = DbConnection.getDbConnection("mysql");
//                Boolean status = UsersTable.addMenu(name,price,token,inputStream, conn);
////                // constructs SQL statement
////                String sql = "INSERT INTO contacts (first_name, last_name, photo) values (?, ?, ?)";
////                //Using a PreparedStatement to save the file
////                PreparedStatement pstmtSave = conn.prepareStatement(sql);
////                pstmtSave.setString(1, firstName);
////                pstmtSave.setString(2, lastName);
////
////                if (inputStream != null) {
////                    //files are treated as BLOB objects in database
////                    //here we're letting the JDBC driver
////                    //create a blob object based on the
////                    //input stream that contains the data of the file
////                    pstmtSave.setBlob(3, inputStream);
////                }
////                //sends the statement to the database server
////                int row = pstmtSave.executeUpdate();
////                if (row > 0) {
////                    message = "File uploaded and saved into database";
////                }
//                
//                if(status) {
//                	String filepath = "D:/Dev/JavaWorkSpaceNew/FileUploadDatabase/WebContent/FromDb.jpg";
//                //Obtaining the file from database
//                //Using a second statement
//                String sql1 = "SELECT photo FROM contacts WHERE first_name=? AND last_name=?";
//                PreparedStatement pstmtSelect = conn.prepareStatement(sql1);
//                pstmtSelect.setString(1, firstName);
//                pstmtSelect.setString(2, lastName);
//                ResultSet result = pstmtSelect.executeQuery();
//                if (result.next()) {
//                    Blob blob = result.getBlob("photo");
//                    InputStream inputStream1 = blob.getBinaryStream();
//                    OutputStream outputStream = new FileOutputStream(filepath);
//                    int bytesRead = -1;
//                    byte[] buffer = new byte[BUFFER_SIZE];
//                    while ((bytesRead = inputStream1.read(buffer)) != -1) {
//                        outputStream.write(buffer, 0, bytesRead);
//                    }
//                    inputStream1.close();
//                    outputStream.close();
//                    System.out.println("File saved");
//                }
//            } catch (SQLException ex) {
//                message = "ERROR: " + ex.getMessage();
//                ex.printStackTrace();
//            } finally {
//                if (conn != null) {
//                    // closes the database connection
//                    try {
//                        conn.close();
//                    } catch (SQLException ex) {
//                        //silent
//                    }
//                }
//                // sets the message in request scope
//                request.setAttribute("message", message);
//
//                // forwards to the message page
//                getServletContext().getRequestDispatcher("/Message.jsp")
//                    .include(request, response);
//            }
//        }
//    }
