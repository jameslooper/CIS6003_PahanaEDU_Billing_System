package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.DBUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?")) {
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.getSession(true).setAttribute("username", uname);
                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("error", "Invalid credentials");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
