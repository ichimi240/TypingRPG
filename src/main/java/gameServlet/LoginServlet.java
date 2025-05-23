package gameServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    // 固定パスワード
    private static final String FIXED_PASSWORD = "1234";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // パスワードが「1234」であればログイン成功
        if (FIXED_PASSWORD.equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username); // ユーザー名をセッションに保存
            response.sendRedirect("start.jsp");
        } else {
            // パスワードが違う → エラー付きでログイン画面に戻る
            response.sendRedirect("login.jsp?error=1");
        }
    }
}


