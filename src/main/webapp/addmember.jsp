<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"    import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style> 
input[type=text],input[type=password], [type=date]{
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
<title>add member</title>
</head>
<body>
<%@ include file="userHome.jsp" %>
<% if ("POST".equalsIgnoreCase(request.getMethod()))
                {
				 String uname=request.getParameter("user_name");
				 String pwd=request.getParameter("password");
				 String name=request.getParameter("name");
				 String address=request.getParameter("address");
				 String email=request.getParameter("email");
				 String mob =request.getParameter("mob") ;
				 char gender= request.getParameter("gender").charAt(0);
				Date date = Date.valueOf( request.getParameter("dob"));
						
	    	java.sql.Date d1 =new java.sql.Date(date.getTime());
			try
			{ Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
				PreparedStatement stmt = con.prepareStatement("select * from user where user_name=? ");
				stmt.setString(1,uname);
				
				ResultSet rs = stmt.executeQuery();
				
				if(rs.next())
				{
					out.println("User name already exit,User not created");
					
				}
				else{
					PreparedStatement stmt1 = con.prepareStatement("insert into user (user_name,password,user_type) values (?,?,0)");
						
					stmt1.setString(1,uname);
					stmt1.setString(2,pwd);
					
					stmt1.executeUpdate();

					 rs = stmt.executeQuery();
					
					if(rs.next())
					{
						int uid=rs.getInt("user_id");
						PreparedStatement stmt2 = con.prepareStatement("insert into user_details values (?,?,?,?,?,?,?)");
						
						stmt2.setInt(1, uid);
						stmt2.setString(2, name);
						stmt2.setString(3, address);
						stmt2.setString(4, email);
						stmt2.setString(5, mob);
						stmt2.setString(6,String.valueOf(gender));
						stmt2.setDate(7, d1);
						
						stmt2.executeUpdate();
						out.println(" <div align='center'> <h1>sucessfully add</h1> </div>");
					}
					
				}
			}
			catch (  ClassNotFoundException e )
            {
				// TODO Auto-generated catch block
				out.println(e.toString());
			}
		    catch ( Exception  e )
            {
				// TODO Auto-generated catch block
				out.println(e.toString());
			}
	    	
	    }
	
	
	

else{



%>
<div class="images" align ="center">
 <br>
<form action="addmember.jsp" name ="form1" method ="post">
<img src = "eLibLogo.png" alt ="loading"  height="100" width ="100"  ></img>
<table>

<tr>
<td>
<font>User Name:</font>
<input type="text" name ="user_name" required >

</tr>
<tr>
<td>
<font>password:</font>
<input type="password" name ="password" required>
<br>
</tr>
<tr>
<td>
<font>Name:</font>
<input type="text" name ="name" required>
<br>
</tr>
<tr>
<td>
<font>Address:</font>
<textarea rows="5" cols="20" name="address"></textarea>
<br>
</tr>
<tr>
<td>
<font>Email:</font>
<input type="text" name ="email" required>
<br>
</tr>
<tr>
<td>
<font>Mobile:</font>
<input type="text" name ="mob" required>
<br>
</tr>



<tr>
<td>
<font>Date of birth:</font>
<input type="date" name ="dob" required>
<br>
</tr>


<tr>
<td>
<font>gender:</font>
<input type="radio" name ="gender" value="m" require>
<font>Male:</font>
<input type="radio" name ="gender" value="f" require>
<font>Female:</font>
<input type="radio" name ="gender" value="o" require>
<font>other:</font>
<br>
</tr>


<tr></tr><tr><td>
<input type="submit" value ="submit">
<input type="reset" value ="Cancel">
</tr>

</table></form></div>
<%  } %>


</body>
</html>