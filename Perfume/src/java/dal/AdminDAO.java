/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;

/**
 *
 * @author DELL
 */
public class AdminDAO extends DBContext {

    public boolean checkUsernameExist(String u) {
        try {
            String sql = "SELECT * FROM Admins where [username] = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, u);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Admin getByUserNamePassword(String u, String p) {
        try {
            String sql = "Select * from Admins where username = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u);
            ps.setString(2, p);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Admin account = new Admin();
                account.setId(rs.getInt(1));
                account.setUsername(u);
                account.setPassword(p);
                account.setRole(rs.getInt("role"));
                return account;
            }
            rs.close();
        } catch (SQLException ex) {
        }
        return null;
    }

    public List<Admin> getAllStaff() {
        List<Admin> list = new ArrayList<>();
        String sql = "SELECT * FROM Admins where [role]=" + 1;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Admin a = new Admin();
                a.setId(rs.getInt("ID"));
                a.setRole(1);
                a.setUsername(rs.getString("username"));
                list.add(a);
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void createStaff(String username, String password) {
        String sql = "insert into Admins (username,[password],[role])\n"
                + "Values(?,?,1\n"
                + ")";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteStaff(String username) {
        String sql = "delete from Admins where username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void promote(String username) {
        String sql = "update Admins set [role]=0 where username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
