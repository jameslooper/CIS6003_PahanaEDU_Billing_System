package dao;

import model.Item;
import java.sql.*;
import java.util.*;

public class ItemDAO {

    public static void add(Item i) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO items(name, price) VALUES(?,?)")) {
            ps.setString(1, i.getName());
            ps.setBigDecimal(2, i.getPrice());
            ps.executeUpdate();
        }
    }

    public static void update(Item i) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE items SET name=?, price=? WHERE id=?")) {
            ps.setString(1, i.getName());
            ps.setBigDecimal(2, i.getPrice());
            ps.setInt(3, i.getId());
            ps.executeUpdate();
        }
    }

    public static void delete(int id) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM items WHERE id=?")) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public static Item find(int id) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM items WHERE id=?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Item(rs.getInt("id"), rs.getString("name"), rs.getBigDecimal("price"));
            }
            return null;
        }
    }

    public static List<Item> list() throws Exception {
        List<Item> out = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM items ORDER BY id DESC")) {
            while (rs.next()) {
                out.add(new Item(rs.getInt("id"), rs.getString("name"), rs.getBigDecimal("price")));
            }
        }
        return out;
    }
}
