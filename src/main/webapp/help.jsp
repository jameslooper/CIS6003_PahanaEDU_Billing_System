<%@ page language="java" pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Help - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Help & Usage Guide</h2>
    <ul>
      <li>Login with your username and password.</li>
      <li><b>Customers:</b> Add, edit, delete customer records. Each account has unique account number.</li>
      <li><b>Items:</b> Optional product list for add-ons.</li>
      <li><b>Billing:</b> Enter an account number to compute the bill based on units consumed.</li>
    
    </ul>
  </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
</body>
</html>
