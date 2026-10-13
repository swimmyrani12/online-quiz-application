<%--Document : updateinstruction--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.InstructionsDao"%>
<%@page import="db.Instructions"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Update Instructions</title>
</head>
<body>
<div class="container mt-4">
  <h3 class="text-center text-primary mb-3">List of all instructions</h3>

  <table class="table table-bordered table-hover">
    <thead class="thead-dark">
      <tr>
        <th style="width: 8%;">s no.</th>
        <th style="width: 62%;">Instruction</th>
        <th style="width: 15%;">Operation</th>
        <th style="width: 15%;">Delete</th>
      </tr>
    </thead>
    <tbody>
    <%
       int i = 1;
       String selectedInst = request.getParameter("inst");
       ArrayList<Instructions> allinsts = InstructionsDao.getAllRecords();
       
       for(Instructions e : allinsts) {   
           if(selectedInst != null && selectedInst.equals(e.getInstruction())) {
    %>
        <tr class="table-primary">
          <td><%=i++%></td>
          <td colspan="3">
            <form action="updateinstructionnow.jsp" method="get" class="form-inline d-flex justify-content-between">
              <input type="hidden" name="instoriginal" value="<%=e.getInstruction()%>">
              <input type="text" class="form-control form-control-sm flex-grow-1 mr-2" name="instmodified" value="<%=e.getInstruction()%>" required>
              <input type="submit" class="btn btn-sm btn-primary mr-2" value="Save">
              <a href="updateinstruction.jsp" class="btn btn-sm btn-secondary mr-2">Cancel</a>
              <a class="btn btn-sm btn-outline-danger" href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a>
            </form>
          </td>
        </tr>
    <%	
           } else { 
    %> 
        <tr>
          <td><%=i++%></td>
          <td><%=e.getInstruction()%></td>
          <td><a class="btn btn-sm btn-outline-warning" href="updateinstruction.jsp?inst=<%=e.getInstruction()%>">Edit</a></td>
          <td><a class="btn btn-sm btn-outline-danger" href="deleteinstruction.jsp?inst=<%=e.getInstruction()%>">Delete</a></td>
        </tr>
    <%
           }
       }
    %>
    </tbody>
  </table>

  <div class="d-flex justify-content-between my-3">
    <input type="button" class="btn btn-outline-success" value="Add Instruction" onclick="location.href='AddInstruction.jsp'">
    <input type="button" class="btn btn-outline-danger" value="Back to Panel" onclick="location.href='AdminPanel.jsp'">
  </div>
</div>
</body>
</html>