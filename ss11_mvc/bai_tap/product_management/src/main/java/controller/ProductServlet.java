package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    IProductService iProductService =new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action="";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("product/create.jsp").forward(request, response);
                break;
            }
            case "delete": {
                extracted(request, response);
                break;
            }
            case "edit": {
                int id= Integer.parseInt(request.getParameter("idEdit"));
                request.setAttribute("idEdit", id);
                request.getRequestDispatcher("product/edit.jsp").forward(request, response);
                break;
            }
            case "seach": {
                seach(request,response);
                break;
            }
            default: {
                showList(request, response);
            }
        }
    }
    public void seach(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("nameSeach");
        List<Product> productList = iProductService.getAll();
        if (productList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            Product product = new Product();
            boolean flag = true;
            for (int i = 0; i < productList.size(); i++) {
                if (name.equals(productList.get(i).getName())){
                    product=productList.get(i);
                    flag=false;
                    break;
                }
            }
            request.setAttribute("product", product);
            request.getRequestDispatcher("product/list.jsp").forward(request, response);
        }
    }

    private void extracted(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        iProductService.delete(id);
        response.sendRedirect("/product");
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = iProductService.getAll();
        if (productList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("product/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action ="";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                break;
            }
            case "edit": {
                editProduct(request,response);
                break;
            }
        }
    }
    public void editProduct(HttpServletRequest request,HttpServletResponse response) throws IOException {
        int id= Integer.parseInt(request.getParameter("idEdit"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String description=request.getParameter("description");
        String manufacturer =request.getParameter("manufacturer");
        Product product = new Product(id,name,price,description,manufacturer);
        iProductService.editProduct(product);
        response.sendRedirect("/product");
    }
    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        String description=request.getParameter("description");
        String manufacturer =request.getParameter("manufacturer");
        Product product = new Product(id,name,price,description,manufacturer);
        iProductService.saveProduct(product);
        response.sendRedirect("/product");
    }
}