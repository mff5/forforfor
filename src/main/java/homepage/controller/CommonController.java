package homepage.controller;

import homepage.dao.BoardDAO;
import homepage.dao.CustomerDAO;
import homepage.model.Board;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/common")
public class CommonController extends HttpServlet {
    BoardDAO boardDAO = BoardDAO.getInstance();
    CustomerDAO customerDAO = CustomerDAO.getInstance();
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

        switch (action) {

            case  "login":
                login(request, response);
                break;
            case "boardForm" :
                boardForm(request, response);
                break;
            case "insertBoard" :
                insertBoard(request, response);
                break;
            case "boardList" :
                boardList(request, response);
                break;
            case "boardContent" :
                boardContent(request, response);
                break;
            case "loginCheck" :
                loginCheck(request, response);
                break;
            case "logout" :
                logout(request, response);
                break;
            case "boardUpdateForm" :
                boardUpdateForm(request, response);
                break;
            case "updateBoard" :
                updateBoard(request, response);
                break;
            case "boardDeleteForm":
                boardDeleteForm(request, response);
                break;
            case "deleteBoard" :
                deleteBoard(request, response);
                break;
        }
    }
    private void loginCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userPw = request.getParameter("userPw");

        int result = customerDAO.loginCheck(userId, userPw);

        request.setAttribute("userId", userId);
        request.setAttribute("result", result);

        request.getRequestDispatcher("/common/loginProc.jsp").forward(request, response);
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/common/logout.jsp").forward(request, response);
    }

    private void updateBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        String title = request.getParameter("title");
        String email = request.getParameter("email");
        String postContent = request.getParameter("postContent");
        String password = request.getParameter("password");

        Board board = new Board();
        board.setUserId(userId);
        board.setPostNo(postNo);
        board.setTitle(title);
        board.setEmail(email);
        board.setPostContent(postContent);
        board.setPassword(password);

        boolean result = boardDAO.updateBoard(board);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/common/boardUpdateProc.jsp").forward(request, response);
    }
    private void deleteBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        String password = request.getParameter("password");

        boolean result = boardDAO.deleteBoard(postNo, password);

        request.setAttribute("postNo", postNo);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/common/boardDeleteProc.jsp").forward(request, response);
    }
    private void boardContent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String loginId = (String) session.getAttribute("loginId");
        if (loginId == null) {
            loginId = "visitor";
        }

        int postNo = Integer.parseInt(request.getParameter("postNo"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        Board board;
        if (loginId.equals("admin"))    {
            board = boardDAO.getBoard(postNo);
        } else {
            board = boardDAO.updateViewsGetBoard(postNo);
        }

        request.setAttribute("postNo", postNo);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("loginId", loginId);
        request.setAttribute("board", board);

        request.getRequestDispatcher("/common/boardContent.jsp").forward(request, response);
    }
    private void boardForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/common/boardForm.jsp").forward(request, response);
    }
    private void boardUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        request.setAttribute("postNo", postNo);
        request.setAttribute("pageNum", pageNum);

        Board board = boardDAO.getBoard(postNo);

        request.setAttribute("board", board);

        request.getRequestDispatcher("/common/boardUpdateForm.jsp").forward(request, response);
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/common/loginForm.jsp").forward(request, response);
    }
    private void boardDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int postNo = Integer.parseInt(request.getParameter("postNo"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));

        request.setAttribute("postNo", postNo);
        request.setAttribute("pageNum", pageNum);
        request.getRequestDispatcher("/common/boardDeleteForm.jsp").forward(request, response);
    }

    private void boardList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 10;

        String pageNum = request.getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }
        int currentPage = Integer.parseInt(pageNum);
        int start = (currentPage - 1) * pageSize + 1;
        int end = currentPage * pageSize;

        int count;
        ArrayList<Board> boardList = new ArrayList<>();
        BoardDAO dao = BoardDAO.getInstance();
        count = dao.getBoardCount();
        if (count > 0) {
            boardList = dao.getBoardList(start, end);
        }

        int number = count - (currentPage - 1) * pageSize;

        request.setAttribute("count", count);
        request.setAttribute("boardList", boardList);
        request.setAttribute("number", number);
        request.setAttribute("currentPage", currentPage);

        int pageBlock = 5;
        int temp = count % pageSize == 0 ? 0 : 1;
        int pageCount = count / pageSize + temp;

        int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;

        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageBlock", pageBlock);
        request.setAttribute("pageCount", pageCount);

        request.getRequestDispatcher("/common/boardList.jsp").forward(request, response);
    }

    private void insertBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        int refNo = Integer.parseInt(request.getParameter("refNo"));
        int stepNo = Integer.parseInt(request.getParameter("stepNo"));
        int depthLevel = Integer.parseInt(request.getParameter("depthLevel"));

        String userId = request.getParameter("userId");
        String email = request.getParameter("email");
        String phone1 = request.getParameter("phone1");
        String phone2 = request.getParameter("phone2");
        String phone3 = request.getParameter("phone3");
        String title = request.getParameter("title");
        String postContent = request.getParameter("postContent");
        String password = request.getParameter("password");
        String ipAddress = request.getRemoteAddr();

        Board board = new Board();

        board.setPostNo(postNo);
        board.setUserId(userId);
        board.setEmail(email);
        board.setPhone1(phone1+"-"+phone2+"-"+phone3+"-");
        board.setTitle(title);
        board.setPostContent(postContent);
        board.setPassword(password);
        board.setIpAddress(ipAddress);
        board.setRefNo(refNo);
        board.setStepNo(stepNo);
        board.setDepthLevel(depthLevel);

        boolean result = boardDAO.insertBoard(board);

        request.setAttribute("result", result);

        request.getRequestDispatcher("/common/boardProc.jsp").forward(request, response);
    }
}
