package com.example.demo.service;

import com.example.demo.model.Contact;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ContactService {
    public List<Contact> getUserContacts(int id) {
        String sql = "SELECT * FROM Reviews WHERE ID = ?";
        List<Contact> reviews = new ArrayList<>();

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Contact review = new Contact(rs.getInt("RID"), rs.getString("Title"), rs.getString("Message"));
                reviews.add(review);
            }
            return  reviews;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void addQuary(int id, String title, String message) {
        String sql = "INSERT INTO Reviews (Title, Message, ID) VALUES (?, ?, ?)";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, message);
            stmt.setInt(3, id);
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void editQuary(int id, String title, String message){
        String sql = "UPDATE Reviews SET Title = ?, Message = ? WHERE RID = ?";
        try(Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setString(1, title);
            stmt.setString(2, message);
            stmt.setInt(3, id);

            stmt.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Contact getContactById(int id) {
        String sql = "SELECT * FROM Reviews WHERE RID = ?";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            Contact quary = new Contact(rs.getInt("RID"), rs.getString("Title"), rs.getString("Message"));
            return  quary;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void deleteContactById(int id) {
        String sql = "DELETE FROM Reviews WHERE RID = ?";
        try(Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setInt(1, id);

            stmt.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
