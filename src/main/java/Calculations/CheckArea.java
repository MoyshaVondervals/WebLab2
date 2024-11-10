package Calculations;

public class CheckArea {
    public static boolean checkRectangle(float x, float y, float r) {
        return ((-r <= x)&&(x <= 0) && ((-r <= y) && (y<=0)));
    }
    public static boolean checkTriangle(float x, float y, float r) {
        return ((0 <= x && x <= r) && (-r/2 <= y && y <=0) && y >= (x / 2) - r / 2);
    }
    public static boolean checkCircle(float x, float y, float r) {
        return ((-r<=x && x<=0) && (0<=y && y<=r) && Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r, 2));
    }
    public static boolean checkAreas(float x, float y, float r){
        System.out.println("calculations ...");
        return checkRectangle(x, y, r) || checkTriangle(x, y, r) || checkCircle(x, y, r);
    }
}
