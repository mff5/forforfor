package homepage.dao;

import homepage.ConnectionPool;
import homepage.PooledConnection;
import homepage.model.Board;
import homepage.model.Purchase;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PurchaseDAO {
    private static PurchaseDAO instance = new PurchaseDAO();
    private PurchaseDAO() {}
    public static PurchaseDAO getInstance() {
        return instance;
    }
    public boolean resetPurchase()  {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        CallableStatement cstmt = con.prepareCall("{call reset_purchase()}")) {
            if (cstmt.executeUpdate()==1)   {
                result= true;
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return result;
    }
    public int purchaseCount()  {
        int count = 0;
        String sql = "select count(*) from purchase";
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery()) {
            if (rs.next())  {
                count = rs.getInt(1);
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return count;
    }
    public ArrayList<Purchase> purchaseList(int start, int end) {
        ArrayList<Purchase> purchaseList = new ArrayList<>();
        String sql = "select * from purchase order by purchase_no desc offset ? rows fetch next ? rows only ";
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            int offset = start - 1;
            int fetch = end + 1;

            pstmt.setInt(1, offset);
            pstmt.setInt(2, fetch);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Purchase purchase = new Purchase();
                    purchase.setPurchaseNo(rs.getInt("purchase_no"));
                    purchase.setPurchaseDate(rs.getDate("purchase_date"));
                    purchase.setPurchaseMeth(rs.getString("purchase_meth"));
                    purchase.setUserId(rs.getString("userId"));
                    purchase.setTotalPrice(rs.getInt("total_price"));

                    purchaseList.add(purchase);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return purchaseList;
    }
}
