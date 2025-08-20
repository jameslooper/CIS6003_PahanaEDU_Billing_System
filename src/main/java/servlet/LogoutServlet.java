package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession(false);
        if (s != null) s.invalidate();
<<<<<<< HEAD
        response.sendRedirect("index.jsp");
=======
        response.sendRedirect("login.jsp");
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
    }
}
