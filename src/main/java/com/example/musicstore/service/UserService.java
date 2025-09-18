package com.example.musicstore.service;

import com.example.musicstore.model.User;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Service
public class UserService {
    public void addUser (String firstname, String lastname, String email, String usertype, String password){
        String sql = "INSERT INTO Users (ID, FirstName, LastName, Email, UserType, UPassword) VALUES (?,?,?,?,?,?)";
        try(Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setInt(1, calculateUserId());
            stmt.setString(2, firstname);
            stmt.setString(3, lastname);
            stmt.setString(4, email);
            stmt.setString(5, usertype);
            stmt.setString(6, password);
            stmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

public User getUser(String email, String password){
        String sql = "SELECT * FROM Users WHERE Email = ? AND UPassword = ?";
        User user = null;
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt("ID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Email"), rs.getString("UserType"), rs.getString("UPassword"));
                return user;
            } else {
                user =  null;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return user;
}

public void updateUser(User user){
        String sql = "UPDATE Users SET FirstName = ?, LastName = ?, Email = ?, UPassword = ? WHERE ID = ?";
        try(Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setInt(5, user.getId());

            stmt.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
}

    public User checkUser(String email){
        String sql = "SELECT * FROM Users WHERE Email = ?";
        User user = null;
        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt("ID"), rs.getString("FirstName"), rs.getString("LastName"), rs.getString("Email"), rs.getString("UserType"), rs.getString("UPassword"));
                return user;
            } else {
                user =  null;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }

    public int calculateUserId(){
        String sql = "SELECT MAX(ID) AS maxId FROM Users";
        int maxId = 0;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if(rs.wasNull()) {
                maxId = 0;
            } else {
                rs.next();
                int currntId =  rs.getInt("maxId");
                maxId = currntId + 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maxId;
    }

}
