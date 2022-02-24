<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"    import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style> 
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

</style>
<meta charset="ISO-8859-1">
<title>add book</title>
</head>
<body>
<%@ include file="userHome.jsp" %>
<% if ("POST".equalsIgnoreCase(request.getMethod()))
                {
	 String title=request.getParameter("title");
	 String author=request.getParameter("author");
	 String Edition=request.getParameter("Edition");
	 String Publication=request.getParameter("Publication");
	 int Price=Integer.parseInt(request.getParameter("Price"));
	 try
		{ Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
			PreparedStatement stmt1 = con.prepareStatement("insert into books(author,title,Edition,price,Publication)values(?,?,?,?,?)");
	         
			stmt1.setString(1,	author);
			stmt1.setString(2, title);
			stmt1.setString(3,Edition);
			stmt1.setInt(4,Price);
			stmt1.setString(5,Publication);
			stmt1.executeUpdate();
			out.println(" <div align='center'> <h1>sucessfully add</h1> </div>");
			
			
	          
		}catch (  ClassNotFoundException e )
     {
			// TODO Auto-generated catch block
			out.println(e.toString());
		}
	    catch ( Exception  e )
     {
			// TODO Auto-generated catch block
			out.println(e.toString());
		}
	
                }else{
                
                
                
                
                %>
         <div class="images" align ="center">
 <br>
<form action="addbook.jsp" name ="form1" method ="post">
<img src = "eLibLogo.png" alt ="loading"  height="100" width ="100"  ></img>
<table>

<tr>
<td>
<font>Title:</font>
<input type="text" name ="title" required >

</tr>
<tr>
<td>
<font> Author:</font>
<input type="text" name ="author" required>
<br>
</tr>
<tr>
<td>
<font>Edition:</font>
<input type="text" name ="Edition" required>
<br>
</tr>
<tr>
<td>
<font>Price:</font>
<input type="number" name ="Price" required>
<br>
</tr>
<tr>
<td>
<font> Publication:</font>
<textarea rows="5" cols="20" name="Publication"></textarea>
<br>
</tr>


<tr></tr><tr><td>
<input type="submit" value ="Add">
<input type="reset" value ="Cancel">
</tr>

</table></form></div>       
                
                <%} %>

</body>
</html>