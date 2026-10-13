package controler;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Instructions;
import model.InstructionsDao;

@WebServlet(urlPatterns = {"/oes.controller.InstructionInsert", "/controller.InstructionInsert"})
public class InstructionInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public InstructionInsert() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // "inst" aur "instruction" dono ko check karega
        String instText = request.getParameter("inst");
        if (instText == null || instText.trim().isEmpty()) {
            instText = request.getParameter("instruction");
        }

        if (instText != null && !instText.trim().isEmpty()) {
            Instructions inst = new Instructions();
            inst.setInstruction(instText.trim());

            int status = InstructionsDao.insertInstruction(inst);

            if (status > 0) {
                response.sendRedirect("InstructionList.jsp?msg1=Instruction Added Successfully");
            } else {
                response.sendRedirect("AddInstruction.jsp?msg2=Failed to Add Instruction");
            }
        } else {
            response.sendRedirect("AddInstruction.jsp?msg2=Instruction text cannot be empty");
        }
    }
}