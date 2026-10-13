<%--Document : InstructionList--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.InstructionsDao"%>
<%@page import="db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Instructions List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-4">
    <h3 class="text-center text-primary mb-3">List of all Instructions</h3>

    <%-- Success/Error Alert Messages --%>
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

    <table class="table table-bordered table-hover bg-white shadow-sm">
        <thead class="thead-dark">
            <tr>
                <th style="width: 8%;" class="text-center">s no.</th>
                <th style="width: 72%;">Instruction</th>
                <th style="width: 10%;" class="text-center">Update</th>
                <th style="width: 10%;" class="text-center">Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            int i = 1;
            ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
            if (allinsts != null && !allinsts.isEmpty()) {
                for (Instructions e : allinsts) {
                    String encodedInst = URLEncoder.encode(e.getInstruction(), "UTF-8");
        %>
            <tr>
                <td class="text-center font-weight-bold"><%= i++ %></td>
                <td><%= e.getInstruction() %></td>
                <td class="text-center">
                    <a class="btn btn-sm btn-outline-warning" href="updateinstruction.jsp?inst=<%= encodedInst %>">Update</a>
                </td>
                <td class="text-center">
                    <a class="btn btn-sm btn-outline-danger" href="deleteinstruction.jsp?inst=<%= encodedInst %>" onclick="return confirm('Are you sure you want to delete this instruction?');">Delete</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="4" class="text-center text-muted py-3">No instructions found.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="d-flex justify-content-between my-3">
        <input type="button" class="btn btn-success px-4" value="Add Instruction" onclick="location.href='AddInstruction.jsp'">
        <input type="button" class="btn btn-outline-danger px-4" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>