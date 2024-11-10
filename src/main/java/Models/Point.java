package Models;

public class Point {
    private Coordinates coordinates;
    private boolean status;

    public Point(Coordinates coordinates, boolean status) {
        this.coordinates = coordinates;
        this.status = status;
    }

    public Coordinates getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(Coordinates coordinates) {
        this.coordinates = coordinates;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Point{" +
                "coordinates=" + coordinates +
                ", status=" + status +
                '}';
    }
}
