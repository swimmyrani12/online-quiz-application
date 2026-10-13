<%--Document : Exam--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.QuestionsDao"%>
<%@page import="db.Questions"%>
<%@page import="java.util.ArrayList"%>

<%
    // Session validation
    if (session.getAttribute("username") == null) {
        response.sendRedirect("StudentLogin.jsp?msg=Please login to take the exam");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Examination</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script>
    var timeout = 60; // Total exam duration in seconds
    function timer() {
        if (timeout > 0) {
            timeout--;
            document.getElementById("clockDisplay").innerText = timeout;
            window.setTimeout(timer, 1000);
        } else {
            document.getElementById("clockDisplay").innerText = "0";
            alert("Time is up! Submitting your exam automatically.");
            document.formb.submit();
        }
    }
    </script>
</head>
<body onload="timer()" class="bg-light">
    <div class="container mt-4">
        <!-- Header with Countdown Timer -->
        <div class="d-flex justify-content-between align-items-center bg-white p-3 rounded shadow-sm mb-3">
            <h5 class="mb-0 text-primary">Student Examination</h5>
            <div class="alert alert-danger mb-0 py-1 px-3">
                <b>Time Left: </b><span id="clockDisplay" class="font-weight-bold">60</span> seconds
            </div>
        </div>

        <form action="Result.jsp" name="formb" method="post">
            <table class="table table-bordered table-hover bg-white shadow-sm">
                <thead class="thead-dark">
                    <tr>
                        <th style="width: 5%;">#</th>
                        <th style="width: 35%;">Question</th>
                        <th style="width: 15%;">Option A</th>
                        <th style="width: 15%;">Option B</th>
                        <th style="width: 15%;">Option C</th>
                        <th style="width: 15%;">Option D</th>
                    </tr>
                </thead>
                <tbody>
                <%
                   int i = 1;
                   int radioname = 0;
                   ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
                   if (allQuestions != null && !allQuestions.isEmpty()) {
                       for (Questions e : allQuestions) {   
                %>
                    <tr>
                        <td class="font-weight-bold text-center"><%= i++ %></td>
                        <td><b><%= e.getQuestion() %></b></td>
                        <td>
                            <label class="d-block mb-0" style="cursor: pointer;">
                                <input type="radio" value="a" name="<%= radioname %>"> <%= e.getA() %>
                            </label>
                        </td>
                        <td>
                            <label class="d-block mb-0" style="cursor: pointer;">
                                <input type="radio" value="b" name="<%= radioname %>"> <%= e.getB() %>
                            </label>
                        </td>
                        <td>
                            <label class="d-block mb-0" style="cursor: pointer;">
                                <input type="radio" value="c" name="<%= radioname %>"> <%= e.getC() %>
                            </label>
                        </td>
                        <td>
                            <label class="d-block mb-0" style="cursor: pointer;">
                                <input type="radio" value="d" name="<%= radioname %>"> <%= e.getD() %>
                            </label>
                            <!-- Hidden default unattempted option placed validly inside TD -->
                            <input type="radio" value="e" name="<%= radioname %>" checked="checked" style="display: none;">
                        </td>
                    </tr>
                <%
                           radioname++;
                       }
                   } else {
                %>
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">No questions available in the exam.</td>
                    </tr>
                <%
                   }
                %>
                </tbody>
            </table>

            <div class="text-center my-4">
                <input class="btn btn-success btn-lg px-5" type="submit" value="Submit Exam">
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>