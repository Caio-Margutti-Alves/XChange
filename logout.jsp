<%
Object user = session.getAttribute("username");
 if(user == null)
	response.sendRedirect("index.jsp");
 else {
%>

<html>

	<head>
		<title>Logout</title>
	</head>

	<body>
		<%
		session.invalidate();
		response.sendRedirect("index.jsp");
		%>
	</body>

</html>
<% } %>