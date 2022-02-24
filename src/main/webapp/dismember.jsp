<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>

<style>
input[type=text],input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid crimson;
  border-radius: 4px;
   font-family: verdana;
    font-size: 20px;
}


select{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 2px solid crimson;
  border-radius: 4px;
   font-family: verdana;
    font-size: 20px;
}

 input[type=submit], input[type=reset] {
  background-color: crimson;
  border: none;
  color: white;
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
<title>Disable Member</title>
</head>
<body>

<%@ include file="userHome.jsp" %>
<%if ("POST".equalsIgnoreCase(request.getMethod())) {
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");

		PreparedStatement stmt = con.prepareStatement("update user set status=? where user_name=?");
		String uname =request.getParameter("uname");
		String option =request.getParameter("se");
		if(option.equals("disable")){
			stmt.setInt(1, 0);
		}
		else{
			stmt.setInt(1, 1);
		}
		stmt.setString(2, uname);
		stmt.executeUpdate();
		out.print("<div><h1>user status changes...</h1></div>");
		}catch(Exception e)
	{
	out.println(e.toString());
	}
	
	
	
}else{ %>
 <div class="images" align ="center">
 <br>
<form action="dismember.jsp" name ="form1" method ="post">
<img src = "eLibLogo.png" alt ="loading"  height="100" width ="100"  ></img>
<table>

<tr>
<td>
<font>User Name:</font>
<input type="text" name ="uname" required >

</td></tr>
<tr>
<td>
<font> option:</font>
<select name="se">
 		<option value="select">select</option>
 		<option value="unable">unable</option>
 		<option value="disable">disable</option>
 
	</select>
	</tr>
	<tr></tr><tr><td>
<input type="submit" value ="Add">
<input type="reset" value ="Cancel">
</tr>
</table>
</form>
</div>
<%} %>
</body>
</html>



