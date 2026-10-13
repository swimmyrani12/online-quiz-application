<%--Document : QuestionList--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.QuestionsDao"%>
<%@page import="db.Questions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container-fluid mt-4">
    <h3 class="text-center text-primary mb-3">List of all Questions</h3>

    <%-- Success or Error Alert Messages --%>
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
                <th style="width: 5%;">s no.</th>
                <th style="width: 30%;">Question</th>
                <th style="width: 12%;">Option A</th>
                <th style="width: 12%;">Option B</th>
                <th style="width: 12%;">Option C</th>
                <th style="width: 12%;">Option D</th>
                <th style="width: 7%;">Answer</th>
                <th style="width: 5%;">Update</th>
                <th style="width: 5%;">Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            int i = 1;
            ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
            if (allQuestions != null && !allQuestions.isEmpty()) {
                for (Questions e : allQuestions) {
        %>
            <tr>
                <td class="text-center font-weight-bold"><%= i++ %></td>
                <td><%= e.getQuestion() %></td>
                <td><%= e.getA() %></td>
                <td><%= e.getB() %></td>
                <td><%= e.getC() %></td>
                <td><%= e.getD() %></td>
                <td class="text-center font-weight-bold text-success"><%= e.getAnswer() %></td>
                <td class="text-center">
                    <a class="btn btn-sm btn-outline-warning" href="updatequestion.jsp?ques=<%= java.net.URLEncoder.encode(e.getQuestion(), "UTF-8") %>">Update</a>
                </td>
                <td class="text-center">
                    <a class="btn btn-sm btn-outline-danger" href="deletequestion.jsp?ques=<%= java.net.URLEncoder.encode(e.getQuestion(), "UTF-8") %>" onclick="return confirm('Are you sure you want to delete this question?');">Delete</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="9" class="text-center text-muted py-3">No questions found in database.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="d-flex justify-content-between my-4">
        <input type="button" value="Add Question" class="btn btn-success px-4" onclick="location.href='AddQuestion.jsp'">
        <input type="button" class="btn btn-outline-danger px-4" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>