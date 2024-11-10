package Managers;

import Models.Coordinates;
import Models.Point;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.Objects;

public class PointManager {
    LinkedList<Point> pointLinkedList = new LinkedList<>();
    public void addPoint(Point point) {
        if (pointLinkedList.size()<10){
            pointLinkedList.add(point);
        }else{
            pointLinkedList.removeFirst();
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
    public Point isContainsPoint(Coordinates coordinates){
        for (Point point : pointLinkedList){
            if (point.getCoordinates().getX()==coordinates.getX()
                    && point.getCoordinates().getY()==coordinates.getY()
                    && point.getCoordinates().getR()==coordinates.getR()){
                return point;
            }
        }
        return null;
    }

}
