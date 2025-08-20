<%@ page language="java" pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Add Customer - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Add Customer</h2>
    <form method="post" action="customers" onsubmit="return validate();">
      <input type="hidden" name="action" value="create" />
      <div class="row">
        <div>
          <label>Account No</label>
          <input type="number" name="accountNo" id="acc" min="1" required />
        </div>
        <div>
          <label>Units</label>
          <input type="number" name="units" id="units" min="0" required />
        </div>
        <div>
          <label>Name</label>
          <input type="text" name="name" id="name" required />
        </div>
        <div>
          <label>Telephone</label>
          <input type="text" name="telephone" id="tel" pattern="0[0-9]{9}" placeholder="0XXXXXXXXX" required />
        </div>
      </div>
      <div class="row single">
        <div>
          <label>Address</label>
          <textarea name="address" id="addr" rows="3" required></textarea>
        </div>
      </div>
      <br/>
      <button class="btn" type="submit">Save</button>
      <a class="btn secondary" href="listCustomers.jsp">Cancel</a>
    </form>
    <%
      Object msg = request.getAttribute("msg");
      if (msg != null) { %><div class="alert error"><%=msg%></div><% }
    %>
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
