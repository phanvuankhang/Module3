package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private static IUserService userService=new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action=request.getParameter("action");
    if (action==null){
        action="";
    }
    switch (action){
        case "create":
            showNewForm(request, response);
            break;
        case "delete":
            deleteUsers(request, response);
            break;
        case "edit":
            showEditForm(request, response);
        default:
            showListUsers(request, response);
    }
    }

    private static void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        User user=userService.selectUser(id);
        request.setAttribute("user",user);
        request.getRequestDispatcher("view/edit.jsp").forward(request, response);
    }

    private static void deleteUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        List<User> userList=userService.selectAllUsers();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("view/list.jsp").forward(request, response);
        try {
            userService.deleteUser(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/create.jsp").forward(request, response);
    }

    private static void showListUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList=userService.selectAllUsers();
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("view/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action=request.getParameter("action");
    if (action==null){
        action="";
    }
    switch (action){
        case "create":
            insertUsers(request, response);
            break;
        case "edit":
            updateUsers(request, response);
            break;
        case "search":
            searchUsers(request, response);
            break;
        case "sort":
            sortUsers(request, response);
            break;
    }
    }

    private static void sortUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> sortUserList=userService.sort();
        request.setAttribute("sortUserList",sortUserList);
        request.getRequestDispatcher("view/sort.jsp").forward(request, response);
    }

    private static void searchUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String country= request.getParameter("country");
        List<User> userList=userService.search(country);
        request.setAttribute("userList",userList);
        request.getRequestDispatcher("view/search.jsp").forward(request, response);
    }

    private static void updateUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String name= request.getParameter("name");
        String email= request.getParameter("email");
        String country= request.getParameter("country");
        User user=new User(id,name,email,country);
        try {
            userService.updateUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private static void insertUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name= request.getParameter("name");
        String email= request.getParameter("email");
        String country= request.getParameter("country");
        User user=new User(name,email,country);
        try {
            userService.insertUser(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
