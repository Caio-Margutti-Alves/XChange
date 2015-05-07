<%@include file="db.jsp" %>
<%
  String query="Select * from item";

  Statement stm=null;
  ResultSet rst=null;
  stm= conn.createStatement();
  rst = stm.executeQuery(query);
%>

<!DOCTYPE HTML>
<html>
<head>
<title>Xchange | Index</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<!---strat-slider---->


		<script language="JavaScript">
		function validateLogin(){
		  if(document.logonForm.username.value == ""){
			alert("Please enter username");
			document.logonForm.username.focus();
			return;
		  }
		  if(document.logonForm.password.value == ""){
			alert("Please enter password");
			document.logonForm.password.focus();
			return;
		  }
		  document.logonForm.submit();
		}
		
		function validateNewItem(){
		  if(document.newItemForm.title.value == ""){
			alert("Please enter title");
			document.newItemForm.title.focus();
			return;
		  }
		  if(document.newItemForm.description.value == ""){
			alert("Please enter description");
			document.newItemForm.description.focus();
			return;
		  }
		  if(document.newItemForm.quantity.value == ""){
			alert("Please enter quantity");
			document.newItemForm.quantity.focus();
			return;
		  }
		  var quantity = document.newItemForm.quantity.value;
		  if(isNaN(quantity) || parseInt(quantity) != quantity || isNaN(parseInt(quantity, 10)) || quantity < 1) {
			alert("Quantity should be a positive integer");
			document.newItemForm.quantity.focus();
			return;
		  }
		  document.newItemForm.submit();
		}
	</script>
		
</head>

<body>
	<div class="wrap"> 
		<%
			Object user = session.getAttribute("username");
			if(user==null) { 
		%> 
				<jsp:include page="/header/header.jsp" flush="true" />
				<jsp:include page="/header/slider.html" flush="true" />
		<% } else{ %>
				<jsp:include page="/header/header_log_on.jsp" flush="true" />

		 <% } %>
	</div>

	<div class="main">
		<p class="login" align=center>
		<%
			user = session.getAttribute("username");
			if(user==null) { 
				String usernameCreated = request.getParameter("insert"); 
				if(usernameCreated!=null)
					out.println(usernameCreated);
			%>
				<form name="logonForm" action="logon.jsp" method="post" class="form-4">
					<h1>LOGIN</h1>
    				<p>
       					<label for="login">Username or email</label>
						<input type="text" name="username" placeholder="Username" required>
    				</p>
					<p>
					    <label for="password">Password</label>
					    <input type="password" name='password' placeholder="Password" required> 
					</p>
					<p>
        				<input type="submit" name="submit" value="Continue" onClick="JavaScript:validateLogin()">
					</p>
				</form>

		<%	}
		%>
		
		<%
			if(user!=null) {
				String newItemCreated = request.getParameter("insert"); 
				if(newItemCreated!=null)
					out.println(newItemCreated);
			}
		%>

		<h1 class="form-4">ALL AVAILABLE ITEMS</h1>
		<table border=1 id="cust_table">
			<tr><th style="width:100px;height:50px">Title</th><th style="width:500px">Description</th><th style="width:100px">Quantity</th><th style="width:100px">User</th><th style="width:100px">Trade</th></tr>
			<% while(rst.next()){ %>
		        <tr>
		            <td align=center style="height:50px"><%= rst.getString("title")%></td>
		            <td align=center><%= rst.getString("description")%></td>
		            <td align=center><%= rst.getString("quantity") %></td>
		            <td align=center><%= rst.getString("owner_username") %></td>
		            <% 	if (user!=null && !user.toString().equals(rst.getString("owner_username"))) { %>
		            	<td align=center>
		                	<form action="trading.jsp" align=center method="post">
		                    	<input type="hidden" name="item1_id" value="<%= rst.getString("id")%>">
		                        <input type="hidden" name="username1" value="<%= rst.getString("owner_username")%>">
		                		<input type="submit" name="submit" value="Trade">
		                    </form>
		                </td>
		            <% } else { %>
		            	<td align=center></td>
		            <% } %>
		        
		        </tr>
       		<%}%>
		</table>
		
        <%
		  rst.close();
		  stm.close();
		  conn.close();
		%>
        
		<%
			if(user!=null) {
		%>
			<jsp:include page="newItemForm.jsp" flush="true" />
		<% } %>
	</div>


    <jsp:include page="footer/footer.jsp" flush="true" />
</body>

</html>