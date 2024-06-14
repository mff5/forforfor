package homepage.dao;

import homepage.ConnectionPool;
import homepage.PooledConnection;
import homepage.model.Cart;
import homepage.model.Product;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CartDAO {
    private static CartDAO instance = null;

    private CartDAO() {
    }

    public static CartDAO getInstance() {
        if (instance == null) {
            synchronized (CartDAO.class) {
                if (instance == null) {
                    instance = new CartDAO();
                }
            }
        }
        return instance;
    }

    public int getCartCount() {
        int count = 0;
        String sql = "select count(*) from cart";
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public boolean insertCart(Product product) {
        boolean result = false;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             CallableStatement cstmt = con.prepareCall("{call insert_cart(?,?,?,?,?)}")) {
            con.setAutoCommit(false);

            cstmt.setInt(1, product.getProductNo());
            cstmt.setString(2, product.getImgURL());
            cstmt.setString(3, product.getCategory());
            cstmt.setString(4, product.getProductName());
            cstmt.setInt(5, product.getPrice());

            if (cstmt.executeUpdate() == 1) {
                result = true;
                con.commit();
            } else {
                con.rollback();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean deleteCart(int cartNo) {
        boolean result = false;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             CallableStatement cstmt = con.prepareCall("{call delete_cart(?)}")) {
            con.setAutoCommit(false);

            cstmt.setInt(1, cartNo);

            if (cstmt.executeUpdate() == 1) {
                result = true;
                con.commit();
            } else {
                con.rollback();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean resetCart() {
        boolean result = false;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             CallableStatement cstmt = con.prepareCall("{call reset_cart()}")) {
            con.setAutoCommit(false);

            if (cstmt.executeUpdate() == 1) {
                result = true;
                con.commit();
            } else {
                con.rollback();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public ArrayList<Cart> cartList() {
        ArrayList<Cart> cartList = new ArrayList<>();
        String sql = "select * from cart order by cart_no";

        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setCartNo(rs.getInt("cart_no"));
                    cart.setImgURL(rs.getString("imgURL"));
                    cart.setCategory(rs.getString("category"));
                    cart.setProductName(rs.getString("productName"));
                    cart.setPrice(rs.getInt("price"));

                    cartList.add(cart);
                }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }
    public ArrayList<Cart> cartList2(int start, int end) {
        ArrayList<Cart> cartList = new ArrayList<>();
        String sql = "select * from cart order by cart_no asc offset ? rows fetch next ? rows only";

        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            int offset = start - 1;
            int fetch = end + 1;

            pstmt.setInt(1, offset);
            pstmt.setInt(2, fetch);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Cart cart = new Cart();
                    cart.setCartNo(rs.getInt("cart_no"));
                    cart.setImgURL(rs.getString("imgURL"));
                    cart.setCategory(rs.getString("category"));
                    cart.setProductName(rs.getString("productName"));
                    cart.setPrice(Integer.parseInt(rs.getString("price").replaceAll("[^\\d]", "")));

                    cartList.add(cart);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartList;
    }

    public boolean purchase( String meth, String loginId, int totalPrice)   {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        CallableStatement cstmt = con.prepareCall("{call insert_purchase(?,?,?)}")) {
            con.setAutoCommit(false);
            cstmt.setString(1, meth);
            cstmt.setString(2, loginId);
            cstmt.setInt(3, totalPrice);

            if (cstmt.executeUpdate() == 1) {
                result = true;
                con.commit();
            } else {
                con.rollback();
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return result;
    }

}
