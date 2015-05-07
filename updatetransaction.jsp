<%@include file="db.jsp" %>
<%
 String confirm = request.getParameter("confirm");
 String remove = request.getParameter("remove");
 String transactionID = request.getParameter("transactionID");
 
 ResultSet rst = null;
 Statement stm = null;

 if( confirm==null && remove==null )
	response.sendRedirect("index.jsp");
 else {

	if(confirm == null) {
		String query = "Delete from transaction where id=" + transactionID;
		stm = conn.createStatement();
		stm.executeUpdate(query);
	}
	else {
		String query = "Update transaction set status='confirmed' where id=" + transactionID;
		stm = conn.createStatement();
		stm.executeUpdate(query);
	
		query = "Select * from transaction where id=" + transactionID;
		
		stm = conn.createStatement();
		rst = stm.executeQuery(query);
		
		rst.next();
		
		query = "Update item set owner_username='" + rst.getString("username1") + "' where id=" + rst.getString("item2_id");
		stm = conn.createStatement();
		stm.executeUpdate(query);
		
		query = "Update item set owner_username='" + rst.getString("username2") + "' where id=" + rst.getString("item1_id");
		stm = conn.createStatement();
		stm.executeUpdate(query);
		
		rst.close();
	}
%>


<html>
	<head>
		<title>Update Transaction</title>
	</head>
	
	<body>
		<form action="index.jsp" id="profileUpdated" method="post"> 
			<input type="hidden" name="insert" value="Transaction updated!"> 
		</form>
		<script language="JavaScript">
			document.getElementById("profileUpdated").submit();
		</script>
	</body>
</html>
<%
	  stm.close();
	  conn.close();
} %>
