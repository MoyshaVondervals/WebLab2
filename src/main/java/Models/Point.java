package Models;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Setter
@Getter
public class Point implements Serializable {
    private Coordinates coordinates;
    private boolean status;
    private int factorial;

    public Point(Coordinates coordinates, boolean status, int factorial) {
        this.coordinates = coordinates;
        this.status = status;
        this.factorial = factorial;
    }

    @Override
    public String toString() {
        return "Point{" +
                "coordinates=" + coordinates +
                ", status=" + status +
                ", simple=" + factorial +
                '}';
    }
}
