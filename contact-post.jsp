<%@ pageimport="java.io.*,java.util.*,javax.mail.*"%>
 <%@ pageimport="javax.mail.internet.*,javax.activation.*"%> 
 <%@ pageimport="javax.servlet.http.*,javax.servlet.*" %> 

 <% 

  String host = "localhost";
String to = "xchangeltda@gmail.com";
String from = request.getParameter("from"); 
String subject = request.getParameter("subject"); 
String messageText = request.getParameter("body");

 Properties properties = System.getProperties();
  properties.setProperty("mail.smtp.host", host); 
  Session mailSession = Session.getDefaultInstance(properties); 
  Try { MimeMessage message = new MimeMessage(mailSession);
   message.setFrom(new InternetAddress(from)); 
   message.addRecipient(Message.RecipientType.TO, new InternetAddress(toRecepient));
    message.setSubject("This is the Subject Line!"); 
    message.setContent("<h1>This messageis actual </h1>", "text/html" ); 
    Transport.send(message); result = "Succesfully send the message...."; 
}catch (MessagingExceptionmex) { 
mex.printStackTrace(); 
result = "Sending failed...."; } 
%> 

<html> 
<head> 
	<title>Send HTML Email using JSP</title>
	 </head>
	  <body>
	   <center>
	    <h1>Send Email using JSP</h1>
	     </center>
	      <p align="center"> <% out.println("Result: " + result + "\n"); %> </p> 
	  </body> 
	  </html>
