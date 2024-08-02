<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
    <% 
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demoservlet","postgres","Kalinda@2002");
        pst = con.prepareStatement("delete from student where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();  
        
        %>
        <script>
            
            alert("Record Deletee");
            
       </script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Portal</title>
</head>
<body>

</body>
</html>