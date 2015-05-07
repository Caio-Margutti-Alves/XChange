<%@include file="db.jsp" %>
<% 
 Object user = session.getAttribute("username");
 String query = null;
 if(user == null)
	response.sendRedirect("index.jsp");
 else {

 query = "Select * from user_table where username='" + user.toString() + "'";

  Statement stm=null;
  ResultSet rst=null;
  stm = conn.createStatement();
  rst = stm.executeQuery(query);
%>

<html>
<head>
<title>Xchange | Profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
	
		
	<script language="JavaScript">
		function validateForm(password){
		  if(document.updateProfile.fullname.value == ""){
			alert("Please enter full name");
			document.updateProfile.fullname.focus();
			return;
		  }
		
		  else if(document.updateProfile.email.value == ""){
			alert("Please enter email");
			document.updateProfile.email.focus();
			return;
		  }

		  else if(document.updateProfile.oldpassword.value != password){
			alert("Old Password is Wrong");
			document.updateProfile.oldpassword.focus();
			return;
		  }

		  else if(document.updateProfile.newpassword.value == ""){
			alert("Please enter new password");
			document.updateProfile.newpassword.focus();
			return;
		  }

		  else if(document.updateProfile.newpassword.value.length< 5 ||
			   document.updateProfile.newpassword.value.length > 15  ){
			alert("The length of new password should be between 5 and 15");
			document.updateProfile.newpassword.focus();
			return;
		  }
		  document.updateProfile.submit();
		}
	</script>
		
</head>
	<body>
		<div class="wrap"> 
			<jsp:include page="/header/header_log_on.jsp" flush="true" />
		</div>
		<div class="main">
			<% rst.next(); %>
				<form name="updateProfile" action="updateprofile.jsp" method="post" class="form-4">
					<h1>UPDATE YOUR INFORMATION</h1>
    				<p>
       					<label for="login">New Full Name</label>
						<input type="text" name="fullname" placeholder="Fullname" value="<%= rst.getString("fullname") %>" required>
    				</p>
    				<p>
       					<label for="login">Change Email</label>
						<input type="text" name="email" placeholder="Email" value="<%= rst.getString("email") %>" required>
    				</p>
    				<p>
					    <label for="password">Old Password</label>
					    <input type="password" name='oldpassword' placeholder="Old Password" required> 
					</p>
					<p>
					    <label for="password">New Password</label>
					    <input type="password" name='newpassword' placeholder="New Password" required> 
					</p>
					<p>
        				<input type="button" value="Update" onClick="JavaScript:validateForm(<%= rst.getString("password") %>)">
					</p>
				</form>
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