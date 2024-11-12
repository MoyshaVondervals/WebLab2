package Calculations;

public class Factorial {
    public static int factorial(float inputX, float inputY){

        float f = Math.abs(inputX*inputY);
        f = f+15;
        int result = 1;
        for (int i = 1; i <= f; i++) {
            result = result * i;
        }


        System.out.println("result: "+result);
        return result;
    }
}
