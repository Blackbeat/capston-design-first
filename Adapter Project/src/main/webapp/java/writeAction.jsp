<%@page import="java.io.PrintWriter" %>
<%@page import="com.jsp.db.JAVABBSDAO" %>
<%@page import="com.jsp.db.BBS" %>
<%@page import="com.jsp.file.JavaBBSFileDao" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java 게시판 글쓰기</title>
</head>
<body>
<%

		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		JAVABBSDAO bbsDAO = new JAVABBSDAO();
		BBS bbs = new BBS();
		bbs.setBbsID(bbsDAO.getNext());
		int bbsID = bbs.getBbsID();
		String directory = "C:/Users/lily5/OneDrive/Document/eclipse-workspace/Adapter Project/Adapter Project/src/main/webapp/upload/JavaBBS";
		File targetDir = new File(directory);
		if(!targetDir.exists()){
			targetDir.mkdirs();
		}
		int maxSize = 1024 * 1024 *500;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		String bbsTitle = multipartRequest.getParameter("bbsTitle");
		String bbsContent = multipartRequest.getParameter("bbsContent");
		bbs.setBbsTitle(bbsTitle);
		bbs.setBbsContent(bbsContent);
		
		

		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='/Adapter_Project/login.jsp'");
			script.println("</script>");
		}else{

			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{

				
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				new JavaBBSFileDao().upload(fileName, fileRealName, bbs.getBbsID());

				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");

				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='main.jsp'");
					script.println("</script>");
				}
			}
		}
	
	%>
</body>
</html>