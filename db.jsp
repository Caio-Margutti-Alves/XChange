<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<% String url = "jdbc:mysql://localhost:3306/xchange";
 String usernameDB="root";
 String passwordDB="root";
 Connection  conn=null;
 String classPath = "com.mysql.jdbc.Driver";
 try{
    Class.forName(classPath);
    conn = DriverManager.getConnection(url,usernameDB,passwordDB);
  }catch(Exception exc){
    out.println(exc.toString());
  }
%>