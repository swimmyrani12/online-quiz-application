package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Questions;
import model.QuestionsDao;

@WebServlet(urlPatterns = {"/oes.controller.QuestionInsert", "/controller.QuestionInsert"})
public class QuestionInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QuestionInsert() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("Question");
        String a = request.getParameter("option1");
        String b = request.getParameter("option2");
        String c = request.getParameter("option3");
        String d = request.getParameter("option4");
        String answer = request.getParameter("answer");

        if (question != null && !question.trim().isEmpty()) {
            Questions q = new Questions();
            q.setQuestion(question.trim());
            q.setA(a != null ? a.trim() : "");
            q.setB(b != null ? b.trim() : "");
            q.setC(c != null ? c.trim() : "");
            q.setD(d != null ? d.trim() : "");
            q.setAnswer(answer != null ? answer.trim() : "");

            // Return type boolean handle karne ke liye fix:
            boolean status = QuestionsDao.insertQuestion(q);

            if (status) {
                response.sendRedirect("QuestionList.jsp?msg1=Question Added Successfully");
            } else {
                response.sendRedirect("AddQuestion.jsp?msg2=Failed to Add Question");
            }
        } else {
            response.sendRedirect("AddQuestion.jsp?msg2=Question field cannot be empty");
        }
    }
}