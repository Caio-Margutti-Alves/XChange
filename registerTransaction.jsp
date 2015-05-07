<%@include file="db.jsp" %>
<%
	String username1 = request.getParameter("username1");
	String username2 = request.getParameter("username2");
	String item1_id = request.getParameter("item1_id");
	String item2_id = request.getParameter("item2_id");
	
	
	if(item1_id == null)
		response.sendRedirect("index.jsp");
 	else {
	
	String query="INSERT INTO transaction (username1, username2, item1_id, item2_id, status) VALUES ('"+username1+"', '"+username2+"', "+item1_id+", "+item2_id+", 'pending')";

	Statement stm=null;
	stm = conn.createStatement();
	stm.executeUpdate(query);
%>

<html>
	<head>
		<title>New Transaction Request</title>
	</head>
	
	<body>
		<form action="index.jsp" id="transactionRegistered" method="post"> 
			<input type="hidden" name="insert" value="Transaction registered!"> 
		</form>
		<script language="JavaScript">
			document.getElementById("transactionRegistered").submit();
		</script>
	</body>
</html>
<% 	stm.close();
	conn.close();
} %>