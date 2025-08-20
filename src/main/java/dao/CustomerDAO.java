package dao;

import java.sql.*;
import java.util.*;
import model.Customer;

public class CustomerDAO {

    public static void addCustomer(Customer c) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
<<<<<<< HEAD
                "INSERT INTO customers (account_no, name, address, telephone, units) VALUES (?, ?, ?, ?, ?)", 
                Statement.RETURN_GENERATED_KEYS)) {
=======
                "INSERT INTO customers(account_no,name,address,telephone,units) VALUES(?,?,?,?,?)")) {
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
            ps.setInt(1, c.getAccountNo());
            ps.setString(2, c.getName());
            ps.setString(3, c.getAddress());
            ps.setString(4, c.getTelephone());
            ps.setInt(5, c.getUnits());
            ps.executeUpdate();
<<<<<<< HEAD
            // Optionally retrieve the generated account_no if it's auto-incremented
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    c.setAccountNo(rs.getInt(1));
                }
            }
=======
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
        }
    }

    public static void updateCustomer(Customer c) throws Exception {
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(
<<<<<<< HEAD
                "UPDATE customers SET name = ?, address = ?, telephone = ?, units = ? WHERE account_no = ?")) {
=======
                "UPDATE customers SET name=?, address=?, telephone=?, units=? WHERE account_no=?")) {
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
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
<<<<<<< HEAD
             PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE account_no = ?")) {
=======
             PreparedStatement ps = con.prepareStatement("DELETE FROM customers WHERE account_no=?")) {
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
            ps.setInt(1, accountNo);
            ps.executeUpdate();
        }
    }

    public static Customer findByAccountNo(int accountNo) throws Exception {
        try (Connection con = DBUtil.getConnection();
<<<<<<< HEAD
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
=======
             PreparedStatement ps = con.prepareStatement("SELECT * FROM customers WHERE account_no=?")) {
            ps.setInt(1, accountNo);
            ResultSet rs = ps.executeQuery();
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

    public static List<Customer> getAllCustomers() throws Exception {
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
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
<<<<<<< HEAD
                    rs.getInt("units")
                ));
=======
                    rs.getInt("units")));
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
            }
        }
        return list;
    }
<<<<<<< HEAD
}
=======
}
>>>>>>> 8324489c3589ef1fde3ccf3cd84cf9eb837897e8
