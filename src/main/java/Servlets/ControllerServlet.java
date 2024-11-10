package Servlets;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


@WebServlet(name = "ControllerServlet", value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet{
    float inputX;
    float inputY;
    float inputR;
    ArrayList<Float> possibleR = new ArrayList<>(Arrays.asList(1f, 1.5f, 2f, 2.5f, 3f));
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {
            inputX = Float.parseFloat(request.getParameter("x"));
            inputY = Float.parseFloat(request.getParameter("y"));
            inputR = Float.parseFloat(request.getParameter("r"));
            System.err.println("ControllerServlet msg:  X"+inputX+" Y"+inputY+" R"+inputR);

        } catch (Exception e) {
            errorHandler(response);
        }
        if (inputX < -4 || inputX > 4) {
            errorHandler(response);
        }
        if (inputY<=-5|| inputY>=3){
            errorHandler(response);
        }
        if (!possibleR.contains(inputR)){
            errorHandler(response);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/AreaCheckServlet");
        dispatcher.forward(request, response);
    }
    public void errorHandler(HttpServletResponse response) throws IOException {
        System.err.println("ERROR: invalid input");
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write("ERROR: invalid input! x:" + inputX + " y:" + inputY+ " r:" + inputR);
        response.setStatus(422);
    }

}
