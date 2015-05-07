<%@include file="db.jsp" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

 if(username == null)
	response.sendRedirect("index.jsp");
 else {

  String query = "select * from user_table where username = '"+username+"'";

  Statement stm=null;
  ResultSet rst=null;
  stm= conn.createStatement();
  rst = stm.executeQuery(query);
%>
<HTML>
<HEAD>
<TITLE>Logon verification</TITLE>
</HEAD>
<BODY>

<%

		if(rst.isBeforeFirst()) {
			boolean found = false;
			while(rst.next()) {
				if (password.equals(rst.getString("password"))){
					session.setAttribute("username", username);
					response.sendRedirect("index.jsp");
					found = true;
				}
			}
			if(!found) {
%>
					<form action="index.jsp" id="wrongPassword" method="post"> 
						<input type="hidden" name="insert" value="Wrong password!"> 
					</form>
					<script language="JavaScript">
						document.getElementById("wrongPassword").submit();
					</script>
<%		}}
		else {
%>
					<form action="index.jsp" id="usernameNotFound" method="post"> 
						<input type="hidden" name="insert" value="Username not found!"> 
					</form>
					<script language="JavaScript">
						document.getElementById("usernameNotFound").submit();
					</script>
<%		}

	 
		  rst.close();
		  stm.close();
		  conn.close();

%>

</BODY>
</HTML>

<% } %>
