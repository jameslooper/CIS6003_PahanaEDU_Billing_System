<%@ page language="java" pageEncoding="UTF-8"%>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Add Item - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Add Item</h2>
    <form method="post" action="items" onsubmit="return validate();">
      <input type="hidden" name="action" value="create" />
      <div class="row">
        <div>
          <label>Name</label>
          <input type="text" name="name" id="name" required />
        </div>
        <div>
          <label>Price (Rs.)</label>
          <input type="number" step="0.01" name="price" id="price" min="0" required />
        </div>
      </div>
      <br/>
      <button class="btn" type="submit">Save</button>
      <a class="btn secondary" href="listItems.jsp">Cancel</a>
    </form>
  </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
<script>
function validate(){
  const price = parseFloat(document.getElementById('price').value);
  if(isNaN(price) || price < 0){ alert('Enter a valid price'); return false; }
  return true;
}
</script>
</body>
</html>
