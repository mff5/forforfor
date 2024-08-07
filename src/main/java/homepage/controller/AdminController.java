package homepage.controller;

import homepage.dao.CustomerDAO;
import homepage.dao.ProductDAO;
import homepage.dao.PurchaseDAO;
import homepage.model.Customer;
import homepage.model.Product;
import homepage.model.Purchase;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private final CustomerDAO customerDAO = CustomerDAO.getInstance();
    private final ProductDAO productDAO = ProductDAO.getInstance();
    private final PurchaseDAO purchaseDAO = PurchaseDAO.getInstance();

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
            System.out.println("action 이 null 입니다.");
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
            case "productList" :
                productList(request, response);
                break;
            case "productForm" :
                productForm(request, response);
                break;
            case "insertProduct" :
                insertProduct(request, response);
                break;
            case "productUpdateForm" :
                productUpdateForm(request, response);
                break;
            case "updateProduct" :
                updateProduct(request, response);
                break;
            case "deleteProduct" :
                deleteProduct(request, response);
                break;
            case "productReset" :
                productReset(request, response);
                break;
            case "purchaseList" :
                purchaseList(request, response);
                break;
            case "purchaseReset" :
                purchaseReset(request, response);
                break;

        }
    }
    private void productReset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean result = productDAO.resetProduct();

        request.setAttribute("result", result);

        request.getRequestDispatcher("/admin/productResetProc.jsp").forward(request, response);
    }
    private void purchaseReset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean result = purchaseDAO.resetPurchase();

        request.setAttribute("result", result);

        request.getRequestDispatcher("/admin/purchaseResetProc.jsp").forward(request, response);
    }
    private void purchaseList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;

        String pageNum = request.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }
        int currentPage = Integer.parseInt(pageNum);
        int start = (currentPage - 1) * pageSize;

        int count = purchaseDAO.purchaseCount();
        ArrayList<Purchase> purchaseList = new ArrayList<>();
        if (count > 0) {
            purchaseList = purchaseDAO.purchaseList(start, pageSize);
            int pageBlock = 5;
            int pageCount = (int) Math.ceil((double) count / pageSize);

            int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            if (endPage > pageCount) endPage = pageCount;

            request.setAttribute("startPage", startPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("pageBlock", pageBlock);
            request.setAttribute("currentPage", currentPage);
        }

        request.setAttribute("purchaseList", purchaseList);
        request.setAttribute("count", count);


        request.getRequestDispatcher("/admin/purchaseList.jsp").forward(request, response);
    }
    private void customerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;

        String pageNum = request.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }
        int currentPage = Integer.parseInt(pageNum);
        int start = (currentPage - 1) * pageSize;

        int count = customerDAO.getCustomerCount();
        ArrayList<Customer> customerList = new ArrayList<>();
        if (count > 0) {
            customerList = customerDAO.customerList2(start, pageSize);
            int pageBlock = 5;
            int pageCount = (int) Math.ceil((double) count / pageSize);

            int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            if (endPage > pageCount) endPage = pageCount;

            request.setAttribute("startPage", startPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("pageBlock", pageBlock);
            request.setAttribute("currentPage", currentPage);
        }

        request.setAttribute("customerList", customerList);
        request.setAttribute("count", count);


        request.getRequestDispatcher("/admin/customerList.jsp").forward(request, response);
    }

    private void customerReset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean result = customerDAO.resetCustomer();
        request.setAttribute("result", result);
        request.getRequestDispatcher("/admin/customerResetProc.jsp").forward(request, response);
    }
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        boolean result = customerDAO.deleteCustomer(userId);
        request.setAttribute("result", result);
        request.getRequestDispatcher("/customer/customerListProc.jsp").forward(request, response);
    }
    private void productList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;

        String pageNum = request.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }
        int currentPage = Integer.parseInt(pageNum);
        int start = (currentPage - 1) * pageSize;

        int count = productDAO.getProductCount();
        ArrayList<Product> productList = new ArrayList<>();
        if (count > 0) {
            productList = productDAO.getProductList2(start, pageSize);
            int pageBlock = 5;
            int pageCount = (int) Math.ceil((double) count / pageSize);

            int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            if (endPage > pageCount) endPage = pageCount;

            request.setAttribute("startPage", startPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("pageBlock", pageBlock);
            request.setAttribute("currentPage", currentPage);
        }

        request.setAttribute("productList", productList);
        request.setAttribute("count", count);


        request.getRequestDispatcher("/admin/productList.jsp").forward(request, response);
    }
    private void productForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/admin/productForm.jsp").forward(request, response);
    }
    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imgURL = request.getParameter("imgURL");
        String category = request.getParameter("category");
        String productName = request.getParameter("productName");
        int originalPrice = Integer.parseInt(request.getParameter("originalPrice"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int price = Integer.parseInt(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        System.out.println("category: " + category);

        Product product = new Product();
        product.setImgURL(imgURL);
        product.setCategory(category);
        product.setProductName(productName);
        product.setOriginalPrice(originalPrice);
        product.setDiscount(discount);
        product.setPrice(price);
        product.setStock(stock);

        request.setAttribute("imgURL", imgURL);
        request.setAttribute("category", category);
        request.setAttribute("productName", productName);
        request.setAttribute("originalPrice", originalPrice);
        request.setAttribute("discount", discount);
        request.setAttribute("price", price);
        request.setAttribute("stock", stock);

        boolean result = productDAO.insertProduct(product);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/admin/productProc.jsp").forward(request, response);
    }
    private void productUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productNo = Integer.parseInt(request.getParameter("productNo"));

        Product product = productDAO.getProduct(productNo);

        request.setAttribute("product", product);

        request.getRequestDispatcher("/admin/productUpdateForm.jsp").forward(request, response);
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imgURL = request.getParameter("imgURL");
        String category = request.getParameter("category");
        String productName = request.getParameter("productName");
        int originalPrice = Integer.parseInt(request.getParameter("originalPrice"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int price = Integer.parseInt(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int productNo = Integer.parseInt(request.getParameter("productNo"));

        Product product = new Product();
        product.setImgURL(imgURL);
        product.setCategory(category);
        product.setProductName(productName);
        product.setOriginalPrice(originalPrice);
        product.setDiscount(discount);
        product.setPrice(price);
        product.setStock(stock);
        product.setProductNo(productNo);

        boolean result = productDAO.updateProduct(product);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/admin/productUpdateProc.jsp").forward(request, response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productNo = Integer.parseInt(request.getParameter("productNo"));

        boolean result = productDAO.deleteProduct(productNo);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/admin/productDeleteProc.jsp").forward(request, response);
    }
}
