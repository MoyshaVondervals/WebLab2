package Calculations;

import Managers.PointManager;
import Models.Coordinates;
import Models.Point;

public class CheckAreaProxy {
    public static void checkAreaProxy(PointManager pointManager, float x, float y, float r) {
        Coordinates coordinates = new Coordinates(x, y, r);
        Point point = pointManager.isContainsPoint(coordinates);
        System.out.println("proxy works: "+point);
        if (point!=null){
            System.out.println("proxy substitution");
            pointManager.addPoint(point);
        }else {
            System.out.println("proxy no substitution");
            pointManager.addPoint(new Point(new Coordinates(x, y, r), CheckArea.checkAreas(x, y, r)));
        }
    }
}
