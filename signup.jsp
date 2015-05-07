<%@include file="db.jsp" %>
<%
Object user = session.getAttribute("username");
String username = request.getParameter("username");
String userpassword = request.getParameter("password");
String fullname = request.getParameter("fullname");
String email = request.getParameter("email");

 if(username == null)
	response.sendRedirect("index.jsp");
 else {

  Statement stm=null;
  ResultSet rst=null;
  stm = conn.createStatement();
%>
<html>
	<head>
		<title>Log Up Verification</title>
	</head>
	
	<body>
<%	

	String query="Select * from user_table value where username='" + username + "'";
	rst = stm.executeQuery(query);
	
	if(rst.isBeforeFirst()) { %> 
			<form action="register.jsp" id="usernameTaken" method="post"> 
				<input type="hidden" name="insert" value="This Username Has Already been taken!"> 
			</form>
			<script language="JavaScript">
				document.getElementById("usernameTaken").submit();
			</script>
<%		return;
	}

	query="Insert into user_table value ('" + username + "','" + userpassword + "','" + fullname + "','" + email + "')";
	stm = conn.createStatement();
	stm.executeUpdate(query);
	
	rst.close();
	stm.close();
	conn.close();
%> 
		<form action="index.jsp" id="usernameCreated" method="post"> 
			<input type="hidden" name="insert" value="User <% out.println(username); %> created!"> 
		</form>
		<script language="JavaScript">
			document.getElementById("usernameCreated").submit();
		</script>
	</body>
</html>
<% } %>