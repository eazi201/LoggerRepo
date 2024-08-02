<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
    <% 
   if(request.getParameter("submit")!=null)
    {
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        String id = request.getParameter("id");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demoservlet","postgres","Kalinda@2002");
        pst = con.prepareStatement("insert into student(name,course,fee,id)values(?,?,?,?)");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();  
        
        %> 
    <script>   
        alert("Record Added");     
    </script> 
    <%             
    }
   %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Portal</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
 <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<h1>Student Registration System</h1>
        </br>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" > 
                    
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" name="name" id="name" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" id="course" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">ID</label>
                        <input type="text" class="form-control" placeholder="ID" name="id" id="id" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="100" width="100%">
                         <thead>
                             <tr>
                                    <th>Student Name</th>
                                    <th>Course</th>
                                    <th>Fee</th>
                                    <th>id</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("org.postgresql.Driver");
                                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/demoservlet","postgres","Kalinda@2002");
                                
                                  String query = "select * from student";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String id = rs.getString("id");
                                   %>
             
                             <tr>
                                 <td><%=rs.getString("name") %></td>
                                 <td><%=rs.getString("course") %></td>
                                 <td><%=rs.getString("fee") %></td>
                                 <td><%=rs.getString("id") %></td>
                                 <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                 <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>

            </div>  
        </div>


</body>
</html>