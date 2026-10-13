<%--Document: StudentLogin--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style>
    body {
        background-color: #f8f9fa;
    }
    .login-container {
        max-width: 420px;
        margin: 80px auto;
        padding: 30px;
        background: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>

<div class="container">
    <div class="login-container">
        <h2 class="text-center text-primary mb-4">Student Login</h2>

        <%-- Error Message --%>
        <% if(request.getParameter("msg") != null) { %>
            <div class="alert alert-danger py-2 text-center" role="alert">
                <%= request.getParameter("msg") %>
            </div>
        <% } %>

        <%-- Success / Logout Message --%>
        <% if(request.getParameter("msg1") != null) { %>
            <div class="alert alert-success py-2 text-center" role="alert">
                <%= request.getParameter("msg1") %>
            </div>
        <% } %>

        <form action="oes.controller.ValidateStudent" method="post">
            <div class="form-group">
                <label for="uname">User ID</label>
                <input type="text" class="form-control" id="uname" name="uname" placeholder="Enter User ID" required>
            </div>

            <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" class="form-control" id="pass" name="pass" placeholder="Enter Password" required>
            </div>

            <div class="d-flex justify-content-between mt-4">
                <button type="button" class="btn btn-outline-secondary px-4" onclick="location.href='index.html'">Exit</button>
                <button type="submit" class="btn btn-primary px-4">Login</button>
            </div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>