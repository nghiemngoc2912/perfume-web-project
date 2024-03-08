/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Perfume;

/**
 *
 * @author chi
 */
public class PerfumeDAO extends DBContext {

    public int count() {
        try {
            String sql = "SELECT count(*) as [count] FROM Perfumes";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException ex) {
        }
        return 0;
    }

    public List<Perfume> getAllPerfume() {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "SELECT  * from Perfumes";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Perfume a = new Perfume();
                a.setId(rs.getInt(1));
                BrandDAO bdao = new BrandDAO();
                CategoryDAO catedao = new CategoryDAO();
                a.setBrand(bdao.getBrandById(rs.getInt("bid")));
                a.setCategory(catedao.getCateById(rs.getInt("cid")));
                a.setImage(rs.getString("image"));
                a.setName(rs.getString("name"));
                a.setQuantity(rs.getInt("quantity"));
                a.setSize(rs.getInt("size"));
                a.setReleaseDate(rs.getString("releaseDate"));
                a.setPrice(rs.getInt("price"));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Perfume> getLastPerfume() {
        List<Perfume> list = new ArrayList<>();

        try {
            String sql = "SELECT top 4 * FROM Perfumes ORDER BY releaseDate desc";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Perfume a = new Perfume();
                a.setId(rs.getInt(1));
                BrandDAO bdao = new BrandDAO();
                CategoryDAO catedao = new CategoryDAO();
                a.setBrand(bdao.getBrandById(rs.getInt("bid")));
                a.setCategory(catedao.getCateById(rs.getInt("cid")));
                a.setImage(rs.getString("image"));
                a.setName(rs.getString("name"));
                a.setQuantity(rs.getInt("quantity"));
                a.setSize(rs.getInt("size"));
                a.setReleaseDate(rs.getString("releaseDate"));
                a.setPrice(rs.getInt("price"));

                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Perfume> getPerfumeByFilter(Integer cid, Integer bid, Double minimumprice, Double maximumprice, Date fromdate, Date todate) {
        ArrayList<Perfume> list = new ArrayList<>();
        String sql = "select * from [Perfumes] p where 1=1";
        if (cid != null && cid > 0) {
            sql += " and cid=" + cid;
        }
        if (bid != null && bid > 0) {
            sql += " and bid=" + bid;
        }
        if (fromdate != null) {
            sql += " and releaseDate>='" + fromdate + "'";
        }
        if (todate != null) {
            sql += " and releaseDate<='" + todate + "'";
        }
        if (minimumprice != null) {
            sql += " and price>=" + minimumprice;
        }
        if (maximumprice != null) {
            sql += " and price<=" + maximumprice;
        }
        try {
            Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Perfume a = new Perfume();
                a.setId(rs.getInt(1));
                BrandDAO bdao = new BrandDAO();
                CategoryDAO catedao = new CategoryDAO();
                a.setBrand(bdao.getBrandById(rs.getInt("bid")));
                a.setCategory(catedao.getCateById(rs.getInt("cid")));
                a.setImage(rs.getString("image"));
                a.setName(rs.getString("name"));
                a.setQuantity(rs.getInt("quantity"));
                a.setSize(rs.getInt("size"));
                a.setReleaseDate(rs.getString("releaseDate"));
                a.setPrice(rs.getInt("price"));

                list.add(a);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Perfume> getPerfumesByBrand(int bid) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Perfumes where bid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, bid);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Perfume a = new Perfume();
                a.setId(rs.getInt(1));
                BrandDAO bdao = new BrandDAO();
                CategoryDAO catedao = new CategoryDAO();
                a.setBrand(bdao.getBrandById(rs.getInt("bid")));
                a.setCategory(catedao.getCateById(rs.getInt("cid")));
                a.setImage(rs.getString("image"));
                a.setName(rs.getString("name"));
                a.setQuantity(rs.getInt("quantity"));
                a.setSize(rs.getInt("size"));
                a.setReleaseDate(rs.getString("releaseDate"));
                a.setPrice(rs.getInt("price"));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public List<Perfume> getTopSellingPerfume() {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "with t as (select top 4 sum(quantity) as totalquantity,pid from OrderDetails where oid in(select ID from Orders where [status]='complete') group by pid order by totalquantity desc\n"
                    + ")\n"
                    + "select * from Perfumes where ID in (select pid from t)";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Perfume a = new Perfume();
                a.setId(rs.getInt(1));
                BrandDAO bdao = new BrandDAO();
                CategoryDAO catedao = new CategoryDAO();
                a.setBrand(bdao.getBrandById(rs.getInt("bid")));
                a.setCategory(catedao.getCateById(rs.getInt("cid")));
                a.setImage(rs.getString("image"));
                a.setName(rs.getString("name"));
                a.setQuantity(rs.getInt("quantity"));
                a.setSize(rs.getInt("size"));
                a.setPrice(rs.getInt("price"));
                a.setReleaseDate(rs.getString("releaseDate"));
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }

    public Perfume getPerfumeById(int pid) {
        String sql = " select * from [Perfumes] \n"
                + "  where ID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Perfume a = new Perfume();
                a.setId(rs.getInt(1));
                BrandDAO bdao = new BrandDAO();
                CategoryDAO catedao = new CategoryDAO();
                a.setBrand(bdao.getBrandById(rs.getInt("bid")));
                a.setCategory(catedao.getCateById(rs.getInt("cid")));
                a.setImage(rs.getString("image"));
                a.setName(rs.getString("name"));
                a.setQuantity(rs.getInt("quantity"));
                a.setSize(rs.getInt("size"));
                a.setPrice(rs.getInt("price"));
                a.setReleaseDate(rs.getString("releaseDate"));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Perfume> getPerfume() {
        ArrayList<Perfume> list = new ArrayList<>();
        String sql = "  select * from [Perfumes] ";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
//                list.add(new Perfume(rs.getString(1), getCategoryById(rs.getInt(2)), getBrandById(rs.getInt(3)), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Perfume> searchKeyword(String keyword) {
        String sql
                = "select * from Perfumes p where p.name LIKE N'%" + keyword + "%'\n"
                + "union\n"
                + "(select * from Perfumes x \n"
                + "where x.bid in (select ID from Brands b where b.name LIKE N'%" + keyword + "%'))\n"
                + "union\n"
                + "(select * from Perfumes y\n"
                + "where y.cid in (select ID from Categories c where c.name LIKE N'%" + keyword + "%'))";

        List<Perfume> list = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Perfume a = new Perfume();
                a.setId(rs.getInt("ID"));
                BrandDAO bdao = new BrandDAO();
                CategoryDAO catedao = new CategoryDAO();
                a.setBrand(bdao.getBrandById(rs.getInt("bid")));
                a.setCategory(catedao.getCateById(rs.getInt("cid")));
                a.setImage(rs.getString("image"));
                a.setName(rs.getString("name"));
                a.setQuantity(rs.getInt("quantity"));
                a.setSize(rs.getInt("size"));
                a.setPrice(rs.getInt("price"));
                a.setReleaseDate(rs.getString("releaseDate"));

                list.add(a);
            }
        } catch (SQLException e) {
            return null;
        }
        return list;
    }

    public void UpdatePerfume(int id, String name, int price, int size, int quantity, int cid, int bid) {
        String sql = "UPDATE [dbo].[Perfumes]\n"
                + "   SET [cid] = ?\n"
                + "      ,[bid] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[size] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[quantity] = ?\n"
                + " WHERE ID = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connection;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, bid);
            ps.setString(3, name);
            ps.setInt(4, size);
            ps.setInt(5, price);
            ps.setInt(6, quantity);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addPerfume(String name, int price, int size, int quantity, int cid, int bid, Date releaseDate,String image) {
        String sql = "Insert into [dbo].[Perfumes]\n"
                + "   (cid,bid,name,size,price,quantity,releaseDate,image)"
                + " values(?,?,?,?,?,?,?,?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = connection;
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setInt(2, bid);
            ps.setString(3, name);
            ps.setInt(4, size);
            ps.setInt(5, price);
            ps.setInt(6, quantity);
            ps.setDate(7, releaseDate);
            ps.setString(8, image);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
