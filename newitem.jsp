<%@include file="db.jsp" %>
<%
String title = request.getParameter("title");
String description = request.getParameter("description");
String quantity = request.getParameter("quantity");

 if(title == null)
	response.sendRedirect("index.jsp");
 else {
 
 String owner_username = session.getAttribute("username").toString();
 
  String query="INSERT INTO item (title,description,quantity,owner_username) VALUES ('"+title+"','"+description+"',"+quantity+",'"+owner_username+"')";
  Statement stm = conn.createStatement();
  stm.executeUpdate(query);
%>


<html>
	<head>
		<title>New Item Verification</title>
	</head>
	
	<body>
		<form action="index.jsp" id="itemCreated" method="post"> 
			<input type="hidden" name="insert" value="Item <% out.println(title); %> created!"> 
		</form>
		<script language="JavaScript">
			document.getElementById("itemCreated").submit();
		</script>
	</body>
</html>
<% } %>
