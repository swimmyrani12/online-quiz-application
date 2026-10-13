<%--Document : Result--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.QuestionsDao"%>
<%@page import="db.Questions"%>
<%@page import="java.util.ArrayList"%>

<%
    // Session validation
    Object usernameObj = session.getAttribute("username");
    if (usernameObj == null) {
        response.sendRedirect("StudentLogin.jsp?msg=Please login first");
        return;
    }
    Object nameObj = session.getAttribute("name");
    String studentName = (nameObj != null) ? nameObj.toString() : usernameObj.toString();

    ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
    int size = (allQuestions != null) ? allQuestions.size() : 0;

    int correctanswer = 0;
    int unattempted = 0;
    int wronganswer = 0;

    if (size > 0) {
        String[] dbans = new String[size];
        for (int i = 0; i < size; i++) {
            dbans[i] = allQuestions.get(i).getAnswer();
        }

        for (int k = 0; k < size; k++) {
            String ans = request.getParameter(Integer.toString(k));
            if (ans == null || ans.equalsIgnoreCase("e")) {
                unattempted++;
            } else if (ans.trim().equalsIgnoreCase(dbans[k] != null ? dbans[k].trim() : "")) {
                correctanswer++;
            } else {
                wronganswer++;
            }
        }
    }

    int attempted = size - unattempted;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exam Result</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 650px;">
    <div class="card shadow">
        <div class="card-header bg-primary text-white text-center py-3">
            <h3 class="mb-0">Examination Result</h3>
        </div>

        <div class="card-body p-4">
            <div class="alert alert-info text-center font-weight-bold mb-4">
                Name: <%= studentName %> &nbsp;|&nbsp; User ID: <%= usernameObj.toString() %>
            </div>

            <table class="table table-bordered table-striped">
                <tbody>
                    <tr>
                        <th style="width: 65%;">Total Number of Questions</th>
                        <td class="text-center font-weight-bold"><%= size %></td>
                    </tr>
                    <tr>
                        <th>Questions Attempted</th>
                        <td class="text-center font-weight-bold text-primary"><%= attempted %></td>
                    </tr>
                    <tr>
                        <th>Unattempted Questions</th>
                        <td class="text-center font-weight-bold text-secondary"><%= unattempted %></td>
                    </tr>
                    <tr>
                        <th>Correct Answers</th>
                        <td class="text-center font-weight-bold text-success" style="font-size: 1.2rem;"><%= correctanswer %></td>
                    </tr>
                    <tr>
                        <th>Wrong Answers</th>
                        <td class="text-center font-weight-bold text-danger" style="font-size: 1.2rem;"><%= wronganswer %></td>
                    </tr>
                </tbody>
            </table>

            <div class="text-center mt-4">
                <button type="button" onclick="location.href='oes.controller.LogoutStudent'" class="btn btn-outline-danger btn-lg px-5">Exit / Logout</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>