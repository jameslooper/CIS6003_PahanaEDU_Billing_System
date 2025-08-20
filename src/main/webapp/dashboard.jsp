<%@ page language="java" pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Dashboard - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<div class="nav">
  <div><b>Pahana Edu</b> — Billing System</div>
  <div class="right">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="listCustomers.jsp">Customers</a>
    <a href="listItems.jsp">Items</a>
    <a href="bill.jsp">Billing</a>
    <a href="help.jsp">Help</a>
    <a href="logout" >Logout</a>
  </div>
</div>

<div class="wrapper">
  <div class="card">
    <h2>Welcome, <%=session.getAttribute("username")%> 👋</h2>
    <p>Use the navigation to manage customers, items, and print bills.</p>
  </div>

  <div class="card">
    <h3>Quick Actions</h3>
    <p>
      <a class="btn" href="addCustomer.jsp">Add Customer</a>
      <a class="btn" href="addItem.jsp">Add Item</a>
      <a class="btn secondary" href="listCustomers.jsp">View Customers</a>
      <a class="btn secondary" href="listItems.jsp">View Items</a>
      <a class="btn success" href="bill.jsp">Calculate Bill</a>
    </p>
  </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
</body>
</html>
