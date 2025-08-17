<%@ page language="java" pageEncoding="UTF-8" import="model.Item" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
  Item item = (Item) request.getAttribute("item");
  if (item == null) { response.sendRedirect("listItems.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Item - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Edit Item</h2>
    <form method="post" action="items" onsubmit="return validate();">
      <input type="hidden" name="action" value="update" />
      <div class="row">
        <div>
          <label>ID</label>
          <input type="number" name="id" value="<%=item.getId()%>" readonly />
        </div>
        <div>
          <label>Name</label>
          <input type="text" name="name" id="name" value="<%=item.getName()%>" required />
        </div>
        <div>
          <label>Price (Rs.)</label>
          <input type="number" step="0.01" name="price" id="price" value="<%=item.getPrice()%>" required />
        </div>
      </div>
      <br/>
      <button class="btn" type="submit">Update</button>
      <a class="btn secondary" href="listItems.jsp">Back</a>
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
