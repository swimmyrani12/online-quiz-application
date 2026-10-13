<%--Document : StudentInstructions--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.StudentsDao"%>
<%@page import="model.InstructionsDao"%>
<%@page import="db.Instructions"%>
<%@page import="java.util.ArrayList"%>

<%
    // Session validation
    Object userObj = session.getAttribute("username");
    if (userObj == null) {
        response.sendRedirect("StudentLogin.jsp?msg=Please login first");
        return;
    }
    String name = StudentsDao.getStudentName(userObj.toString());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Instructions</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="bg-warning py-2 mb-4 shadow-sm">
  <marquee behavior="alternate" scrollamount="6">
     <h3 class="text-success mb-0 font-weight-bold">Welcome <%= (name != null) ? name : userObj.toString() %></h3>
  </marquee>
</div>

<div class="container bg-white p-4 rounded shadow-sm">
    <h4 class="text-center text-danger font-weight-bold mb-4">Instructions to Students</h4>

    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
            <tr>
                <th style="width: 10%;">#</th>
                <th style="width: 90%;">Instruction</th>
            </tr>
        </thead>
        <tbody>
        <%
            int i = 1;
            ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
            if (allinsts != null && !allinsts.isEmpty()) {
                for (Instructions e : allinsts) {
        %>
            <tr>
                <td class="font-weight-bold text-center"><%= i++ %></td>
                <td><%= e.getInstruction() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="2" class="text-center text-muted">No instructions added yet.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="d-flex justify-content-between mt-4">
        <button type="button" class="btn btn-outline-danger btn-lg px-4" onclick="location.href='oes.controller.LogoutStudent'">Logout</button>
        <button type="button" class="btn btn-success btn-lg px-4" onclick="location.href='Exam.jsp'">Start Test</button>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>