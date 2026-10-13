<%--Document : AddQuestion--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Question</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-4" style="max-width: 700px;">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white text-center">
            <h4 class="mb-0">Add New Question</h4>
        </div>
        
        <div class="card-body">
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

            <form action="oes.controller.QuestionInsert" method="post">
                <div class="form-group">
                    <label><b>Question:</b></label>
                    <textarea class="form-control" name="Question" rows="3" placeholder="Enter question description" required></textarea>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label><b>Option A:</b></label>
                        <input type="text" class="form-control" name="option1" placeholder="Enter option A" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label><b>Option B:</b></label>
                        <input type="text" class="form-control" name="option2" placeholder="Enter option B" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label><b>Option C:</b></label>
                        <input type="text" class="form-control" name="option3" placeholder="Enter option C" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label><b>Option D:</b></label>
                        <input type="text" class="form-control" name="option4" placeholder="Enter option D" required>
                    </div>
                </div>

                <div class="form-group">
                    <label><b>Correct Answer:</b></label>
                    <select class="form-control" name="answer" required>
                        <option value="a">Option A</option>
                        <option value="b">Option B</option>
                        <option value="c">Option C</option>
                        <option value="d">Option D</option>
                    </select>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <input type="button" onclick="location.href='QuestionList.jsp'" value="Back to Questions" class="btn btn-outline-secondary">
                    <input type="button" onclick="location.href='AdminPanel.jsp'" value="Admin Panel" class="btn btn-outline-info">
                    <input type="submit" value="Save Question" class="btn btn-success px-4">
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