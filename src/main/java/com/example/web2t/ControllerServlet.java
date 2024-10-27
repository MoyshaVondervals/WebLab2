package com.example.web2t;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;

import jakarta.json.JsonObject;
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
            System.err.println("MSG:  X"+inputX+" Y"+inputY+" R"+inputR);

        } catch (Exception e) {
            errorHandler();
        }
        if (-4<=inputX&&inputX<=4){
            errorHandler();
        }
        if (inputY<-5&& inputY>3){
            errorHandler();
        }
        if (!possibleR.contains(inputR)){
            errorHandler();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/AreaCheckServlet");
        dispatcher.forward(request, response);
    }
    public void errorHandler(){
        System.err.println("ERROR KAPUT");
    }

}
