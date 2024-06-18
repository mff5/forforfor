package homepage.dao;

import homepage.ConnectionPool;
import homepage.PooledConnection;
import homepage.model.Product;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {
    private static ProductDAO instance = null;
    private ProductDAO() {}
    public static ProductDAO getInstance() {
        if (instance == null) {
            instance = new ProductDAO();
        }
        return instance;
    }
    public boolean insertProduct(Product product)  {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            CallableStatement cstmt = con.prepareCall("{call insert_product(?,?,?,?,?,?,?)}")) {
            con.setAutoCommit(false);

            cstmt.setString(1, product.getImgURL());
            cstmt.setString(2, product.getCategory());
            cstmt.setString(3, product.getProductName());
            cstmt.setInt(4, product.getOriginalPrice());
            cstmt.setInt(5, product.getDiscount());
            cstmt.setInt(6, product.getPrice());
            cstmt.setInt(7, product.getStock());

            if (cstmt.executeUpdate()==1)   {
                con.commit();
                result = true;
            } else {
                con.rollback();
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return result;
    }
    public boolean updateProduct(Product product) {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            CallableStatement cstmt = con.prepareCall("{call update_product(?,?,?,?,?,?,?,?)}")) {

            con.setAutoCommit(false);

            cstmt.setString(1,product.getImgURL());
            cstmt.setString(2,product.getCategory());
            cstmt.setString(3,product.getProductName());
            cstmt.setInt(4,product.getOriginalPrice());
            cstmt.setInt(5,product.getDiscount());
            cstmt.setInt(6,product.getPrice());
            cstmt.setInt(7,product.getStock());
            cstmt.setInt(8,product.getProductNo());

            if (cstmt.executeUpdate()==1)   {
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
    public int getProductCount()  {
        int count = 0;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement("select count(*) from products");
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    public Product getProduct(int productNo)  {
        Product product = null;
        String sql = "select * from products where product_no = ?";
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, productNo);

            try(ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setProductNo(rs.getInt("product_no"));
                    product.setImgURL(rs.getString("imgURL"));
                    product.setCategory(rs.getString("category"));
                    product.setProductName(rs.getString("productName"));
                    product.setOriginalPrice(rs.getInt("originalPrice"));
                    product.setDiscount(rs.getInt("discount"));
                    product.setPrice(rs.getInt("price"));
                    product.setCreatedDate(rs.getDate("created_date"));
                    product.setUpdatedDate(rs.getDate("updated_date"));
                    product.setStock(rs.getInt("stock"));
                }

            } catch (Exception e)   {
                e.printStackTrace();
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return product;
    }
    public ArrayList<Product> productList(String sortBy) {
        ArrayList<Product> productList = new ArrayList<>();

        String sortColumn;
        switch (sortBy) {
            case "sales":
                sortColumn = "sales desc";
                break;
            case "discount":
                sortColumn = "discount desc";
                break;
            case "priceAsc":
                sortColumn = "price asc";
                break;
            case "price":
                sortColumn = "price desc";
                break;
            case "created_date":
            default:
                sortColumn = "created_date desc";
                break;
        }
        
        String sql = "select * from products where stock > 0 order by " + sortColumn;

        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Product product = new Product();
                product.setProductNo(rs.getInt("product_no"));
                product.setImgURL(rs.getString("imgURL"));
                product.setCategory(rs.getString("category"));
                product.setProductName(rs.getString("productName"));
                product.setOriginalPrice(rs.getInt("originalPrice"));
                product.setDiscount(rs.getInt("discount"));
                product.setPrice(rs.getInt("price"));
                product.setCreatedDate(rs.getDate("created_date"));
                product.setUpdatedDate(rs.getDate("updated_date"));
                product.setStock(rs.getInt("stock"));

                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }

    public ArrayList<Product> getProductList()  {
        ArrayList<Product> productList = new ArrayList<>();

        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement("select * from products where stock>0 order by product_no desc ");
            ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductNo(rs.getInt("product_no"));
                product.setImgURL(rs.getString("imgURL"));
                product.setCategory(rs.getString("category"));
                product.setProductName(rs.getString("productName"));
                product.setOriginalPrice(rs.getInt("originalPrice"));
                product.setDiscount(rs.getInt("discount"));
                product.setPrice(rs.getInt("price"));
                product.setCreatedDate(rs.getDate("created_date"));
                product.setUpdatedDate(rs.getDate("updated_date"));
                product.setStock(rs.getInt("stock"));

                productList.add(product);
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return productList;
    }

    public ArrayList<Product> getProductList2(int start, int end)  {
        ArrayList<Product> productList = new ArrayList<>();
        String sql = "select * from products where stock>0 order by product_no desc offset ? row fetch next ? rows only";
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql)) {

            int offset = start-1;
            int fetch = end+1;

            pstmt.setInt(1, offset);
            pstmt.setInt(2, fetch);

            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductNo(rs.getInt("product_no"));
                    product.setImgURL(rs.getString("imgURL"));
                    product.setCategory(rs.getString("category"));
                    product.setProductName(rs.getString("productName"));
                    product.setOriginalPrice(rs.getInt("originalPrice"));
                    product.setDiscount(rs.getInt("discount"));
                    product.setPrice(rs.getInt("price"));
                    product.setCreatedDate(rs.getDate("created_date"));
                    product.setUpdatedDate(rs.getDate("updated_date"));
                    product.setStock(rs.getInt("stock"));

                    productList.add(product);
                }
            } catch (Exception e)   {
                e.printStackTrace();
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return productList;
    }

    public boolean deleteProduct(int productNo)  {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        CallableStatement cstmt = con.prepareCall("{call delete_product(?)}")) {

            con.setAutoCommit(false);

            cstmt.setInt(1, productNo);

            if (cstmt.executeUpdate()==1)   {
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
    public ArrayList<Product> getProductList3()  {
        ArrayList<Product> productList = new ArrayList<>();
        String sql = "select * from (select * from products order by created_date desc ) where ROWNUM <=3";

        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Product product = new Product();
                product.setProductNo(rs.getInt("product_no"));
                product.setImgURL(rs.getString("imgURL"));
                product.setCategory(rs.getString("category"));
                product.setProductName(rs.getString("productName"));
                product.setOriginalPrice(rs.getInt("originalPrice"));
                product.setDiscount(rs.getInt("discount"));
                product.setPrice(rs.getInt("price"));
                product.setCreatedDate(rs.getDate("created_date"));
                product.setUpdatedDate(rs.getDate("updated_date"));
                product.setStock(rs.getInt("stock"));

                productList.add(product);
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return productList;
    }
    public boolean resetProduct() {
        boolean result = false;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             CallableStatement cstmt = con.prepareCall("{call reset_product()}")) {
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
}