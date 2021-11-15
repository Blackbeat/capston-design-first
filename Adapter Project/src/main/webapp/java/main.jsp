<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.jsp.db.BBS" %>
<%@ page import="com.jsp.db.JAVABBSDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java 게시판</title>
</head>
<body>
<%@ include file = "../header.jsp" %>
<%
	int pageNumber = 1; 
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<style type="text/css">
  	.jumbotron{
  		background-image: url('../img/Javabackground.jpg');
        background-size: cover;
        text-shadow: black 0.2em 0.2em 0.2em;
        color:white;
  	}
  </style>
<div class="jumbotron">
 <div class="container">
      <h1 class="display-3">Java관련 게시판 입니다</h1>
      <p>대한민국에서 가장 많이 사용하는 Java.</p>
      <p>모르는게 있으면 여기에서 물어보세요</p>
    </div>
  </div>

<div class="container">
	<div class="row">
		<h3>게시판</h3>
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">채팅방 접속자수</th>
					</tr>
				</thead>
				<tbody>
					<%
						JAVABBSDAO bbsDAO = new JAVABBSDAO(); 
						ArrayList<BBS> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
							<%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;")
								.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
							+ list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
						<td><%= list.get(i).getChatCount() + "명" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			
			<%
				if(pageNumber != 1){
			%>
				<a href="main.jsp?pageNumber=<%=pageNumber - 1 %>"
					class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="main.jsp?pageNumber=<%=pageNumber + 1 %>"
					class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			
			
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			
		</div>
	</div>
</body>
</html>