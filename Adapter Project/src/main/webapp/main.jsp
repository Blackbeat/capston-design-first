<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connecter 메인</title>
</head>
<body>
<main>
<%@ include file = "header.jsp" %>

  <style type="text/css">
  	.jumbotron{
  		background-image: url('img/Mainbackground.jpg');
        background-size: cover;
        text-shadow: black 0.2em 0.2em 0.2em;
        color:white;
  	}
  </style>
  <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">안녕하세요! Connecter 입니다.</h1>
      <p>사이트를 통해 모든걸 연결한다는 것에서 발상한 Connecter</p>
      <p>비록 모든걸 연결하기에는 아직 부족하지만 연결을 통해서 발전시키겠습니다.</p>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <h2>자바</h2>
        <p>자바에 대해 궁금한게 있나요? 이 채팅방에서 물어보세요</p>
        <a href="java/main.jsp"><img src="img/Java.png" class="img-fluid"></a>
        <p><a class="btn btn-secondary" href="java/main.jsp" role="button">바로 가기 &raquo;</a></p>
      </div>
      <div class="col-md-4">
        <h2>C</h2>
        <p>C언어에 대해서 궁금한게 있으시면 이방으로 들어오세요.</p>
        <a href="c/main.jsp"><img src="img/C.png" class="img-fluid"></a>
        <p><a class="btn btn-secondary" href="c/main.jsp" role="button">바로 가기 &raquo;</a></p>
      </div>
      <div class="col-md-4">
        <h2>Python</h2>
        <p>요즘 많이 떠오르는 Python</p>
        <a href="python/main.jsp"><img src="img/Python.png" class="img-fluid"></a>
        <p><a class="btn btn-secondary" href="python/main.jsp" role="button">바로 가기 &raquo;</a></p>
      </div>
  		
    </div>

    <hr>

  </div> 

</main>
</body>

</html>