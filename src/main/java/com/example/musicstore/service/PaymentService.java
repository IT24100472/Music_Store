package com.example.demo.service;

import com.example.demo.model.Songs;
import com.example.demo.model.User;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class PaymentService {
    public void addCart(int id, int mid) throws SQLException {
        String sql = "INSERT INTO Cart (ID, MID) VALUES (?,?)";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.setInt(2, mid);
            stmt.execute();
        }
    }

    public List<Songs> viewCart(int id) {
        List<Songs> songsList = new ArrayList<>();
        String sql = "SELECT m.MID, m.Title, m.Artist, m.Band FROM Cart c, Music m WHERE c.MID = m.MID AND c.ID = ? GROUP BY m.MID, m.Title, m.Artist, m.Band";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Songs song = new Songs(rs.getInt("MID"), rs.getString("Title"), rs.getString("Artist"), rs.getString("Band"));
                songsList.add(song);
            }
            return songsList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int calculateTotal(int id) {
        String sql1 = "SELECT SUM(m.Price) AS Total_Price FROM Cart c JOIN Music m ON c.MID = m.MID WHERE c.ID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql1)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return rs.getInt("Total_Price");
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public void deleteCart(int id, int mid) {
        String sql1 = "DELETE FROM Cart WHERE ID = ? AND MID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql1)) {
            stmt.setInt(1, id);
            stmt.setInt(2, mid);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Songs> viewSongs(int id) {
        List<Songs> songsList = new ArrayList<>();
        String sql = "SELECT * FROM BoughtMusic b JOIN Music m ON b.MID = m.MID WHERE b.ID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Songs song = new Songs(rs.getInt("MID"), rs.getString("Title"), rs.getString("Artist"), rs.getString("Band"), rs.getString("FileType"));
                songsList.add(song);
            }
            return songsList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void addCustomerSongs(int id, List<Songs> songs) {
        String sql = "INSERT INTO BoughtMusic (ID, MID) VALUES (?,?)";
        for (Songs song : songs) {
            try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
                stmt.setInt(1, id);
                stmt.setInt(2, song.getMID());
                stmt.execute();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteCartAfterBuy(int id){
        String sql1 = "DELETE FROM Cart WHERE ID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql1)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteBoughtSongs(User user){
        String sql1 = "DELETE FROM BoughtMusic WHERE ID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql1)) {
            stmt.setInt(1, user.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
