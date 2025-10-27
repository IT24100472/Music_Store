package com.example.demo.service;

import com.example.demo.model.Songs;
import com.example.demo.model.User;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.io.FilenameUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Service
public class ArtistService {
    public void uploadSong(int UID, String title, MultipartFile songFile, String artist, String band, int price) {
        try {
            byte[] songData = songFile.getBytes();
            String fileType = FilenameUtils.getExtension(songFile.getOriginalFilename());

            String sql = "INSERT INTO Music (ID, Title, Song, FileType, Artist, Band, Price) VALUES (?, ?, ?, ?, ?, ?, ?)";
            try(Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)){
                stmt.setInt(1, UID);       // User ID
                stmt.setString(2, title);               // Song title
                stmt.setBytes(3, songData);                // Binary data
                stmt.setString(4, fileType);               // File extension
                stmt.setString(5, artist);
                stmt.setString(6, band);
                stmt.setInt(7, price);

                stmt.executeUpdate();
            } catch (SQLException e){
                e.printStackTrace();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Songs> getUserSongs(User user){
        List<Songs> mySongs = new ArrayList<>();
        String sql = "SELECT * FROM Music WHERE ID = ?";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, user.getId());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Songs song = new Songs(rs.getInt("MID"), rs.getString("Title"), rs.getString("Artist"), rs.getString("Band"), rs.getInt("Price"), rs.getString("FileType"));
                mySongs.add(song);
            }
            return mySongs;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Songs findSong(int mid){
        //System.out.println(mid);
        String sql = "SELECT MID, Title, Artist, Band, Price FROM Music WHERE MID = ?";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, mid);
            ResultSet rs = stmt.executeQuery();
            rs.next();

                Songs song = new Songs(rs.getInt("MID"), rs.getString("Title"), rs.getString("Artist"), rs.getString("Band"), rs.getInt("Price"));

            return song;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public void editSong(int mid, String title, String artist, String band, int price) {
        String sql = "UPDATE Music SET  Title = ?, Artist = ?, Band = ?, Price = ? WHERE MID = ?";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, artist);
            stmt.setString(3, band);
            stmt.setInt(4, price);
            stmt.setInt(5, mid);
            stmt.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int mid){
        String sql = "DELETE FROM Music WHERE MID = ?";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, mid);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Songs getSong (int mid){
        String sql = "SELECT Song, FileType FROM Music WHERE MID = ?";

        try (Connection connection = DBUtil.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, mid);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return new Songs(rs.getBytes("Song"),rs.getString("FileType"));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
