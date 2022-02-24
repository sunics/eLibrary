<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head><style type="text/css">
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
<title>Change password</title>

<script>
	function validateForm() {
		let x = document.forms["form1"]["new"].value;
		let y = document.forms["form1"]["confirm"].value;
		
		alert(x===y);
		if (x===y) {
			
			return true;
		}
		else{
			
			
			return false;
		}
	}
</script>

</head>
<body>
<%@ include file="userHome.jsp" %>
<%if ("POST".equalsIgnoreCase(request.getMethod())) {
	String oldPass = request.getParameter("old");
	String newPass= request.getParameter("new");
	String confirmPass = request.getParameter("confirm");
	String unmae = session.getAttribute("UN").toString();
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
		PreparedStatement stmt = con.prepareStatement("update user set password = ? where user_name=?");
		
		
		stmt.setString(1,newPass);
		stmt.setString(2,unmae);
		
		stmt.executeUpdate();
		
	}catch(Exception e){
		
		out.println(e.toString());
		
	}}
else{%>
	
	
	<div class="images" align ="center">
 <br>
<form action="password.jsp" name ="form1" method ="post"  onsubmit="return validateForm()">
<img src = "eLibLogo.png" alt ="loading"  height="100" width ="100"  ></img>
<table>

<tr>
<td>
<font>Old Password:</font>
<input type="password" name ="old" required >

</td></tr>
<tr>
<td>
<font>new Password:</font>
<input type="password" name ="new" required >

</td></tr>
<tr>
<td>
<font>Confirm new Password:</font>
<input type="password" name ="confirm" required >

</td></tr>

<tr></tr><tr><td>
<input type="submit" value ="SUBMIT">
<input type="reset" value ="Cancel">
</tr>
</table>
</form>
</div>
	
	
	
	
	
	<%} %>
</body>
</html>