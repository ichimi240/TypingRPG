package gameServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // セッション破棄（ログアウト処理）
        HttpSession session = request.getSession(false); // false: 既存セッションがなければnull
        if (session != null) {
            session.invalidate();
        }

        // ログアウト画面に移行
        response.sendRedirect("logout.jsp");
    }
}
