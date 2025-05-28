<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログアウト</title>
    <link rel="stylesheet" href="style.css">
    <!-- ドット風フォント -->
    <link href="https://fonts.googleapis.com/css2?family=DotGothic16&display=swap" rel="stylesheet">
</head>
<body>

	<!-- 背景画像 -->
	<img src="images/rogo.png" alt="背景" class="bg-slide-image" id="bgImage">
    <div class="dq-window">
        <h1 class="dq-title">ログアウトしました</h1>
        <p class="dq-desc">またの挑戦をお待ちしております！</p>
        <form action="GameServlet" method="post">
		    <input type="hidden" name="action" value="start">
			<button type="submit" class="dq-button">▶ ログイン画面へ</button>
		</form>
    </div>
    
    <!-- スライドアニメーション -->
    <script>
		window.onload = function() {
			document.getElementById('bgImage').classList.add('show');
		};
	</script>
</body>
</html>