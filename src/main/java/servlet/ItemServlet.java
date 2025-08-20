package servlet;

import dao.ItemDAO;
import model.Item;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/items")
public class ItemServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("create".equals(action)) {
                String name = req.getParameter("name").trim();
                BigDecimal price = new BigDecimal(req.getParameter("price"));
                ItemDAO.add(new Item(name, price));
                resp.sendRedirect("listItems.jsp?success=Item+added");
            } else if ("update".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("name").trim();
                BigDecimal price = new BigDecimal(req.getParameter("price"));
                Item it = new Item(id, name, price);
                ItemDAO.update(it);
                resp.sendRedirect("listItems.jsp?success=Item+updated");
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                ItemDAO.delete(id);
                resp.sendRedirect("listItems.jsp?success=Item+deleted");
            } else {
                resp.sendRedirect("listItems.jsp");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String edit = req.getParameter("edit");
        if (edit != null) {
            try {
                int id = Integer.parseInt(edit);
                req.setAttribute("item", ItemDAO.find(id));
                req.getRequestDispatcher("editItem.jsp").forward(req, resp);
            } catch (Exception e) {
                throw new ServletException(e);
            }
        } else {
            resp.sendRedirect("listItems.jsp");
        }
    }
}
