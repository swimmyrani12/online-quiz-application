<%--Document : updatestudent--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.StudentsDao"%>
<%@page import="db.Students"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Update Student</title>
</head>
<body>
<div class="container mt-4">
  <h3 class="text-center text-primary mb-3">List of all Students</h3>
  
  <table class="table table-bordered table-hover">
    <thead class="thead-dark">
      <tr>
        <th>s no.</th>
        <th>User Id</th>
        <th>Name</th>
        <th>Password</th>
        <th>Update</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
    <%
       int i = 1;
       String selectedUser = request.getParameter("username");
       ArrayList<Students> allstudents = StudentsDao.getAllRecords();
       
       for(Students e : allstudents) {
           if(selectedUser != null && selectedUser.equals(e.getUsername())) {
    %>
        <tr class="table-primary">
          <td><%=i++%></td>
          <td colspan="5">
            <form action="updatestudentnow.jsp" method="get" class="form-inline d-flex justify-content-between">
              <input type="hidden" name="usernameoriginal" value="<%=e.getUsername()%>">
              <input type="text" class="form-control form-control-sm mr-2" name="uname" value="<%=e.getUsername()%>" required>
              <input type="text" class="form-control form-control-sm mr-2" name="name" value="<%=e.getName()%>" required>
              <input type="text" class="form-control form-control-sm mr-2" name="pass" value="<%=e.getPassword()%>" required>
              <input type="submit" class="btn btn-sm btn-primary mr-2" value="Save">
              <a href="updatestudent.jsp" class="btn btn-sm btn-secondary">Cancel</a>
            </form>
          </td>
        </tr>
    <%  
           } else { 
    %>
        <tr>
          <td><%=i++%></td>
          <td><%=e.getUsername()%></td>
          <td><%=e.getName()%></td>
          <td><%=e.getPassword()%></td>
          <td><a class="btn btn-sm btn-outline-warning" href="updatestudent.jsp?username=<%=e.getUsername()%>">Edit</a></td>
          <td><a class="btn btn-sm btn-outline-danger" href="deletestudent.jsp?username=<%=e.getUsername()%>">Delete</a></td>
        </tr>
    <%
           }
       }
    %>
    </tbody>
  </table>

  <div class="d-flex justify-content-between mt-3">
    <input type="button" class="btn btn-outline-success" value="Add Student" onclick="location.href='AddStudent.jsp'">
    <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
  </div>
</div>
</body>
</html>