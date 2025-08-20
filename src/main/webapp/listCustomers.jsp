<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,dao.CustomerDAO,model.Customer" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
  List<Customer> list = new ArrayList<>();
<<<<<<< HEAD
  try { list = CustomerDAO.listAll(); } catch(Exception e) { e.printStackTrace(); }
=======
  try { list = CustomerDAO.getAllCustomers(); } catch(Exception e) { e.printStackTrace(); }
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
%>
<!DOCTYPE html>
<html>
<head>
  <title>Customers - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Customers</h2>
    <p>
      <a class="btn" href="addCustomer.jsp">Add Customer</a>
      <a class="btn success" href="bill.jsp">Go to Billing</a>
    </p>
    <%
      if (request.getParameter("success") != null) {
    %><div class="alert success"><%=request.getParameter("success")%></div><% } %>
    <table class="table">
      <thead>
        <tr><th>Account No</th><th>Name</th><th>Telephone</th><th>Units</th><th>Actions</th></tr>
      </thead>
      <tbody>
      <% for(Customer c: list){ %>
        <tr>
          <td><%=c.getAccountNo()%></td>
          <td><%=c.getName()%></td>
          <td><%=c.getTelephone()%></td>
          <td><%=c.getUnits()%></td>
          <td>
            <a class="btn" href="customers?edit=<%=c.getAccountNo()%>">Edit</a>
            <form action="customers" method="post" style="display:inline" onsubmit="return confirm('Delete this customer?');">
              <input type="hidden" name="action" value="delete"/>
              <input type="hidden" name="accountNo" value="<%=c.getAccountNo()%>"/>
              <button class="btn danger" type="submit">Delete</button>
            </form>
          </td>
        </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
