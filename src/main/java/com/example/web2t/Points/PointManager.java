package com.example.web2t.Points;

import java.util.LinkedList;

public class PointManager {
    LinkedList<Point> pointLinkedList = new LinkedList<>();
    public void addPoint(Point point) {
        if (pointLinkedList.size()<10){
            pointLinkedList.add(point);
        }else{
            pointLinkedList.removeLast();
            pointLinkedList.add(point);
        }
    }
    public LinkedList<Point> getPointLinkedList() {
        return pointLinkedList;
    }

    public String colorDot(boolean status){
        if (status){
            return "'green'";
        }return "'red'";
    }

}
