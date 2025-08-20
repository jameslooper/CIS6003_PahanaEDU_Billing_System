<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<div class="nav"><div>Pahana Edu</div></div>
<div class="wrapper">
  <div class="card" style="max-width:420px; margin: 40px auto;">
    <h2>Sign in</h2>
    <p class="small">Use <b>admin / admin123</b> (temp message).</p>
    <form method="post" action="login" onsubmit="return validate();">
      <div class="row single">
        <div>
          <label>Username</label>
          <input type="text" name="username" id="u" required />
        </div>
        <div>
          <label>Password</label>
          <input type="password" name="password" id="p" required />
        </div>
      </div>
      <br/>
      <button class="btn" type="submit">Login</button>
 		 <a href="index.jsp" class="btn">Home</a>
      
    </form>
    <%
      Object err = request.getAttribute("error");
      if (err != null) {
    %>
      <div class="alert error"><%=err%></div>
    <% } %>
  </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
<script>
function validate(){
  if(!document.getElementById('u').value.trim() || !document.getElementById('p').value.trim()){
    alert('Please fill both fields'); return false;
  }
  return true;
}
</script>
</body>
</html>
