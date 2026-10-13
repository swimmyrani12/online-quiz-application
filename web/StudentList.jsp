<%--Document : StudentList--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.StudentsDao"%>
<%@page import="db.Students"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h3 class="text-center text-primary mb-3">List of all Students</h3>

    <%-- Success or Error Message if passed from actions --%>
    <% if(request.getParameter("msg1") != null) { %>
        <div class="alert alert-success py-2 text-center" role="alert">
            <%= request.getParameter("msg1") %>
        </div>
    <% } %>
    <% if(request.getParameter("msg2") != null) { %>
        <div class="alert alert-danger py-2 text-center" role="alert">
            <%= request.getParameter("msg2") %>
        </div>
    <% } %>

    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th style="width: 8%;">s no.</th>
                <th style="width: 25%;">User Id</th>
                <th style="width: 25%;">Name</th>
                <th style="width: 22%;">Password</th>
                <th style="width: 10%;">Update</th>
                <th style="width: 10%;">Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            int i = 1;
            ArrayList<Students> allstudents = StudentsDao.getAllRecords();
            for(Students e : allstudents) {
        %>
            <tr>
                <td><%=i++%></td>
                <td><%=e.getUsername()%></td>
                <td><%=e.getName()%></td>
                <td><%=e.getPassword()%></td>
                <td>
                    <a class="btn btn-sm btn-outline-warning" href="updatestudent.jsp?username=<%=e.getUsername()%>">Update</a>
                </td>
                <td>
                    <a class="btn btn-sm btn-outline-danger" href="deletestudent.jsp?username=<%=e.getUsername()%>" onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="d-flex justify-content-between my-3">
        <input type="button" value="Add Student" class="btn btn-outline-success" onclick="location.href='AddStudent.jsp'">
        <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>