package controler;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Students;
import model.StudentsDao;

@WebServlet("/oes.controller.StudentInsert")
public class StudentInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public StudentInsert() {
        super();
    }

    // GET request handle karne ke liye (reload hone par 405 error nahi aayega)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("AddStudent.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String username = request.getParameter("uname");
        String password = request.getParameter("pass");
        String name = request.getParameter("name");

        Students st = new Students();
        st.setUsername(username);
        st.setPassword(password);
        st.setName(name);

        boolean status = StudentsDao.insertStudent(st);

        if (status) {
            String msg1 = "Student Added Successfully";
            response.sendRedirect("StudentList.jsp?msg1=" + msg1);
        } else {
            String msg2 = "Student Not Added";
            response.sendRedirect("StudentList.jsp?msg2=" + msg2);
        }
    }
}