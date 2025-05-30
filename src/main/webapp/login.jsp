<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>ログイン</title>
	<link rel="stylesheet" href="style.css">
	<link href="https://fonts.googleapis.com/css2?family=DotGothic16&display=swap" rel="stylesheet">
</head>
<body>
	<!-- 背景画像 -->
	<img src="images/rogo.png" alt="背景" class="bg-slide-image" id="bgImage">
	
	<!-- ログインフォーム -->
	<div class="dq-window">
	    <h2 class="dq-title">ログイン</h2>
	    <form method="post" action="LoginServlet">
	        ユーザー名: <input type="text" name="username" required><br>
	        パスワード: <input type="password" name="password" required><br><br>
	        <button type="submit" class="dq-button">▶ ログイン</button>
	    </form>
	
	    <% if (request.getParameter("error") != null) { %>
	        <p style="color:red;">パスワードが間違っています</p>
	    <% } %>
	</div>
	
	<!-- スライドアニメーション -->
	<script>
		window.onload = function() {
			document.getElementById('bgImage').classList.add('show');
		};
	</script>
</body>
</html>
