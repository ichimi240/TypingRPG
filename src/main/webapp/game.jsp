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
<body class="game_events">	
	<div class="log dq-log"><p class="console-log"><%= log %></p>
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
	                <input type="text" name="typedWord" id="typedWord" autofocus autocomplete="off"><br><br>
	                <input type="submit" value="▶ 入力する" class="dq-button">
	            </form>
	            
	            <p>残り時間: <span id="timer">20</span>秒</p>
	            <script>
	            	let timeLeft = 20; // 秒数
		            const timerElem = document.getElementById('timer');
		            const inputBox = document.getElementById('typedWord');
		            const form = inputBox.form;
		            
		            const countdown = setInterval(() => {
		            	timeLeft--;
		            	timerElem.textContent = timeLeft;
		                if (timeLeft <= 0) {
		                	clearInterval(countdown);
		                    alert('時間切れ！');
		                    inputBox.disabled = true;
		                    form.submit(); // 時間切れで自動送信（必要なら）
		                }
					}, 1000);
				</script>
	            
	        </div>
		</div>
		<p class="console-log">ログイン中：<%= session.getAttribute("username") %> さん</p>
		<div style="text-align:right;">
    		<p class="console-log"><a href="LogoutServlet">ログアウト</a></p>      
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

