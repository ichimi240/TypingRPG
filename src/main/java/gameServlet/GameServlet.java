package gameServlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/GameServlet")
public class GameServlet extends HttpServlet {

    private List<String> wordList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // サーブレット起動時に一度だけ単語ファイルを読み込む
        String path = getServletContext().getRealPath("/WEB-INF/words.txt");
        try (BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(path), "UTF-8"))) {
            String line;
            while ((line = br.readLine()) != null) {
                line = line.trim();
                if (!line.isEmpty()) {
                    wordList.add(line);
                }
            }
        } catch (IOException e) {
            throw new ServletException("単語ファイル読み込みエラー", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // ユーザーがログインしているかチェック
        if (!isLoggedIn(session)) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        // ==== ゲーム開始処理 ====
        if ("start".equals(action)) {
            session.setAttribute("playerHp", 100);
            session.setAttribute("enemyHp", 50);
            session.setAttribute("log", "ゲームスタート！敵が現れた！");
            session.setAttribute("word", getRandomWord());
            response.sendRedirect("game.jsp");
            return;
        }

        // ==== ゲーム中の処理 ====
        String typedWord = request.getParameter("typedWord");
        String correctWord = (String) session.getAttribute("word");

        Integer playerHp = (Integer) session.getAttribute("playerHp");
        Integer enemyHp = (Integer) session.getAttribute("enemyHp");

        if (playerHp == null || enemyHp == null || correctWord == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        StringBuilder log = new StringBuilder();

        if (typedWord != null && typedWord.equals(correctWord)) {
            int damage = new Random().nextInt(11) + 10;
            enemyHp -= damage;
            if (enemyHp < 0) enemyHp = 0;
            log.append("正解！敵に").append(damage).append("ダメージ！");

            if (enemyHp == 0) {
                log.append(" 敵を倒した！");
                session.setAttribute("log", log.toString());
                session.setAttribute("enemyHp", 0);
                response.sendRedirect("win.jsp");
                return;
            }
        } else {
            int damage = new Random().nextInt(11) + 5;
            playerHp -= damage;
            if (playerHp < 0) playerHp = 0;
            log.append("間違い！敵の攻撃！あなたは").append(damage).append("ダメージを受けた…<br>");

            if (playerHp == 0) {
                log.append(" あなたは倒れた…ゲームオーバー！");
                session.setAttribute("log", log.toString());
                session.setAttribute("playerHp", 0);
                response.sendRedirect("lose.jsp");
                return;
            }
        }

        // 状態更新
        session.setAttribute("playerHp", playerHp);
        session.setAttribute("enemyHp", enemyHp);
        session.setAttribute("log", log.toString());
        session.setAttribute("word", getRandomWord());

        response.sendRedirect("game.jsp");
    }

    private boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("username") != null;
    }

    private String getRandomWord() {
        if (wordList.isEmpty()) {
            return "たたかう"; // 保険
        }
        Random rand = new Random();
        return wordList.get(rand.nextInt(wordList.size()));
    }
}
