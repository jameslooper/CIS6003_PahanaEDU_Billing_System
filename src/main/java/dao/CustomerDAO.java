package dao;

import java.sql.*;
import java.util.*;
import model.Customer;

public class CustomerDAO {

    public static void addCustomer(Customer c) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "INSERT INTO customers (account_no, name, address, telephone, units) VALUES (?, ?, ?, ?, ?)", 
                Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, c.getAccountNo());
            ps.setString(2, c.getName());
            ps.setString(3, c.getAddress());
            ps.setString(4, c.getTelephone());
            ps.setInt(5, c.getUnits());
            ps.executeUpdate();
            // Optionally retrieve the generated account_no if it's auto-incremented
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    c.setAccountNo(rs.getInt(1));
                }
            }
        }
    }

    public static void updateCustomer(Customer c) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "UPDATE customers SET name = ?, address = ?, telephone = ?, units = ? WHERE account_no = ?")) {
            ps.setString(1, c.getName());
            ps.setString(2, c.getAddress());
            ps.setString(3, c.getTelephone());
            ps.setInt(4, c.getUnits());
            ps.setInt(5, c.getAccountNo());
            ps.executeUpdate();
        }
    }

    public static void deleteCustomer(int accountNo) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE account_no = ?")) {
            ps.setInt(1, accountNo);
            ps.executeUpdate();
        }
    }

    public static Customer findByAccountNo(int accountNo) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM customers WHERE account_no = ?")) {
            ps.setInt(1, accountNo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(
                        rs.getInt("account_no"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("telephone"),
                        rs.getInt("units")
                    );
                }
                return null;
            }
        }
    }

    public static List<Customer> listAll() throws Exception {
        List<Customer> list = new ArrayList<>();
        try (Connection con = DBUtil.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM customers ORDER BY account_no DESC")) {
            while (rs.next()) {
                list.add(new Customer(
                    rs.getInt("account_no"),
                    rs.getString("name"),
                    rs.getString("address"),
                    rs.getString("telephone"),
                    rs.getInt("units")
                ));
            }
        }
        return list;
    }
}