<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		} else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("window.close()");
			script.println("</script>");
		}
		
		String roomID = null;
		roomID = request.getParameter("roomID");
	%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-widthm, intial-scale=1">
<link rel="stylesheet" href="/Adapter_Project/css/bootstrap.css">
<link rel="stylesheet" href="/Adapter_Project/css/custom.css">
<title>JSP 실시간 채팅 사이트</title>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/Adapter_Project/js/bootstrap.js"></script>
<script type="text/javascript">	
var lastID = 0;
function init(){
	var roomID = '<%= roomID %>';
	$.ajax({
		type:"POST",
		url:"/PythonChat/ChatCountServlet",
		data:{
			roomID:encodeURIComponent(roomID),
		}
	});
}

function submitFunction(){
	var chatName = '<%= userID %>';
	var roomID = '<%= roomID%>';
	var chatContent = $('#chatContent').val();
	$.ajax({
		type: "POST",
		url: "/PythonChat/ChatSubmitServlet",
		data: {
			roomID:encodeURIComponent(roomID),
			chatName: encodeURIComponent(chatName),
			chatContent: encodeURIComponent(chatContent)
		},
		success: function(result) {
			console.log(result)
			if(result==1) {
				autoClosingAlert('#successMessage', 2000);
			}else if(result==0){
				autoClosingAlert('#dangerMessage', 2000);
			}else {
				autoClosingAlert('#successMessage', 2000);
			}
		}
	});
	$('#chatContent').val('');
}
function autoClosingAlert(selector, delay) {
	var alert = $(selector).alert();
	alert.show();
	window.setTimeout(function() {alert.hide()}, delay);
}

function chatListFunction(type){
	var roomID =  '<%= roomID %>';
	$.ajax({
		type: "POST",
		url: "/PythonChat/ChatListServlet",
		data: {
			listType: type,
			roomID:encodeURIComponent(roomID),
		},
		success: function(data) {
			if(data == "") return;
			var parsed = JSON.parse(data);
			var result = parsed.result;
			console.log(data)
			for(var i = 0; i < result.length; i++) {
				addChat(result[i][0].value, result[i][1].value, result[i][2].value);
			}
			lastID = Number(parsed.last);
		}
	});
}
function addChat(chatName, chatContent, chatTime) {
	$('#chatList').append('<div class="row">' +
			'<div class = "col-lg-12">' +
			'<div class = "media">' +
			'<a class="pull-left" href="#">' +
			'<img class="media-object img-circle" src="images/go.png" alt="">' +
			'</a>' +
			'<div class="media-body">' +
			'<h4 class="media-heading">' +
			chatName +
			'<span class="small pull-right">' +
			chatTime +
			'</span>' +
			'</h4>' +
			'<p>' +
			chatContent +
			'</p>' +
			'</div>'+
			'</div>'+
			'</div>'+
			'</div>'+
			'<hr>');
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
} 
function getInfiniteChat() {
	setInterval(function() {
		chatListFunction(lastID);
	}, 1000);
}
</script>
</head>
<body>
<div class="container">
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4>
								<i class="fa fa-circle text-green"></i>Python 실시간채팅방
							</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body char-widget"
							style="overflow-y: auto; width: auto; height: 600px;">
						</div>
					</div>
					<div class="portlet-footer">
						<div class="row">
							<div class="form-group col-xs-4">
							</div>
						</div>
						<div class="row" style="height: 90px">
							<div class="form-group col-xs-10">
								<textarea style="height: 80px;" id="chatContent"
									class="form-control" placeholder="메시지를입력하시오" maxlength="100"></textarea>
							</div>
							<div class="form-group col-xs-2">
								<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		 </div>
	</div>
		<div class="alert alert-success" id="successMessage" style="display: none;">
			<strong>메시지 전송에 성공하였습니다.</strong>
		</div>
		<div class="alert alert-danger" id="dangerMessage"	style="display: none;">
			<strong>이름과 내용을 모두 입력해주세요.</strong>
		</div>
		<div class="alert alert-warning" id="warningMessage" style="display: none;">
			<strong>데이터베이스 오류가 발생했습니다.</strong>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			init();
			chatListFunction('ten');
			getInfiniteChat();
		});
		
		$(window).bind('beforeunload', function(){
			var roomID = '<%=roomID%>'
				$.ajax({
					type:"POST",
					url: "/PythonChat/ChatUnCountServlet",
					data:{
						roomID:encodeURIComponent(roomID),
					}
				});
			});
	</script>
</body>
</html>