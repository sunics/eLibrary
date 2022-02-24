<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"    import="java.sql.*"%>
    
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
<title> E-LIB</title>
</head>
<body>

<%if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Form was submitted and write code for evaluation of form.
    String name=request.getParameter("user_name");
	String pwd=request.getParameter("password");
   // out.println("<h1>LOGIN PROCCESING</h1>");
                Connection con=null;
			    try 
			    {
						Class.forName("com.mysql.cj.jdbc.Driver");
						System.out.println("conected Driver");
		                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
		                PreparedStatement prst = con.prepareStatement("select * from user where user_name=? and password=? and status=1");
		                prst.setString(1, name);
		                prst.setString(2, pwd);
		                ResultSet rs= prst.executeQuery();
		                if(rs.next()){
		                	/* out.println(" <div>");
		                	out.println("<img src ='G:\\eLibLogo.png' alt ='loading'  height='100' width ='100'  ></img>");	 
		                	out.println("<h1>valid user login successfully</h1>");
		                	out.println("<h3>user name: "+rs.getString("user_name"));
		                    out.println("<br>user type: "+rs.getInt("user_type")+"</h3>");
		                    out.println("</div> "); */
		                    session.setAttribute("UN", name);
		                    session.setAttribute("ut",rs.getInt("user_type") );
		                    response.sendRedirect("userHome.jsp");
		                }
		                else{
		                	
		                	
		                	out.println("<div align='center'><h3>Invalid Credentials</h3></div>");
		                }
				}
			    catch (  ClassNotFoundException e )
                {
					// TODO Auto-generated catch block
					System.out.println(e);
				}
			    catch ( SQLException  e )
                {
					// TODO Auto-generated catch block
					System.out.println(e);
				}
} else {
    // display the form

 %>

 
   
 <div class="images" align ="center">
 <br>
<form action="Login.jsp" name ="form1" method ="post">
<img src = "eLibLogo.png" alt ="loading"  height="100" width ="100"  ></img>
<table>

<tr>
<td>
<font>login ID:</font>
<input type="text" name ="user_name" required >

</tr>
<tr>
<td>
<font>password:</font>
<input type="password" name ="password" required>
<br>
</tr>


 
<tr></tr><tr><td>
<input type="submit" value ="Login  ">
<input type="reset" value ="Cancel">
</tr>



</table>

</form>

</div>
 
<% } %>


</body>
</html>