<<<<<<< HEAD
<%@ page language="java" pageEncoding="UTF-8" import="dao.CustomerDAO, dao.ItemDAO, model.Customer, model.Item, java.util.List, java.text.SimpleDateFormat, java.util.Date, java.math.BigDecimal" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    CustomerDAO customerDAO = new CustomerDAO();
    ItemDAO itemDAO = new ItemDAO();
    List<Customer> customers = CustomerDAO.listAll();
    List<Item> items = ItemDAO.listAll();
    String currentDate = new SimpleDateFormat("MMMM dd, yyyy").format(new Date());
    Customer c = (Customer) request.getAttribute("customer");
    BigDecimal amount = (BigDecimal) request.getAttribute("amount");
=======
<%@ page language="java" pageEncoding="UTF-8" import="model.Customer,java.math.BigDecimal" %>
<%
  if (session.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
  Customer c = (Customer) request.getAttribute("customer");
  BigDecimal amount = (BigDecimal) request.getAttribute("amount");
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
    <title>Billing - Pahana Edu</title>
    <link rel="stylesheet" href="css/style.css" />
    <style>
        .form-row { margin-bottom: 15px; }
        select, input[type=number] { padding:8px; width:100%; }
        .items-table { width:100%; border-collapse:collapse; margin-top:10px; }
        .items-table th, .items-table td { border:1px solid #ccc; padding:8px; text-align:center; }
        .btn { background:#2563eb; color:white; border:none; padding:10px 15px; border-radius:4px; cursor:pointer; }
        .btn:hover { background:#2563eb; }
        .total { font-weight:bold; color:#333; margin-top:15px; font-size:18px; }
        #printArea { display:none; }
        @media print {
            body * { visibility:hidden; }
            #printArea, #printArea * { visibility:visible; }
            #printArea { display:block; position:absolute; left:0; top:0; width:100%; font-family: Arial, sans-serif; }
            #printArea h2 { text-align: center; margin-bottom: 20px; }
            #printArea table { width:100%; border-collapse: collapse; margin-top: 10px; }
            #printArea th, #printArea td { border:1px solid #000; padding: 8px; text-align:left; }
            #printArea tfoot th { text-align: right; }
        }
    </style>
    <script>
        function addItemRow() {
            let template = document.getElementById("itemSelectTemplate").firstElementChild.cloneNode(true);
            template.addEventListener("change", function() { updatePrice(this); });
            let tableBody = document.getElementById("itemsTable").getElementsByTagName("tbody")[0];
            let row = tableBody.insertRow();
            let cell1 = row.insertCell(0);
            let cell2 = row.insertCell(1);
            let cell3 = row.insertCell(2);
            let cell4 = row.insertCell(3);
            cell1.appendChild(template);
            cell2.innerHTML = '<input type="number" value="1" min="1" onchange="calculateTotal()">';
            cell3.className = "priceCell";
            cell3.textContent = "0.00";
            cell4.innerHTML = '<button type="button" onclick="removeRow(this)">X</button>';
            calculateTotal();
        }
        function removeRow(btn) {
            let row = btn.closest("tr");
            row.remove();
            calculateTotal();
        }
        function updatePrice(select) {
            let price = parseFloat(select.selectedOptions[0]?.dataset.price || 0);
            let priceCell = select.closest("tr").querySelector(".priceCell");
            priceCell.textContent = price.toFixed(2);
            calculateTotal();
        }
        function calculateTotal() {
            let rows = document.querySelectorAll("#itemsTable tbody tr");
            let total = 0;
            rows.forEach(row => {
                let select = row.querySelector("select");
                let qtyInput = row.querySelector("input");
                let priceCell = row.querySelector(".priceCell");
                if (select && select.value && qtyInput && priceCell) {
                    let qty = parseInt(qtyInput.value) || 0;
                    let price = parseFloat(priceCell.textContent) || 0;
                    total += qty * price;
                }
            });
            document.getElementById("totalAmount").textContent = total.toFixed(2);
        }
        function printBill() {
            let customerSelect = document.querySelector("select[name='customerId']");
            if (!customerSelect.value) {
                alert("Please select a customer.");
                return;
            }
            let rows = document.querySelectorAll("#itemsTable tbody tr");
            if (rows.length === 0) {
                alert("Please add at least one item.");
                return;
            }
            let customerOptionText = customerSelect.selectedOptions[0]?.textContent || '';
            let customerName = customerOptionText.split(" - ")[0] || '';
            let customerAccount = customerSelect.value || '';
            document.getElementById("printCustomerName").textContent = customerName;
            document.getElementById("printCustomerAccount").textContent = customerAccount;
            let tbody = document.getElementById("printItemsBody");
            tbody.innerHTML = '';
            let validItemCount = 0;
            rows.forEach(row => {
                let itemSelect = row.querySelector("select");
                if (!itemSelect.value) {
                    return;
                }
                validItemCount++;
                let itemText = itemSelect.selectedOptions[0]?.textContent || '';
                let item = itemText.split(" - ")[0] || '';
                let qty = row.querySelector("input")?.value || '0';
                let price = parseFloat(row.querySelector(".priceCell")?.textContent || 0);
                let subtotal = (parseInt(qty) * price).toFixed(2);
                let tr = document.createElement("tr");
                tr.innerHTML = `<td>${item}</td><td>${qty}</td><td>LKR ${price.toFixed(2)}</td><td>LKR ${subtotal}</td>`;
                tbody.appendChild(tr);
            });
            if (validItemCount === 0) {
                alert("No valid items selected. Please select an item from the dropdown in each row.");
                return;
            }
            document.getElementById("printTotal").textContent = document.getElementById("totalAmount").textContent;
            window.print();
        }
    </script>
=======
  <title>Billing - Pahana Edu</title>
  <link rel="stylesheet" href="css/style.css" />
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
</head>
<body>
<jsp:include page="topnav.jspf" />
<div class="wrapper">
<<<<<<< HEAD
    <div class="card">
        <h2>Calculate and Print Bill</h2>
        <form method="post" action="bill">
            <div class="form-row">
                <label>Customer</label>
                <select name="customerId" required>
                    <option value="">-- Select Customer --</option>
                    <% for(Customer customer : customers) { %>
                        <option value="<%= customer.getAccountNo() %>"><%= customer.getName() %> - <%= customer.getAccountNo() %></option>
                    <% } %>
                </select>
            </div>
            <div class="form-row">
                <label>Items</label>
                <table class="items-table" id="itemsTable">
                    <thead>
                        <tr><th>Item</th><th>Quantity</th><th>Price</th><th>Action</th></tr>
                    </thead>
                    <tbody></tbody>
                </table>
                <button type="button" class="btn" onclick="addItemRow()">Add Item</button>
            </div>
            <div class="total">
                Total: LKR <span id="totalAmount">0.00</span>
            </div>
            <br/>
            <button type="button" class="btn" onclick="printBill()">Print</button>
       
        </form>
        <div id="itemSelectTemplate" style="display:none;">
            <select name="itemIds" required>
                <option value="">-- Select Item --</option>
                <% for(Item item : items) { %>
                    <option value="<%= item.getId() %>" data-price="<%= item.getPrice() %>"><%= item.getName() %> - LKR <%= item.getPrice() %></option>
                <% } %>
            </select>
        </div>
        <div id="printArea">
            <h2>Pahana Edu</h2>
            <p>Date: <%= currentDate %></p>
            <p>Customer: <span id="printCustomerName"></span> (Acc: <span id="printCustomerAccount"></span>)</p>
            <table>
                <thead>
                    <tr><th>Item</th><th>Quantity</th><th>Price</th><th>Subtotal</th></tr>
                </thead>
                <tbody id="printItemsBody"></tbody>
                <tfoot>
                    <tr><th colspan="3">Total</th><td>LKR <span id="printTotal"></span></td></tr>
                </tfoot>
            </table>
        </div>
        <% if (request.getAttribute("msg") != null) { %>
            <div class="alert error"><%=request.getAttribute("msg")%></div>
        <% } %>
        <% if (c != null && amount != null) { %>
            <hr/>
            <h3>Bill Summary</h3>
            <table class="table">
                <tr><th>Account No</th><td><%=c.getAccountNo()%></td></tr>
                <tr><th>Name</th><td><%=c.getName()%></td></tr>
                <tr><th>Units</th><td><%=c.getUnits()%></td></tr>
                <tr><th>Total (Rs.)</th><td><b><%=amount%></b></td></tr>
            </table>
        <% } %>
    </div>
</div>
<div class="footer">© Pahana Edu, Colombo</div>
</body>
</html>
=======
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
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
