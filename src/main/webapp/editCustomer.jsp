<%@ page language="java" pageEncoding="UTF-8" import="model.Customer" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
  Customer c = (Customer) request.getAttribute("customer");
  if (c == null) { response.sendRedirect("listCustomers.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Customer - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Edit Customer</h2>
    <form method="post" action="customers" onsubmit="return validate();">
      <input type="hidden" name="action" value="update" />
      <div class="row">
        <div>
          <label>Account No</label>
          <input type="number" name="accountNo" value="<%=c.getAccountNo()%>" readonly />
        </div>
        <div>
          <label>Units</label>
          <input type="number" name="units" id="units" min="0" value="<%=c.getUnits()%>" required />
        </div>
        <div>
          <label>Name</label>
          <input type="text" name="name" id="name" value="<%=c.getName()%>" required />
        </div>
        <div>
          <label>Telephone</label>
          <input type="text" name="telephone" id="tel" value="<%=c.getTelephone()%>" pattern="0[0-9]{9}" required />
        </div>
      </div>
      <div class="row single">
        <div>
          <label>Address</label>
          <textarea name="address" id="addr" rows="3" required><%=c.getAddress()%></textarea>
        </div>
      </div>
      <br/>
      <button class="btn" type="submit">Update</button>
      <a class="btn secondary" href="listCustomers.jsp">Back</a>
    </form>
  </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
<script>
function validate(){
  const tel = document.getElementById('tel').value.trim();
  if(!/^0\d{9}$/.test(tel)){ alert('Telephone must be 10 digits and start with 0'); return false; }
  return true;
}
</script>
</body>
</html>
