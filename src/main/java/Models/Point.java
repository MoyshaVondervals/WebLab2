package Models;

public class Point {
    private float x;
    private float y;
    private float r;
    private boolean status;

    public Point(float x, float y, float r, boolean status) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.status = status;
    }

    public float getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public float getR() {
        return r;
    }

    public void setR(float r) {
        this.r = r;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Models.Point{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", status=" + status +
                '}';
    }
}
