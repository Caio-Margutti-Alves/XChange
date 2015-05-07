<%@include file="db.jsp" %>
<%
String id = request.getParameter("id");

 if(id == null)
	response.sendRedirect("index.jsp");
 else {

  String query="DELETE from item where id=" + id;
  Statement stm = conn.createStatement();
  stm.executeUpdate(query);
%>


<html>
	<head>
		<title>Delete Item</title>
	</head>
	
	<body>
		<form action="myitens.jsp" id="itemDeleted" method="post"> 
			<input type="hidden" name="insert" value="Item deleted!"> 
		</form>
		<script language="JavaScript">
			document.getElementById("itemDeleted").submit();
		</script>
	</body>
</html>
<% } %>
