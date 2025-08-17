<%@ page language="java" pageEncoding="UTF-8" import="model.Customer,java.math.BigDecimal" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
  Customer c = (Customer) request.getAttribute("customer");
  BigDecimal amount = (BigDecimal) request.getAttribute("amount");
%>
<!DOCTYPE html>
<html>
<head>
  <title>Billing - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Calculate & Print Bill</h2>
    <form method="post" action="bill">
      <div class="row">
        <div>
          <label>Customer Account No</label>
          <input type="number" name="accountNo" min="1" required />
        </div>
      </div>
      <br/>
      <button class="btn" type="submit">Compute</button>
    </form>

    <%
      if (request.getAttribute("msg") != null) {
    %><div class="alert error"><%=request.getAttribute("msg")%></div><% } %>

    <% if (c != null && amount != null) { %>
      <hr/>
      <h3>Bill Summary</h3>
      <table class="table">
        <tr><th>Account No</th><td><%=c.getAccountNo()%></td></tr>
        <tr><th>Name</th><td><%=c.getName()%></td></tr>
        <tr><th>Units</th><td><%=c.getUnits()%></td></tr>
        <tr><th>Total (Rs.)</th><td><b><%=amount%></b></td></tr>
      </table>
      <button class="btn" onclick="window.print()">Print</button>
    <% } %>
  </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
</body>
</html>
