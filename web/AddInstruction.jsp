<%--Document : AddInstruction--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Instructions</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 600px;">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">Add New Instruction</h4>
        </div>

        <div class="card-body p-4">
            <%-- Status Messages --%>
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

            <form action="oes.controller.InstructionInsert" method="post">
                <div class="form-group">
                    <label for="inst"><b>Instruction Text:</b></label>
                    <textarea class="form-control" id="inst" name="inst" rows="3" placeholder="Enter instructions for students" required></textarea>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <input type="button" onclick="location.href='InstructionList.jsp'" value="Back" class="btn btn-outline-secondary px-3">
                    <input type="button" onclick="location.href='AdminPanel.jsp'" value="Home" class="btn btn-outline-info px-3">
                    <input type="submit" value="Add Instruction" class="btn btn-success px-4">
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>