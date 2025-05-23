<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Integer playerHp = (Integer) session.getAttribute("playerHp");
    Integer enemyHp = (Integer) session.getAttribute("enemyHp");
    String word = (String) session.getAttribute("word");
    String log = (String) session.getAttribute("log");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>タイピングRPG</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=DotGothic16&display=swap" rel="stylesheet">
</head>
<body>
	<div class="log dq-log"><%= log %><br><br>
	    <div class="dq-window">
	        <div class="characters">
	            <div class="character">
	                <img src="images/player.png" alt="プレイヤー" class="char-img">
	                <p>あなたのHP: <span class="hp"><%= playerHp %></span></p>
	            </div>
	            <div class="character">
	                <img src="images/enemy.png" alt="敵" class="char-img">
	                <p>敵のHP: <span class="hp"><%= enemyHp %></span></p>
	            </div>
	        </div>
	        <div class="battle-area">
	            <p class="word">お題：『<strong><%= word %></strong>』をタイプ！</p>
	            <form action="GameServlet" method="post">
	                <input type="hidden" name="action" value="continue">
	                <input type="text" name="typedWord" autofocus autocomplete="off"><br><br>
	                <input type="submit" value="▶ 入力する" class="dq-button">
	            </form>
	        </div>
		</div>
		<p>ログイン中：<%= session.getAttribute("username") %> さん</p><br>
		<div style="text-align:right;">
    		<a href="LogoutServlet">ログアウト</a>      
    	</div>
    </div>
    
<!--    点滅と揺れのアニメーション-->
	<script>
	    window.addEventListener("DOMContentLoaded", () => {
	        const logText = "<%= log != null ? log.replaceAll("\"", "\\\"") : "" %>";
	        const enemyImg = document.querySelector('img[alt="敵"]');
	        const playerImg = document.querySelector('img[alt="プレイヤー"]');
	
	        if (logText.includes("敵の攻撃")) {
	            applyEffects(playerImg);
	        } else if (logText.includes("正解！敵に")) {
	            applyEffects(enemyImg);
	        }
	    });
	
	    function applyEffects(img) {
	        img.classList.add("damage-effect");
	        setTimeout(() => {
	            img.classList.remove("damage-effect");
	        }, 400);
	    }
	</script>

	
</body>
</html>

