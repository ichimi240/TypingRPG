<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>勝利！</title>
    <link rel="stylesheet" href="style.css">
    <!-- ドット風フォント -->
    <link href="https://fonts.googleapis.com/css2?family=DotGothic16&display=swap" rel="stylesheet">
</head>
<body class="game_win">
	<div class="log dq-log">
		<div class="dq-window">
		    <h1>
		    	<img src="<%= request.getContextPath() %>/images/treasure_chest.png" alt="宝箱" style="width: 60px; vertical-align: middle;">
		    	勝利！</h1>
		    <p>敵をすべて倒しました！</p>
		    <p><%= session.getAttribute("log") %></p>
		    <form action="GameServlet" method="post">
		        <input type="hidden" name="action" value="start">
		        <button type="submit" class="dq-button">▶ もう一度プレイ</button>
		    </form>
		</div>
		<p class="console-log">ログイン中：<%= session.getAttribute("username") %> さん</p>
		<div style="text-align:right;">
			<p class="console-log"><a href="LogoutServlet">ログアウト</a></p>
		</div>		    
	</div>		    
</body>
</html>