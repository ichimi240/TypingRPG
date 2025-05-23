<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>敗北</title>
    <link rel="stylesheet" href="style.css">
    <!-- ドット風フォント -->
    <link href="https://fonts.googleapis.com/css2?family=DotGothic16&display=swap" rel="stylesheet">
</head>
<body>
	<div class="log dq-log">
		<div class="dq-window">
		    <h1>💀 敗北...</h1>
		    <p>残念！あなたは力尽きました。</p>
		    <p><%= session.getAttribute("log") %></p>
		    <form action="GameServlet" method="post">
		        <input type="hidden" name="action" value="start">
		        <button type="submit" class="dq-button">▶ リトライ</button>
		    </form>
		</div>
		<p>ログイン中：<%= session.getAttribute("username") %> さん</p><br>
		<div style="text-align:right;">
			<a href="LogoutServlet">ログアウト</a>
		</div>
	</div>
</body>
</html>