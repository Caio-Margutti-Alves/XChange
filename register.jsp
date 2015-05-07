<%@page import="java.io.*"%>
<%
 if(session.getAttribute("username") != null)
	response.sendRedirect("index.jsp");
 else {
%>

<!DOCTYPE HTML>
<html>
<head>
<title>Xchange | Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Lato:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script src="js/jquery.min.js"></script>
<!---strat-slider---->

	<script language="JavaScript">
		function validateLogup(){
		  if(document.logonForm.username.value == ""){
			alert("Please enter username");
			document.logonForm.username.focus();
			return;
		  }
		  if(document.logonForm.password.value == ""){
			alert("Please enter password");
			document.logonForm.password.focus();
			return;
		  }
		  if(document.logonForm.fullname.value == ""){
			alert("Please enter full name");
			document.logonForm.fullname.focus();
			return;
		  }
		  if(document.logonForm.email.value == ""){
			alert("Please enter email");
			document.logonForm.email.focus();
			return;
		  }
		  if(document.logonForm.username.value.indexOf(" ") != -1){
			alert("Username cannot have space");
			document.logonForm.username.focus();
			return;
		  }
		  if(document.logonForm.password.value.length< 5 ||
			   document.logonForm.password.value.length > 15  ){
			alert("The length of password should be between 5 and 15");
			document.logonForm.password.focus();
			return;
		  }
		  document.logonForm.submit();
		}
	</script>
</head>

<body>
	<div class="wrap"> 
		<jsp:include page="/header/header.jsp" flush="true" />
	</div>
	 <div class="main">
	     <div class="wrap">

			<%  
				String usernameTaken = request.getParameter("insert"); 
				if(usernameTaken!=null)
					out.println(usernameTaken);
			%></p>
			
			<form name="logonForm" action="signup.jsp" method="post" class="form-4">
						<h1>PLEASE REGISTER YOURSELF:</h1>
	    				<p>
	       					<label for="login">Username</label>
							<input type="text" name="username" placeholder="Username" required>
	    				</p>
	    				<p>
	       					<label for="password">Password</label>
							<input type="password" name="password" placeholder="Password" required>
	    				</p>
						<p>
						    <label for="login">Full Name</label>
						    <input type="text" name='fullname' placeholder="Full Name" required> 
						</p>
						<p>
						    <label for="login">Email</label>
						    <input type="text" name='email' placeholder="Email" required> 
						</p>
						<p>
	        				<input type="button" value="Register" onClick="JavaScript:validateLogup()">
						</p>
			</form>	
		</div>

	<jsp:include page="/footer/footer.jsp" flush="true" />
</body>
</html>
<% } %>