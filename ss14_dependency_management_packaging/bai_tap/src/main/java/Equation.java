public class Equation {
    public static void equation(double a, double b, double c) {
        double delta = b * b - 4 * a * c;
        if (delta < 0) {
            System.out.println("The equation has no solution!");
        } else if (delta == 0) {
            System.out.println("Equation has 1 double solution: " + (-b / 2 * a));
        } else {
            System.out.println("Equation has 2 solutions : " + ((-b + Math.sqrt(delta)) / 2 * a) + " and " + ((-b - Math.sqrt(delta)) / 2 * a));
        }
    }

    public static void main(String[] args) {
        equation(1, 7, 3);
    }
}



