package servlet;

import dao.CustomerDAO;
import model.Customer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Simple tiered billing logic
    // 0-50: 20.00 per unit
    // 51-100: 30.00 per unit for units in this slab
    // >100: 45.00 per unit for units above 100
    private BigDecimal calculateAmount(int units) {
        BigDecimal total = BigDecimal.ZERO;
        int u = units;

        int tier1 = Math.min(u, 50);
        total = total.add(new BigDecimal(tier1).multiply(new BigDecimal("20.00")));
        u -= tier1;

        if (u > 0) {
            int tier2 = Math.min(u, 50);
            total = total.add(new BigDecimal(tier2).multiply(new BigDecimal("30.00")));
            u -= tier2;
        }
        if (u > 0) {
            total = total.add(new BigDecimal(u).multiply(new BigDecimal("45.00")));
        }

        // service charge 5%
        total = total.multiply(new BigDecimal("1.05"));
        return total.setScale(2, RoundingMode.HALF_UP);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int accountNo = Integer.parseInt(req.getParameter("accountNo"));
            Customer c = CustomerDAO.findByAccountNo(accountNo);
            if (c == null) {
                req.setAttribute("msg", "Customer not found.");
                req.getRequestDispatcher("bill.jsp").forward(req, resp);
                return;
            }
            BigDecimal amount = calculateAmount(c.getUnits());
            req.setAttribute("customer", c);
            req.setAttribute("amount", amount);
            req.getRequestDispatcher("bill.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
