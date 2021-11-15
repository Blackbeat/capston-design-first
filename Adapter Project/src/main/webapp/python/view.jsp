<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<%@ page import="com.jsp.db.BBS" %>
<%@page import="com.jsp.db.PythonBbsDao"%>
<%@page import="com.jsp.file.PythonBBSFileDao" %>
<%@page import="com.jsp.file.FileDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Python 게시판 글보기</title>
</head>
<body>
<%@ include file = "../header.jsp" %>
<%

		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		

		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='main.jsp'");
			script.println("</script");
		}
		

		BBS bbs = new PythonBbsDao().getBbs(bbsID);
		FileDto dto = new PythonBBSFileDao().load(bbsID);
%>

	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;")
								.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
								+ bbs.getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					
						<%
							if(dto != null) {
						%>
						<tr>
						<td>이미지</td>
						<td colspan="2"> <img src="/Adapter_Project/upload/PythonBBS/<%=dto.getFileRealName() %>"alt="1000" width="1000" class="img-responsive center-block" /></td>
						</tr>
						<%
						}
						%>
				</tbody>
			</table>
			<a href="../chat/pythonchat.jsp?roomID=<%= bbsID %>" onclick="window.open(this.href, '_blank', 'width=800, height=900'); return false;" class="btn btn-primary">채팅방 들어가기</a>
			<a href="main.jsp" class="btn btn-primary">목록</a>
			
			
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>