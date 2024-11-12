package Models;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Coordinates {
    private float x;
    private float y;
    private float r;

    public Coordinates(float x, float y, float r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

}
