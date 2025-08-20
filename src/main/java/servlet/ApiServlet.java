package servlet;

import dao.CustomerDAO;
import model.Customer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/api/customers")
public class ApiServlet extends HttpServlet {

<<<<<<< HEAD
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json; charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            List<Customer> list = CustomerDAO.listAll();
=======
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json; charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            List<Customer> list = CustomerDAO.getAllCustomers();
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            for (int i = 0; i < list.size(); i++) {
                Customer c = list.get(i);
                sb.append("{")
                  .append("\"account_no\":").append(c.getAccountNo()).append(",")
                  .append("\"name\":\"").append(escape(c.getName())).append("\",")
                  .append("\"address\":\"").append(escape(c.getAddress())).append("\",")
                  .append("\"telephone\":\"").append(escape(c.getTelephone())).append("\",")
                  .append("\"units\":").append(c.getUnits())
                  .append("}");
                if (i < list.size() - 1) sb.append(",");
            }
            sb.append("]");
            out.print(sb.toString());
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private String escape(String s) {
<<<<<<< HEAD
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
=======
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
