/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;

/**
 *
 * @author chi
 */
public class CustomerDAO extends DBContext {

    public Customer getByUserNamePassword(String username, String password) {
        try {
            String sql = "Select * from Customers where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer account = new Customer();
                account.setId(rs.getInt(1));
                account.setUsername(username);
                account.setPassword(password);
                account.setName(rs.getString(4));
                account.setPhone(rs.getString(5));
                account.setEmail(rs.getString("email"));
                return account;
            }
            rs.close();
        } catch (SQLException ex) {
        }
        return null;
    }

    public Customer getByCusId(int id) {
        try {
            String sql = "Select * from Customers where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Customer account = new Customer();
                account.setId(rs.getInt(1));
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setName(rs.getString(4));
                account.setPhone(rs.getString(5));
                account.setEmail(rs.getString("email"));
                return account;
            }
            rs.close();
        } catch (SQLException ex) {
        }
        return null;
    }

    public boolean updateProfile(int id, String username, String name, String phone, String email) {
        String sql = "update Customers\n"
                + "set username=?,\n"
                + "phone=?,\n"
                + "[name]=?,\n"
                + "email=?\n"
                + "where ID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, phone);
            ps.setString(3, name);
            ps.setString(4, email);
            ps.setInt(5, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public void changePassword(String username, String newPassword) {
        String query = "UPDATE Customers\n"
                + "SET [Password] = ?\n"
                + "WHERE Username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean insertUser(String username, String password, String name, String phone, String email) {
        String sql = "insert into Customers (username,[password],[name],[phone],email)\n"
                + "Values(?,?,?,?,?\n"
                + ")";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public Customer getCustomerByUsername(String user) {
        try {
            String sql = "SELECT * FROM Customers where [username] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("ID"));
                c.setEmail(rs.getString("email"));
                c.setName(rs.getString("name"));
                c.setPassword(rs.getString("password"));
                c.setPhone(rs.getString("phone"));
                c.setUsername(user);
                return c;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkEmailExist(String email) {
        try {
            String sql = "SELECT * FROM Customers where [email] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int count() {
        try {
            String sql = "SELECT count(*) as [count] FROM Customers";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
