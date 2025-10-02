package com.example.demo.service;

import com.example.demo.model.Songs;
import com.example.demo.model.User;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class AdminService {
    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                User user = new User(rs.getInt("ID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Email"), rs.getString("UserType"), rs.getString("UPassword"));
                userList.add(user);
            }
            return userList;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void deleteUser(int id) throws SQLException {
        String sql = "DELETE FROM Users WHERE ID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);

            stmt.executeUpdate();
        }
    }

    public User findUserById(int id) throws SQLException {
        String sql = "SELECT * FROM Users WHERE ID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            return user;
        }
    }

    public void updateUser(int id, String firstName, String lastName, String email, String usertype, String password) throws SQLException{
        String sql;
        boolean updatePassword = (password != null && !password.trim().isEmpty());

        if (updatePassword) {
            sql = "UPDATE Users SET FirstName = ?, LastName = ?, Email = ?, UPassword = ? WHERE ID = ?";
        } else {
            sql = "UPDATE Users SET FirstName = ?, LastName = ?, Email = ? WHERE ID = ?";
        }
        try(Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            if (updatePassword) {
                stmt.setString(4, password);
                stmt.setInt(5, id);
            } else {
                stmt.setInt(4, id);
            }

            stmt.executeUpdate();
        }
    }

    public List<Songs> getAllSongs() {
        List<Songs> songsList = new ArrayList<>();
        String sql = "SELECT u.FirstName, u.LastName, m.MID, m.Title, m.Band, m.Artist, m.Price, m.FileType FROM Users u, Music m WHERE u.ID = m.ID";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Songs song = new Songs(rs.getString("FirstName") + " " + rs.getString("LastName"), rs.getInt("MID"), rs.getString("Title"), rs.getString("Artist"), rs.getString("Band"), rs.getInt("Price"), rs.getString("FileType"));
                songsList.add(song);
            }
            return songsList;
        } catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public Songs findSongById(int mid) throws SQLException {
        String sql = "SELECT MID, Title, Band, Artist, Price FROM Music WHERE MID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, mid);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            Songs song = new Songs(rs.getInt("MID"), rs.getString("Title"), rs.getString("Artist"), rs.getString("Band"), rs.getInt("Price"));
            return song;
        }
    }

    public void updateMusic(Songs song) throws SQLException{
        String sql = "UPDATE Music SET Title = ?, Artist = ?, Band = ?, Price = ? WHERE MID = ?";
        try(Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setString(1, song.getName());
            stmt.setString(2, song.getArtist());
            stmt.setString(3, song.getBand());
            stmt.setInt(4, song.getPrice());
            stmt.setInt(5, song.getMID());
            stmt.executeUpdate();
        }
    }

    public void deleteMusic(int mid) throws SQLException {
        String sql = "DELETE FROM Music WHERE MID = ?";
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, mid);

            stmt.executeUpdate();
        }
    }

}