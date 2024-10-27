package com.example.web2t;

import java.io.*;

import com.example.web2t.Points.Point;
import com.example.web2t.Points.PointManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "AreaCheckServlet", value = "/AreaCheckServlet")
public class AreaCheckServlet extends HttpServlet {
    float inputX;
    float inputY;
    float inputR;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {

            inputX = Float.parseFloat(request.getParameter("x"));
            inputY = Float.parseFloat(request.getParameter("y"));
            inputR = Float.parseFloat(request.getParameter("r"));
            System.err.println("MSG:  X"+inputX+" Y"+inputY+" R"+inputR);

        } catch (Exception e) {
            errorHandler();
        }
        HttpSession session = request.getSession();
        PointManager pointManager = (PointManager) session.getAttribute("pointManager");
        if (pointManager == null) {
            pointManager = new PointManager();
        }
        session.setAttribute("pointManager", pointManager);
        pointManager.addPoint(new Point(inputX, inputY, inputR, checkAreas(inputX, inputY, inputR)));



        RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
        dispatcher.forward(request, response);





    }
    public void errorHandler(){
        System.err.println("ERROR KAPUT 2");
    }
    public boolean checkRectangle(float x, float y, float r) {
        return ((-r/2 <= x)&&(x <= 0) && ((-r <= y) && (y<=0)));
    }
    public boolean checkTriangle(float x, float y, float r) {
        return ((0 <= x && x <= r) && (-r/2 <= y && y <=0) && y >= (x / 2) - r / 2);
    }
    public boolean checkCircle(float x, float y, float r) {
        return ((-r/2<=x && x<=0) && (0<=y && y<=r) && Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r, 2));
    }
    public boolean checkAreas(float x, float y, float r){
        return checkRectangle(x, y, r) || checkTriangle(x, y, r) || checkCircle(x, y, r);
    }
}