<%--Document : updateinstructionnow--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.InstructionsDao"%>

<%
    String instoriginal = request.getParameter("instoriginal");
    String instmodified = request.getParameter("instmodified");

    if (instoriginal != null && instmodified != null && !instmodified.trim().isEmpty()) {
        int status = InstructionsDao.doUpdateNowRecord(instoriginal.trim(), instmodified.trim());
        if (status > 0) {
            response.sendRedirect("InstructionList.jsp?msg1=Instruction Updated Successfully");
        } else {
            response.sendRedirect("InstructionList.jsp?msg2=Failed to Update Instruction");
        }
    } else {
        response.sendRedirect("InstructionList.jsp?msg2=Invalid Instruction Values");
    }
%>