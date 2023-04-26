package com.example.bai_tap;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", urlPatterns = "/Discount-Amount")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productDescription = req.getParameter("productDescription");
        float listPrice = Float.parseFloat(req.getParameter("listPrice"));
        float discountPercent = Float.parseFloat(req.getParameter("discountAmount"));
        float discountAmount = listPrice * discountPercent * 0.01f;
        float discountPrice = listPrice - discountAmount;
        req.setAttribute("discount", discountAmount);
        req.setAttribute("discountPrice", discountPrice);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/display-discount.jsp");
        requestDispatcher.forward(req, resp);
    }
}
