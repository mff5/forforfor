package homepage.controller;

import homepage.dao.BoardDAO;
import homepage.dao.CartDAO;
import homepage.dao.CustomerDAO;
import homepage.dao.ProductDAO;
import homepage.model.Cart;
import homepage.model.Customer;
import homepage.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/customer")
public class CustomerController extends HttpServlet {
    private final CustomerDAO customerDAO = CustomerDAO.getInstance();
    private final CartDAO cartDAO = CartDAO.getInstance();
    private final ProductDAO productDAO = ProductDAO.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        switch (action) {
            case "idCheck":
                idCheck(request, response);
                break;
            case "insertCustomer":
                insertCustomer(request, response);
                break;
            case "loginCheck":
                loginCheck(request, response);
                break;
            case "updateCustomer":
                updateCustomer(request, response);
                break;
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
            case "findId":
                findId(request, response);
                break;
            case "idCheck2":
                idCheck2(request, response);
                break;
            case "findPw":
                findPw(request, response);
                break;
            case "insertCart":
                insertCart(request, response);
                break;
            case "cartList":
                cartList(request, response);
                break;
            case "deleteCart":
                deleteCart(request, response);
                break;
            case "resetCart":
                resetCart(request, response);
                break;
            case "purchase":
                purchase(request, response);
                break;
        }
    }

    private void idCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        boolean result = customerDAO.idCheck(userId);
        request.setAttribute("result", result);
        request.getRequestDispatcher("/customer/idCheck.jsp").forward(request, response);
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPost = request.getParameter("userPost");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String phone1 = request.getParameter("phone1");
        String phone2 = request.getParameter("phone2");
        String phone3 = request.getParameter("phone3");
        String idQuestion = request.getParameter("idQuestion");
        String idAnswer = request.getParameter("idAnswer");
        String pwQuestion = request.getParameter("pwQuestion");
        String pwAnswer = request.getParameter("pwAnswer");

        Customer customer = new Customer();
        customer.setUserId(userId);
        customer.setUserPw(userPw);
        customer.setUserName(userName);
        customer.setUserEmail(userEmail);
        customer.setUserPost(userPost);
        customer.setAddress1(address1);
        customer.setAddress2(address2);
        customer.setPhone1(phone1);
        customer.setPhone2(phone2);
        customer.setPhone3(phone3);
        customer.setIdQuestion(idQuestion);
        customer.setIdAnswer(idAnswer);
        customer.setPwQuestion(pwQuestion);
        customer.setPwAnswer(pwAnswer);

        boolean result = customerDAO.insertCustomer(customer);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/customer/customerProc.jsp").forward(request, response);
    }

    private void loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");

        int result = customerDAO.loginCheck(userId, userPw);

        request.setAttribute("result", result);
        request.setAttribute("userId", userId);

        request.getRequestDispatcher("/customer/loginProc.jsp").forward(request, response);
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPost = request.getParameter("userPost");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String phone1 = request.getParameter("phone1");
        String phone2 = request.getParameter("phone2");
        String phone3 = request.getParameter("phone3");
        String idQuestion = request.getParameter("idQuestion");
        String idAnswer = request.getParameter("idAnswer");
        String pwQuestion = request.getParameter("pwQuestion");
        String pwAnswer = request.getParameter("pwAnswer");

        Customer customer = new Customer();
        customer.setUserId(userId);
        customer.setUserPw(userPw);
        customer.setUserName(userName);
        customer.setUserEmail(userEmail);
        customer.setUserPost(userPost);
        customer.setAddress1(address1);
        customer.setAddress2(address2);
        customer.setPhone1(phone1);
        customer.setPhone2(phone2);
        customer.setPhone3(phone3);
        customer.setIdQuestion(idQuestion);
        customer.setIdAnswer(idAnswer);
        customer.setPwQuestion(pwQuestion);
        customer.setPwAnswer(pwAnswer);

        boolean result = customerDAO.updateCustomer(customer);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/customer/customerUpdateProc.jsp").forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String loginId = (String) session.getAttribute("loginId");
        String userPw = request.getParameter("userPw");

        boolean result = customerDAO.deleteCustomer(loginId, userPw);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/customer/customerDeleteProc.jsp").forward(request, response);
    }


    private void findId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idQuestion = request.getParameter("idQuestion");
        String idAnswer = request.getParameter("idAnswer");
        ArrayList<String> ids = customerDAO.findId(idQuestion, idAnswer);
        request.setAttribute("ids", ids);
        request.getRequestDispatcher("/customer/findIdProc.jsp").forward(request, response);
    }

    private void idCheck2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        boolean result = customerDAO.idCheck(userId);
        request.setAttribute("result", result);
        request.getRequestDispatcher("/customer/idCheck2.jsp").forward(request, response);
    }

    private void findPw(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String pwQuestion = request.getParameter("pwQuestion");
        String pwAnswer = request.getParameter("pwAnswer");

        String userPw = customerDAO.findPw(userId, pwQuestion, pwAnswer);

        request.setAttribute("userPw", userPw);
        request.getRequestDispatcher("/customer/findPwProc.jsp").forward(request, response);
    }

    private void insertCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productNo = Integer.parseInt(request.getParameter("productNo"));
        Product product = productDAO.getProduct(productNo);
        String productName = product.getProductName();
        boolean result = cartDAO.insertCart(product);
        request.setAttribute("result", result);
        request.setAttribute("productName", productName);

        request.getRequestDispatcher("/customer/cart.jsp").forward(request, response);
    }

    private void cartList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;

        String pageNum = request.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }
        int currentPage = Integer.parseInt(pageNum);
        int start = (currentPage - 1) * pageSize + 1;
        int end = currentPage * pageSize;

        int count;
        int number;

        ArrayList<Cart> cartList = new ArrayList<>();
        count = cartDAO.getCartCount();
        if (count > 0) {
            cartList = cartDAO.cartList2(start, end);
            int pageBlock = 5;
            int temp = count % pageSize == 0 ? 0 : 1;
            int pageCount = count / pageSize + temp;

            int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            if (endPage > pageCount) endPage = pageCount;

            request.setAttribute("startPage", startPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("pageBlock", pageBlock);
        }
        number = start;

        request.setAttribute("cartList", cartList);
        request.setAttribute("count", count);
        request.setAttribute("number", number);

        request.getRequestDispatcher("/customer/cartList.jsp").forward(request, response);
    }
    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cartNo = Integer.parseInt(request.getParameter("cartNo"));
        boolean result = cartDAO.deleteCart(cartNo);
        request.setAttribute("result", result);

        request.getRequestDispatcher("/customer/cartDelete.jsp").forward(request, response);
    }
    private void resetCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean result = cartDAO.resetCart();
        request.setAttribute("result", result);

        request.getRequestDispatcher("/customer/cartReset.jsp").forward(request, response);
    }
    private void purchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String meth = request.getParameter("meth");
        String loginId = (String) session.getAttribute("loginId");
        if (loginId==null)  {
            loginId = "test";
        }
        int totalPrice = 0;
        ArrayList<Cart> cartList = cartDAO.cartList();

        for (Cart c : cartList) {
            totalPrice += c.getPrice();
        }

        boolean result = cartDAO.purchase(meth, loginId, totalPrice);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/customer/purchaseProc.jsp").forward(request, response);
    }
}