package homepage.controller;

import homepage.dao.BoardDAO;
import homepage.dao.CustomerDAO;
import homepage.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    CustomerDAO customerDAO = CustomerDAO.getInstance();
    BoardDAO boardDAO = BoardDAO.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }
    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        switch (action){
            case "customerList":
                customerList(request, response);
                break;
            case "customerReset":
                customerReset(request, response);
                break;
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;

        }
    }
    private void customerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Customer> customerList = customerDAO.customerList();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/admin/customerList.jsp").forward(request, response);
    }
    private void customerReset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean result = customerDAO.resetCustomer();
        request.setAttribute("result", result);
        request.getRequestDispatcher("/admin/customerReset.jsp").forward(request, response);
    }
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        boolean result = customerDAO.deleteCustomer(userId);
        request.setAttribute("result", result);
        request.getRequestDispatcher("/customer/customerListProc.jsp").forward(request, response);
    }

}
