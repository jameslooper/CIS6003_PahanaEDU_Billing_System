package servlet;

import dao.CustomerDAO;
import model.Customer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("create".equals(action)) {
                int accountNo = Integer.parseInt(req.getParameter("accountNo"));
                String name = req.getParameter("name").trim();
                String address = req.getParameter("address").trim();
                String telephone = req.getParameter("telephone").trim();
                int units = Integer.parseInt(req.getParameter("units"));

                if (name.isEmpty() || address.isEmpty() || telephone.isEmpty()) {
                    req.setAttribute("msg", "All fields are required.");
                    req.getRequestDispatcher("addCustomer.jsp").forward(req, resp);
                    return;
                }

                CustomerDAO.addCustomer(new Customer(accountNo, name, address, telephone, units));
                resp.sendRedirect("listCustomers.jsp?success=Customer+added");
            } else if ("update".equals(action)) {
                int accountNo = Integer.parseInt(req.getParameter("accountNo"));
                String name = req.getParameter("name").trim();
                String address = req.getParameter("address").trim();
                String telephone = req.getParameter("telephone").trim();
                int units = Integer.parseInt(req.getParameter("units"));

                CustomerDAO.updateCustomer(new Customer(accountNo, name, address, telephone, units));
                resp.sendRedirect("listCustomers.jsp?success=Customer+updated");
            } else if ("delete".equals(action)) {
                int accountNo = Integer.parseInt(req.getParameter("accountNo"));
                CustomerDAO.deleteCustomer(accountNo);
                resp.sendRedirect("listCustomers.jsp?success=Customer+deleted");
            } else {
                resp.sendRedirect("listCustomers.jsp");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Loads edit page with data
        String edit = req.getParameter("edit");
        if (edit != null) {
            try {
                int accountNo = Integer.parseInt(edit);
                Customer c = CustomerDAO.findByAccountNo(accountNo);
                req.setAttribute("customer", c);
                req.getRequestDispatcher("editCustomer.jsp").forward(req, resp);
            } catch (Exception e) {
                throw new ServletException(e);
            }
        } else {
            resp.sendRedirect("listCustomers.jsp");
        }
    }
}
