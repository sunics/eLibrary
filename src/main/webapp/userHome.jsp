<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[type=text],input[type=password],[type=number], [type=date]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid brown;
  border-radius: 4px;
   font-family: verdana;
    font-size: 20px;
    border-radius:20px;
}
textarea{

 width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid brown;
  border-radius: 4px;
   font-family: verdana;
    font-size: 20px;
border-radius:20px;
}
 input[type=submit], input[type=reset] {
  background-color: deepskyblue;
  border: none;
  color: black;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
   font-family: verdana;
    font-size: 20px;
    border-radius:20px;
}

.images {
  background-image: url("booka.jpeg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
   
  }
  
  div {
  height: 500px;
   background-image:url("booka.jpeg");
   
}

body{
background-color:crimson;
color: white;

font-family: verdana;

}

table{
background-color:crimson;
border: none;
  color: white;
font-family: verdana;
    font-size: 20px;
    border-radius:10px;
}

</style>
<meta charset="ISO-8859-1">
<title>Home</title>

</head>
<body>

<%
		String uName= session.getAttribute("UN").toString();
		String userType = session.getAttribute("ut").toString();
		
		int ut=Integer.parseInt(userType);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

			PreparedStatement stmt = con.prepareStatement("select * from user_menu where user_Role="+ut);
			
			ResultSet rst = stmt.executeQuery();
			
			while(rst.next()){
				out.println("<a href="+rst.getString("url")+">"+rst.getString("Menu_Item")+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
				
			}
			//out.println("<div></div>");
		}
		catch(Exception e)
		{
			out.println(e.toString());
		}
	%>
</body>
</html>