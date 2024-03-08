/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Order;

/**
 *
 * @author chi
 */
public class OrderDAO extends DBContext {

    public void insertOrder(int id, int cusid, String address) {
        try {
            String sql = "insert into Orders (ID,cusid,[address],orderdate,[status])\n"
                    + "Values(?,?,?,?,'confirming'\n"
                    + ")";
            java.sql.Date currentDate = new java.sql.Date(new Date().getTime());
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setInt(2, cusid);
            statement.setString(3, address);
            statement.setDate(4, currentDate);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> getAllOrderByCusId(int cusid) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Orders where cusid=" + cusid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order c = new Order();
                c.setId(rs.getInt("ID"));
                CustomerDAO cus = new CustomerDAO();
                c.setCustomer(cus.getByCusId(cusid));
                c.setAddress(rs.getString("address"));
                c.setOrderdate(rs.getDate("orderdate"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    public Order getOrderById(int id) {
        try {
            String sql = "SELECT * from Orders where ID=" + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Order o = new Order();
                o.setAddress(rs.getString("address"));
                Order c = new Order();
                c.setId(rs.getInt("ID"));
                CustomerDAO cus = new CustomerDAO();
                c.setCustomer(cus.getByCusId(rs.getInt("cusid")));
                c.setAddress(rs.getString("address"));
                c.setOrderdate(rs.getDate("orderdate"));
                c.setStatus(rs.getString("status"));
                return o;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getLastOrderId() {
        try {
            String sql = "SELECT MAX(ID) from Orders";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void changeOrderStatusById(int id, String status) {
        try {
            String sql = "update Orders set status = ? where ID=" + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void removeOrderById(int id) {
        try {
            String sql = "delete from Orders where ID=" + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Orders";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order c = new Order();
                c.setId(rs.getInt("ID"));
                CustomerDAO cus = new CustomerDAO();
                c.setCustomer(cus.getByCusId(rs.getInt("cusid")));
                c.setAddress(rs.getString("address"));
                c.setOrderdate(rs.getDate("orderdate"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int count() {
        try {
            String sql = "SELECT count(*) as [count] FROM Orders where [status]='complete'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException ex) {
        }
        return 0;
    }

    public List<Order> getOrderByStatus(String status) {
        List<Order> list = new ArrayList<>();
        try {
            String sql = "SELECT * from Orders where [status] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order c = new Order();
                c.setId(rs.getInt("ID"));
                CustomerDAO cus = new CustomerDAO();
                c.setCustomer(cus.getByCusId(rs.getInt("cusid")));
                c.setAddress(rs.getString("address"));
                c.setOrderdate(rs.getDate("orderdate"));
                c.setStatus(rs.getString("status"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
