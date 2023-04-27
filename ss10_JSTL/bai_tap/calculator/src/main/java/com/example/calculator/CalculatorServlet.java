package com.example.calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


@WebServlet(name = "calculatorServlet", value = "/calculator-servlet")
public class CalculatorServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float firstOperand = Float.parseFloat(req.getParameter("firstOperand"));
        float secondOperand = Float.parseFloat(req.getParameter("secondOperand"));
        String operator = req.getParameter("operator");
        float result = Calculator.calculator(firstOperand, secondOperand, operator);

        req.setAttribute("result", result);
        req.getRequestDispatcher("/result.jsp").forward(req, resp);
    }
}