package homepage.dao;

import homepage.ConnectionPool;
import homepage.PooledConnection;
import homepage.model.Customer;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CustomerDAO {
    private static CustomerDAO instance = null;//멤버필드
    private CustomerDAO(){ }//생성자
    public static CustomerDAO getInstance(){//메소드
        if(instance == null){
            synchronized(CustomerDAO.class){
                instance = new CustomerDAO();
            }
        }
        return instance;
    }
    public boolean idCheck(String userId)   {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement("select * from customers where userId=?")) {

            pstmt.setString(1, userId);
            try(ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    result=true;
                }
            } catch (Exception e)   {
                e.printStackTrace();
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return result;
    }

    public boolean insertCustomer(Customer customer)    {
        boolean flag = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            CallableStatement cstmt = con.prepareCall("{call insert_customer(?,?,?,?,?,?,?,?,?,?,?)}")) {
            cstmt.setString(1, customer.getUserId());
            cstmt.setString(2, customer.getUserPw());
            cstmt.setString(3, customer.getUserName());
            cstmt.setString(4, customer.getUserEmail());
            cstmt.setString(5, customer.getUserPost());
            cstmt.setString(6, customer.getAddress1()+"," + customer.getAddress2());
            cstmt.setString(7, customer.getPhone1()+"-"+customer.getPhone2()+"-"+customer.getPhone3());
            cstmt.setString(8, customer.getIdQuestion());
            cstmt.setString(9, customer.getIdAnswer());
            cstmt.setString(10, customer.getPwQuestion());
            cstmt.setString(11, customer.getPwAnswer());

            if (cstmt.executeUpdate()==1)   {
                flag=true;
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return flag;
    }
    public int loginCheck(String userId, String userPw)   {
        int check = -1;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement("select * from customers where userId=?")) {
            pstmt.setString(1, userId);
            try(ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String dbPw = rs.getString("userPw");
                    if (dbPw.equals(userPw)) {
                        check = 1;
                    } else
                        check = 0;
                }
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return check;
    }
    public Customer getCustomer(String userId)   {
        Customer person = null;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement("select * from customers where userId=?")) {

            pstmt.setString(1,userId);
            try(ResultSet rs = pstmt.executeQuery()) {
                 if (rs.next()) {
                     person = new Customer();
                     person.setUserId(rs.getString("userId"));
                     person.setUserPw(rs.getString("userPw"));
                     person.setUserName(rs.getString("userName"));
                     person.setUserEmail(rs.getString("userEmail"));
                     person.setUserPost(rs.getString("userPost"));

                     String address = rs.getString("address");
                     String[] addressParts = address.split(",", 2);
                     person.setAddress1(addressParts.length > 0 ? addressParts[0] : "");
                     person.setAddress2(addressParts.length > 1 ? addressParts[1] : "");

                     String phone = rs.getString("phone");
                     String[] phoneParts = phone.split("-", 3);
                     person.setPhone1(phoneParts.length > 0 ? phoneParts[0] : "");
                     person.setPhone2(phoneParts.length > 1 ? phoneParts[1] : "");
                     person.setPhone3(phoneParts.length > 2 ? phoneParts[2] : "");

                     person.setRegisterDate(rs.getDate("regDate"));
                 }
            } catch (Exception e)   {
                e.printStackTrace();
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return person;
    }
    public boolean updateCustomer(Customer customer)   {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            CallableStatement cstmt = con.prepareCall("{call update_customer(?,?,?,?,?,?,?,?,?,?,?)}")) {
            cstmt.setString(1, customer.getUserId());
            cstmt.setString(2, customer.getUserPw());
            cstmt.setString(3, customer.getUserName());
            cstmt.setString(4, customer.getUserEmail());
            cstmt.setString(5, customer.getUserPost());
            cstmt.setString(6, customer.getAddress1()+"," + customer.getAddress2());
            cstmt.setString(7, customer.getPhone1()+"-"+customer.getPhone2()+"-"+customer.getPhone3());
            cstmt.setString(8, customer.getIdQuestion());
            cstmt.setString(9, customer.getIdAnswer());
            cstmt.setString(10, customer.getPwQuestion());
            cstmt.setString(11, customer.getPwAnswer());

            if (cstmt.executeUpdate()==1)   {
                result = true;
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return result;
    }
    public boolean deleteCustomer(String userId, String userPw)    {
        boolean result = false;
        String psmt = "delete from customers where userId = ? and userPw = ?";
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement(psmt)) {
            pstmt.setString(1, userId);
            pstmt.setString(2, userPw);

            if (pstmt.executeUpdate()==1)   {
                result = true;
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return result;
    }
    public ArrayList<Customer> customerList()  {
        ArrayList<Customer> customerList = new ArrayList<>();
        String sql = "select * from customers order by customer_no asc";
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()) {
            while (rs.next())   {
                Customer customer = new Customer();
                customer.setCustomerNo(rs.getInt("customer_no"));
                customer.setUserId(rs.getString("userId"));
                customer.setUserPw(rs.getString("userPw"));
                customer.setUserName(rs.getString("userName"));
                customer.setUserEmail(rs.getString("userEmail"));
                customer.setUserPost(rs.getString("userPost"));

                String address = rs.getString("address");
                String[] addressParts = address.split(",", 2);
                customer.setAddress1(addressParts.length > 0 ? addressParts[0] : "");
                customer.setAddress2(addressParts.length > 1 ? addressParts[1] : "");

                String phoneNum = rs.getString("phone");
                String[] phoneNumParts = phoneNum.split("-", 3);
                customer.setPhone1(phoneNumParts.length > 0 ? phoneNumParts[0] : "");
                customer.setPhone2(phoneNumParts.length > 1 ? phoneNumParts[1] : "");
                customer.setPhone3(phoneNumParts.length > 2 ? phoneNumParts[2] : "");

                customer.setRegisterDate(rs.getDate("regDate"));
                customerList.add(customer);
            }
        } catch (Exception e)   {
            e.printStackTrace();
        }
        return customerList;
    }
    public boolean deleteCustomer(String userId)   {
        boolean result = false;
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
            Connection con = pcon.getConnection();
            PreparedStatement pstmt = con.prepareStatement("delete from customers where userId = ?")) {
            pstmt.setString(1, userId);


            if (pstmt.executeUpdate()==1)   {
                result = true;
            }


        } catch (Exception e)   {
            e.printStackTrace();
        }
        return result;
    }
    public ArrayList<String> findId(String idQuestion, String idAnswer)   {
        ArrayList<String> idList = new ArrayList<>();
        String sql = "select userId from customers where id_question=? and id_answer=?";
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, idQuestion);
            pstmt.setString(2, idAnswer);

            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next())   {
                    String userId = rs.getString("userId");

                    idList.add(userId);
                }

            } catch (Exception e)   {
                e.printStackTrace();
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return idList;
    }
    public String findPw(String userId, String pwQuestion, String pwAnswer)   {
        String userPw = null;
        String sql = "select userPw from customers where userId=? and pw_question=? and pw_answer=?";
        try(PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
        Connection con = pcon.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            pstmt.setString(2, pwQuestion);
            pstmt.setString(3, pwAnswer);

            try(ResultSet rs = pstmt.executeQuery()) {
                if (rs.next())   {
                    userPw = rs.getString("userPw");
                }
            }

        } catch (Exception e)   {
            e.printStackTrace();
        }
        return userPw;
    }
    public boolean resetCustomer() {
        boolean result = false;
        try (PooledConnection pcon = ConnectionPool.getInstance().getPooledConnection();
             Connection con = pcon.getConnection();
             CallableStatement cstmt = con.prepareCall("{call reset_customer()}")) {
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
