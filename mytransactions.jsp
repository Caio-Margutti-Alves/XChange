<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@include file="db.jsp" %>
<% 
 Object user = session.getAttribute("username");
 if(user == null)
	response.sendRedirect("index.jsp");
 else {
 
  String query = "Select t1.id, t1.username1, t2.fullname, t3.title, t3.description, t3.quantity, t1.username2, t1.item1_id , t1.item2_id, t1.status, t4.fullname as fullname2, t5.title as title2, t5.description as description2, t5.quantity as quantity2 from transaction t1 INNER JOIN user_table t2 ON t1.username1 = t2.username INNER JOIN item t3 ON t1.item1_id = t3.id INNER JOIN user_table t4 ON t1.username2 = t4.username INNER JOIN item t5 ON t1.item2_id = t5.id where t1.username2='" + user.toString() + "' and t1.status='pending'";

  Statement stm=null;
  ResultSet rst=null;
  stm = conn.createStatement();
  rst = stm.executeQuery(query);
 
 %>

<html>
<head>
<title>Xchange | My Transactions</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
</head>
	<body>
		<div class="wrap"> 
			<jsp:include page="/header/header_log_on.jsp" flush="true" />
		</div>
		
		<div class="main">
			<h1 class="form-4">YOUR TRANSACTIONS:</h1>
	        <table border=1 id="cust_table">
					<tr><th>Username</th><th>Full Name</th><th>Item Title</th><th>Item Description</th><th>Quantity</th><th>Trade/Remove</th></tr>
					<% while(rst.next()){ %>
						<tr>
                	<td align=center style="height:50px"><%= rst.getString("username1")%></td>
					<td align=center style="height:50px"><%= rst.getString("fullname")%></td>
					<td align=center><%= rst.getString("title")%></td>
                    <td align=center><%= rst.getString("description")%></td>
					<td align=center><%= rst.getString("quantity")%></td>
                    
					<td align=center rowspan="2"><form action="updatetransaction.jsp" name="updatetransaction" method="post">
							<input type="hidden" name="transactionID" value="<%= rst.getString("id")%>">
						<input type="submit" name="remove" value="remove">
						</form>
					 </td>
 
				</tr>
				<tr>
                	<td align=center style="height:50px"><%= rst.getString("username2")%></td>
					<td align=center style="height:50px"><%= rst.getString("fullname2")%></td>
					<td align=center><%= rst.getString("title2")%></td>
                    <td align=center><%= rst.getString("description2")%></td>
					<td align=center><%= rst.getString("quantity2")%></td>
 
					<% } %>
				</table>
	            

	            <h1 class="form-4">TRANSACTIONS YOU SHOULD ANSWER:</h1>

             <%	
			  query = "Select t1.id, t1.username1, t2.fullname, t3.title, t3.description, t3.quantity, t1.username2, t1.item1_id , t1.item2_id, t1.status, t4.fullname as fullname2, t5.title as title2, t5.description as description2, t5.quantity as quantity2 from transaction t1 INNER JOIN user_table t2 ON t1.username1 = t2.username INNER JOIN item t3 ON t1.item1_id = t3.id INNER JOIN user_table t4 ON t1.username2 = t4.username INNER JOIN item t5 ON t1.item2_id = t5.id where t1.username1='" + user.toString() + "' and t1.status='pending'";
			  
			  stm=null;
			  rst=null;
			  stm = conn.createStatement();
			  rst = stm.executeQuery(query);
			 
			 %>
			 	<table border=1 id="cust_table">
					<tr><th>Username</th><th>Email</th><th>Full Name</th><th>Item Title</th><th >Item Description</th><th>Quantity</th></tr>
				 	<% while(rst.next()){ %>
					<tr>
						<td align=center style="height:50px"><%= rst.getString("username2")%></td>
						<td align=center style="height:50px"><%= rst.getString("fullname2")%></td>
						<td align=center><%= rst.getString("title2")%></td>
						<td align=center><%= rst.getString("description2")%></td>
						<td align=center><%= rst.getString("quantity2")%></td>
						
						<td align=center rowspan="2"><form action="updatetransaction.jsp" name="updatetransaction" method="post">
							<input type="hidden" name="transactionID" value="<%= rst.getString("id")%>">
							<input type="submit" name="confirm" value="confirm"><br><br>
							<input type="submit" name="remove" value="remove">
							</form>
						 </td>
	 
					</tr>
					<tr>
						<td align=center style="height:50px"><%= rst.getString("username1")%></td>
						<td align=center style="height:50px"><%= rst.getString("fullname")%></td>
						<td align=center><%= rst.getString("title")%></td>
						<td align=center><%= rst.getString("description")%></td>
						<td align=center><%= rst.getString("quantity")%></td>
	 
					</tr>
					<% } %>
				</table>

			<h1 class="form-4">TRANSACTIONS COMPLETED:</h1>
             <%	
			  query = "Select t1.id, t1.username1, t2.fullname, t2.email, t3.title, t3.description, t3.quantity, t1.username2, t1.item1_id , t1.item2_id, t1.status, t4.fullname as fullname2, t4.email as email2, t5.title as title2, t5.description as description2, t5.quantity as quantity2 from transaction t1 INNER JOIN user_table t2 ON t1.username1 = t2.username INNER JOIN item t3 ON t1.item1_id = t3.id INNER JOIN user_table t4 ON t1.username2 = t4.username INNER JOIN item t5 ON t1.item2_id = t5.id where (t1.username1='" + user.toString() + "' and t1.status='confirmed') or (t1.username2='" + user.toString() + "' and t1.status='confirmed')";
			  
			  stm=null;
			  rst=null;
			  stm = conn.createStatement();
			  rst = stm.executeQuery(query);
			 
			 %>
			
	        <table border=1 id="cust_table">
					<tr><th>Username</th><th>Full Name</th><th>Item Title</th><th>Description</th><th>Quantity</th><th>Trade/Remove</th></tr>
					<% while(rst.next()){ %>
					<tr>
						<td align=center style="height:50px"><%= rst.getString("username2")%></td>
						<td align=center style="height:50px"><%= rst.getString("email2")%></td>
						<td align=center style="height:50px"><%= rst.getString("fullname2")%></td>
						<td align=center><%= rst.getString("title2")%></td>
						<td align=center><%= rst.getString("description2")%></td>
						<td align=center><%= rst.getString("quantity2")%></td>
	 
					</tr>
					<tr>
						<td align=center style="height:50px"><%= rst.getString("username1")%></td>
						<td align=center style="height:50px"><%= rst.getString("email")%></td>
						<td align=center style="height:50px"><%= rst.getString("fullname")%></td>
						<td align=center><%= rst.getString("title")%></td>
						<td align=center><%= rst.getString("description")%></td>
						<td align=center><%= rst.getString("quantity")%></td>
	 
					</tr>
					<% } %>
				</table>
			<%
			  rst.close();
			  stm.close();
			  conn.close();
			}%>

		</div>
    <jsp:include page="footer/footer.jsp" flush="true" />
</body>
</html>