<%--Document : updatequestion--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.QuestionsDao"%>
<%@page import="db.Questions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Update Questions</title>
</head>
<body>
<div class="container-fluid mt-4">
  <h3 class="text-center text-primary mb-3">List of all questions</h3>

  <table class="table table-bordered table-hover">
    <thead class="thead-dark">
      <tr>
        <th style="width: 5%;">s no.</th>
        <th style="width: 25%;">Question</th>
        <th style="width: 12%;">Option A</th>
        <th style="width: 12%;">Option B</th>
        <th style="width: 12%;">Option C</th>
        <th style="width: 12%;">Option D</th>
        <th style="width: 8%;">Answer</th>
        <th style="width: 7%;">Update</th>
        <th style="width: 7%;">Delete</th>
      </tr>
    </thead>
    <tbody>
    <%
       int i = 1;
       String selectedQues = request.getParameter("ques");
       ArrayList<Questions> allQuestions = QuestionsDao.getAllRecords();
       
       for(Questions e : allQuestions) {
           if(selectedQues != null && selectedQues.equals(e.getQuestion())) {
    %>
        <tr class="table-primary">
          <td colspan="9">
            <form action="updatequestionnow.jsp" method="get">
              <input type="hidden" name="quesoriginal" value="<%=e.getQuestion()%>">
              <div class="form-row align-items-center">
                <div class="col-md-3">
                  <input type="text" class="form-control form-control-sm" name="quesmodified" value="<%=e.getQuestion()%>" required>
                </div>
                <div class="col-md-1">
                  <input type="text" class="form-control form-control-sm" name="opta" value="<%=e.getA()%>" required>
                </div>
                <div class="col-md-1">
                  <input type="text" class="form-control form-control-sm" name="optb" value="<%=e.getB()%>" required>
                </div>
                <div class="col-md-1">
                  <input type="text" class="form-control form-control-sm" name="optc" value="<%=e.getC()%>" required>
                </div>
                <div class="col-md-1">
                  <input type="text" class="form-control form-control-sm" name="optd" value="<%=e.getD()%>" required>
                </div>
                <div class="col-md-1">
                  <input type="text" class="form-control form-control-sm" name="ans" value="<%=e.getAnswer()%>" required>
                </div>
                <div class="col-md-2">
                  <input type="submit" class="btn btn-sm btn-primary" value="Save">
                  <a href="updatequestion.jsp" class="btn btn-sm btn-secondary">Cancel</a>
                </div>
                <div class="col-md-2">
                  <a class="btn btn-sm btn-outline-danger" href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a>
                </div>
              </div>
            </form>
          </td>
        </tr>
    <%	
           } else { 
    %>
        <tr>
          <td><%=i++%></td>
          <td><%=e.getQuestion()%></td>
          <td><%=e.getA()%></td>
          <td><%=e.getB()%></td>
          <td><%=e.getC()%></td>
          <td><%=e.getD()%></td>
          <td><b><%=e.getAnswer()%></b></td>
          <td><a class="btn btn-sm btn-outline-warning" href="updatequestion.jsp?ques=<%=e.getQuestion()%>">Edit</a></td>
          <td><a class="btn btn-sm btn-outline-danger" href="deletequestion.jsp?ques=<%=e.getQuestion()%>">Delete</a></td>
        </tr>
    <%
           }
       }
    %>
    </tbody>
  </table>

  <div class="d-flex justify-content-between my-3">
    <input type="button" class="btn btn-outline-success" value="Add Question" onclick="location.href='AddQuestion.jsp'">
    <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
  </div>
</div>
</body>
</html>