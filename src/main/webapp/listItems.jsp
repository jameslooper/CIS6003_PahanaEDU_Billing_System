<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,dao.ItemDAO,model.Item" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
  List<Item> items = new ArrayList<>();
  try { items = ItemDAO.list(); } catch(Exception e) { e.printStackTrace(); }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Items - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
  <div class="card">
    <h2>Items</h2>
    <p>
      <a class="btn" href="addItem.jsp">Add Item</a>
    </p>
    <%
      if (request.getParameter("success") != null) {
    %><div class="alert success"><%=request.getParameter("success")%></div><% } %>
    <table class="table">
      <thead>
        <tr><th>ID</th><th>Name</th><th>Price (Rs.)</th><th>Actions</th></tr>
      </thead>
      <tbody>
      <% for(Item it: items){ %>
        <tr>
          <td><%=it.getId()%></td>
          <td><%=it.getName()%></td>
          <td><%=it.getPrice()%></td>
          <td>
            <a class="btn" href="items?edit=<%=it.getId()%>">Edit</a>
            <form action="items" method="post" style="display:inline" onsubmit="return confirm('Delete this item?');">
              <input type="hidden" name="action" value="delete"/>
              <input type="hidden" name="id" value="<%=it.getId()%>"/>
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
</html>
