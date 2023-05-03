package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    static private IProductService iProductService = new ProductService();
    static private List<Product> productList = iProductService.getAll();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showList(request, response);
            case "delete":
                deleteProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            case "search":
                List<Product> products = new ArrayList<>();
                String productName = request.getParameter("productName");
                for (int i = 0; i < productList.size(); i++) {
                    if(productName.equals(productList.get(i).getName())){
                        products.add(productList.get(i));
                    }
                }
                request.setAttribute("productList",products);
                request.getRequestDispatcher("products/list.jsp").forward(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    private static void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                request.setAttribute("id", productList.get(i).getId());
                request.setAttribute("name", productList.get(i).getName());
                request.setAttribute("price", productList.get(i).getPrice());
                request.setAttribute("productDetail", productList.get(i).getProductDetail());
                request.setAttribute("producer", productList.get(i).getProducer());
                request.getRequestDispatcher("products/edit.jsp").forward(request, response);
                break;
            }
        }
    }

    private static void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iProductService.delete(id);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("products/list.jsp").forward(request, response);
    }

    private static void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("products/list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
        }
    }

    private static void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String productDetail = request.getParameter("productDetail");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, productDetail, producer);
        iProductService.edit(product);
        response.sendRedirect("/product");
    }

    private static void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String productDetail = request.getParameter("productDetail");
        String producer = request.getParameter("producer");
        Product product = new Product(id, name, price, productDetail, producer);
        iProductService.save(product);
        response.sendRedirect("/product");
    }
}