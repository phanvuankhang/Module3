package com.example.calculator;

public class Calculator {
    public static float calculator(float firstOperand, float secondOperand, String operator) {
        switch (operator) {
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if (secondOperand == 0) {
                    throw new RuntimeException("ERROR");
                }
                return firstOperand / secondOperand;
            default:
                throw new RuntimeException("Sai định dạng.");
        }
    }
}
