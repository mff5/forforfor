package homepage.dao;

import homepage.ConnectionPool;
import homepage.PooledConnection;
import homepage.model.Board;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
    private static BoardDAO instance = null;

    private BoardDAO() {
    }

    public static BoardDAO getInstance() {
        if (instance == null) {
            synchronized (BoardDAO.class) {
                instance = new BoardDAO();
            }
        }
        return instance;
    }

    public boolean insertBoard(Board board) {
        boolean result = false;
        String sql;
        int postNo = board.getPostNo();
        int refNo = board.getRefNo();
        int stepNo = board.getStepNo();
        int depthLevel = board.getDepthLevel();
        int number;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement("select nvl(max(post_no),0)+1 from board");
             ResultSet rs = pstmt.executeQuery()) {

            //새글
            if (rs.next()) {
                number = rs.getInt(1);
            } else {
                number = 1;
            }

            //답글
            if (postNo != 0) {
                sql = "update board set step_no=step_no+1 where ref_no= ? and step_no> ?";
                try (PreparedStatement pstmt2 = con.prepareStatement(sql)) {
                    pstmt2.setInt(1, refNo);
                    pstmt2.setInt(2, stepNo);
                    pstmt2.executeUpdate();
                    stepNo++;
                    depthLevel++;

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {            //새글
                refNo = number;
                stepNo = 0;
                depthLevel = 0;
            }
            try (CallableStatement cstmt = con.prepareCall("{call insert_board(?,?,?,?,?,?,?,?,?,?)}")) {
                cstmt.setString(1, board.getUserId());
                cstmt.setString(2, board.getEmail());
                cstmt.setString(3, board.getPhone1() + "-" + board.getPhone2() + "-" + board.getPhone3());
                cstmt.setString(4, board.getTitle());
                cstmt.setString(5, board.getPostContent());
                cstmt.setString(6, board.getPassword());
                cstmt.setString(7, board.getIpAddress());
                cstmt.setInt(8, refNo);
                cstmt.setInt(9, stepNo);
                cstmt.setInt(10, depthLevel);
                if (cstmt.executeUpdate() == 1) {
                    result = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public int getBoardCount() {
        int count = 0;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement("select count(*) from board");
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    //카운터 증가o
    public Board updateViewsGetBoard(int postNo) {
        Board board = null;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement("update Board set views=views+1 where post_no = ?");
             PreparedStatement pstmt2 = con.prepareStatement("select * from board where post_no=?")) {

            pstmt.setInt(1, postNo);
            pstmt.executeUpdate();

            pstmt2.setInt(1, postNo);
            try (ResultSet rs = pstmt2.executeQuery()) {
                if (rs.next()) {
                    board = new Board();
                    board.setPostNo(rs.getInt("post_no"));
                    board.setUserId(rs.getString("userId"));
                    board.setEmail(rs.getString("email"));

                    String phone = rs.getString("phone");
                    String[] phoneParts = phone.split("-", 3);
                    board.setPhone1(phoneParts.length > 0 ? phoneParts[0] : "");
                    board.setPhone2(phoneParts.length > 1 ? phoneParts[1] : "");
                    board.setPhone3(phoneParts.length > 2 ? phoneParts[2] : "");

                    board.setTitle(rs.getString("title"));
                    board.setPostContent(rs.getString("post_content"));
                    board.setPassword(rs.getString("post_content"));
                    board.setViews(rs.getInt("views"));
                    board.setCreatedDate(rs.getDate("created_date"));
                    board.setUpdatedDate(rs.getDate("updated_date"));
                    board.setIpAddress(rs.getString("ip_address"));
                    board.setRefNo(rs.getInt("ref_no"));
                    board.setStepNo(rs.getInt("step_no"));
                    board.setDepthLevel(rs.getInt("depth_level"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return board;
    }

    //카운터 증가x
    public Board getBoard(int postNo) {
        Board board = null;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement("select * from board where post_no=?")) {
            pstmt.setInt(1, postNo);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    board = new Board();
                    board.setPostNo(rs.getInt("post_no"));
                    board.setUserId(rs.getString("userId"));
                    board.setEmail(rs.getString("email"));

                    String phone = rs.getString("phone");
                    String[] phoneParts = phone.split("-", 3);
                    board.setPhone1(phoneParts.length > 0 ? phoneParts[0] : "");
                    board.setPhone2(phoneParts.length > 1 ? phoneParts[1] : "");
                    board.setPhone3(phoneParts.length > 2 ? phoneParts[2] : "");

                    board.setTitle(rs.getString("title"));
                    board.setPostContent(rs.getString("post_content"));
                    board.setPassword(rs.getString("post_content"));
                    board.setViews(rs.getInt("views"));
                    board.setCreatedDate(rs.getDate("created_date"));
                    board.setUpdatedDate(rs.getDate("updated_date"));
                    board.setIpAddress(rs.getString("ip_address"));
                    board.setRefNo(rs.getInt("ref_no"));
                    board.setStepNo(rs.getInt("step_no"));
                    board.setDepthLevel(rs.getInt("depth_level"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return board;
    }

    public boolean updateBoard(Board board) {
        boolean result = false;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement("select password from board where post_no =?")) {
            pstmt.setInt(1, board.getPostNo());
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String dbPw = rs.getString("password");
                    if (dbPw.equals(board.getPassword())) {
                        String sql = "update board set title =?, post_content=? where post_no =?";
                        try (PreparedStatement pstmt2 = con.prepareStatement(sql)) {
                            pstmt2.setString(1, board.getTitle());
                            pstmt2.setString(2, board.getPostContent());
                            pstmt2.setInt(3, board.getPostNo());
                            if (pstmt2.executeUpdate() == 1) {
                                result = true;
                            }
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean deleteBoard(int postNo, String password) {
        boolean result = false;

        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement("delete from board where post_no =? and password = ?")) {
            pstmt.setInt(1, postNo);
            pstmt.setString(2, password);

            if (pstmt.executeUpdate() == 1) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public ArrayList<Board> getBoardList(int start, int end) {
        ArrayList<Board> boardList = new ArrayList<>();
        String sql = "select * from board order by ref_no desc, step_no asc offset ? rows fetch next ? rows only ";
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            int offset = start - 1;
            int fetch = end + 1;

            pstmt.setInt(1, offset);
            pstmt.setInt(2, fetch);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Board board = new Board();
                    board.setPostNo(rs.getInt("post_no"));
                    board.setUserId(rs.getString("userId"));
                    board.setEmail(rs.getString("email"));

                    String phone = rs.getString("phone");
                    String[] phoneParts = phone.split("-", 3);
                    board.setPhone1(phoneParts.length > 0 ? phoneParts[0] : "");
                    board.setPhone2(phoneParts.length > 1 ? phoneParts[1] : "");
                    board.setPhone3(phoneParts.length > 2 ? phoneParts[2] : "");

                    board.setTitle(rs.getString("title"));
                    board.setPostContent(rs.getString("post_content"));
                    board.setPassword(rs.getString("password"));
                    board.setViews(rs.getInt("views"));
                    board.setCreatedDate(rs.getDate("created_date"));
                    board.setUpdatedDate(rs.getDate("updated_date"));
                    board.setIpAddress(rs.getString("ip_address"));
                    board.setRefNo(rs.getInt("ref_no"));
                    board.setStepNo(rs.getInt("step_no"));
                    board.setDepthLevel(rs.getInt("depth_level"));

                    boardList.add(board);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return boardList;
    }
}
