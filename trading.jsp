<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@include file="db.jsp" %>
<% 
 Object user = session.getAttribute("username");
 String username1 = request.getParameter("username1");
 String item1_id = request.getParameter("item1_id");
 if(user == null || username1==null)
	response.sendRedirect("index.jsp");
 else {

 String query = "Select * from item where owner_username='" + user.toString() + "'";

  Statement stm=null;
  ResultSet rst=null;
  stm = conn.createStatement();
  rst = stm.executeQuery(query);
%>

<html>
<head>
<title>Xchange | Trading</title>
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
			
			<h1 class="form-4">TRADING:</h1>
			<table border=1 id="cust_table">
				<tr><th>Title</th><th>Description</th><th>Quantity</th><th>Remove</th></tr>
				<% while(rst.next()){ %>
				<tr>
					<td align=center style="height:50px"><%= rst.getString("title")%></td>
					<td align=center><%= rst.getString("description")%></td>
					<td align=center><%= rst.getString("quantity")%></td>
					<td align=center><form action="registerTransaction.jsp" method="post">
						<input type="hidden" name="username1" value="<%= username1%>">
						<input type="hidden" name="item1_id" value="<%= item1_id%>">
						<input type="hidden" name="username2" value="<%= user.toString()%>">
						<input type="hidden" name="item2_id" value="<%= rst.getInt("id")%>">
						<input type="submit" value="Trade">
						</form>
					 </td>
				</tr>
				<% } %>
				
			</table>

		<%
		  rst.close();
		  stm.close();
		  conn.close();
		%>
		</div>
    <jsp:include page="footer/footer.jsp" flush="true" />
	</body>
</html>
<% } %>