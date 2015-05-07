<%@include file="db.jsp" %>
<%
 String email = request.getParameter("email");
 String fullname = request.getParameter("fullname");
 String newpassword = request.getParameter("newpassword");
 String query = null;
 Object user = session.getAttribute("username");
 Statement stm = null;

 if( user == null || (email == null && fullname == null && newpassword == null))
	response.sendRedirect("index.jsp");
 else {

			query="Update user_table set password='" + newpassword + "' , fullname = '"+ fullname + "', email = '" + email + "' where username='" + user.toString() + "'";
			stm = conn.createStatement();
			stm.executeUpdate(query);
		} 
	
	  stm.close();
	  conn.close();
%>


<html>
	<head>
		<title>Update Profile</title>
	</head>
	
	<body>
		<form action="profile.jsp" id="profileUpdated" method="post"> 
			<input type="hidden" name="insert" value="Profile updated!"> 
		</form>
		<script language="JavaScript">
			document.getElementById("profileUpdated").submit();
		</script>
	</body>
</html>
