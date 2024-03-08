/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Order;
import model.Perfume;
import model.Selling;
import model.Stock;

/**
 *
 * @author DELL
 */
public class OrderDetailDAO extends DBContext {

    public List<Selling> sellingRecent() {
        String sql = "select top 7 sum(od.quantity*price) as 'totalprice',orderdate from Orders o, OrderDetails od,Perfumes p\n"
                + "where o.ID=od.oid and o.status='complete' and p.ID=od.pid\n"
                + "group by orderdate\n"
                + "order by orderdate";
        List<Selling> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Selling s = new Selling();
                s.setDate(rs.getDate("orderdate"));
                s.setTotalprice(rs.getInt("totalprice"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Stock> topStock() {
        String sql = "SELECT top 3\n"
                + "sum(od.quantity) as [count],\n"
                + "pid,\n"
                + "p.name\n"
                + "FROM OrderDetails od, Perfumes p,Orders o\n"
                + "where o.status='complete' and o.ID=od.oid and p.ID=pid\n"
                + "group by pid,p.name order by [count] desc";
        List<Stock> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Stock s = new Stock();
                s.setPerfume_name(rs.getString("name"));
                s.setQuantity(rs.getInt("count"));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int totalPrice() {
        try {
            String sql = "SELECT sum(od.quantity*p.price) as total FROM OrderDetails od, Perfumes p,Orders o\n"
                    + "where p.ID=od.pid and od.oid=o.ID and o.status='complete'";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;

    }

    public void insertOrderDetail(int oid, int pid, int quantity) {
        try {
            String sql = "insert into OrderDetails (oid,pid,quantity)\n"
                    + "Values(?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, oid);
            statement.setInt(2, pid);
            statement.setInt(3, quantity);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public List<OrderDetail> getOrderDetailsByOrderID(int oid) {
        List<OrderDetail> list = new ArrayList<>();
        try {
            String sql = "SELECT * from OrderDetails where oid=" + oid;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                OrderDetail c = new OrderDetail();
                c.setId(rs.getInt("ID"));
                c.setQuantity(rs.getInt("quantity"));
                PerfumeDAO pd = new PerfumeDAO();
                Perfume p = pd.getPerfumeById(rs.getInt("pid"));
                OrderDAO od = new OrderDAO();
                Order o = od.getOrderById(oid);
                c.setOrder(o);
                c.setPerfume(p);
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public OrderDetail getOrderDetailsByID(int id) {
        try {
            String sql = "SELECT * from OrderDetails where ID=" + id;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                OrderDetail c = new OrderDetail();
                c.setId(rs.getInt("ID"));
                c.setQuantity(rs.getInt("quantity"));
                PerfumeDAO pd = new PerfumeDAO();
                Perfume p = pd.getPerfumeById(rs.getInt("pid"));
                OrderDAO od = new OrderDAO();
                Order o = od.getOrderById(rs.getInt("oid"));
                c.setOrder(o);
                c.setPerfume(p);
                return c;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }

    public void removeOrderDetailByOid(int oid) {
        try {
            String sql = "delete from OrderDetails where oid=" + oid;
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
