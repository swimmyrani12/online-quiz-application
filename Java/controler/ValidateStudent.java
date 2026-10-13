package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.Students;
import model.StudentsDao;

@WebServlet("/oes.controller.ValidateStudent")
public class ValidateStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ValidateStudent() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("uname");
        String password = request.getParameter("pass");

        Students sd = new Students();
        sd.setUsername(username);
        sd.setPassword(password);

        boolean status = StudentsDao.doValidate(sd);

        if (status) {
            HttpSession session = request.getSession();
            session.setAttribute("username", sd.getUsername());
            session.setAttribute("name", sd.getName());
            response.sendRedirect("StudentInstructions.jsp");
        } else {
            String msg2 = "Invalid Username or Password";
            response.sendRedirect("StudentLogin.jsp?msg2=" + msg2);
        }
    }
}