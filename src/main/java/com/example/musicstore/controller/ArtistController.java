package com.example.demo.controller;

import com.example.demo.model.Songs;
import com.example.demo.model.User;
import com.example.demo.service.ArtistService;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.catalina.connector.ClientAbortException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
@RequestMapping("/artist")
public class ArtistController {
    @Autowired
    private ArtistService artistService;

    @GetMapping
    public String artistPortal() {
        return "artistPanel";
    }

    @PostMapping("/upload")
    public String upload(@RequestParam String songName, @RequestParam MultipartFile songFile, @RequestParam String artist, @RequestParam(required = false) String band, @RequestParam int price, HttpSession session, RedirectAttributes redirectAttributes, Model model) {
        User currentUser = (User) session.getAttribute("loggedInUser");

        if (currentUser != null) {
            if (price > 0) {
                artistService.uploadSong(currentUser.getId(), songName, songFile, artist, band, price);
                redirectAttributes.addFlashAttribute("success", "Upload Successful");
                return "redirect:/artist/mysongs";
            } else {
                model.addAttribute("error", "Invalid price");
                return "artistPanel";
            }
        } else {
            model.addAttribute("error", "You are not logged in");
            return "login";
        }
    }

    @GetMapping("/mysongs")
    public String mysongs(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            List<Songs> mySongs = artistService.getUserSongs(currentUser);
            if (mySongs != null) {
                model.addAttribute("mySongs", mySongs);
                return "songsManagement";
            } else {
                model.addAttribute("notFound", "Not Found");
                return "songsManagement";
            }
        } else {
            model.addAttribute("error", "You are not logged in");
            return "login";
        }
    }

    @GetMapping("/edit/{MID}")
    public String edit(@PathVariable int MID, Model model) {
        Songs targetSong = artistService.findSong(MID);
        model.addAttribute("song", targetSong);
        return "editSong";
    }

    @PostMapping("/edit/{MID}")
    public String editSong(@PathVariable int MID, @RequestParam String title, @RequestParam String artist, @RequestParam(required = false) String band, @RequestParam int price, Model model, RedirectAttributes redirectAttributes) {
        artistService.editSong(MID, title, artist, band, price);
        redirectAttributes.addFlashAttribute("success", "Song Edited Successfully");
        return "redirect:/artist/mysongs";
    }

    @GetMapping("/delete/{MID}")
    public String deleteSong(@PathVariable int MID, RedirectAttributes redirectAttributes) {
        artistService.delete(MID);
        redirectAttributes.addFlashAttribute("success", "Song Deleted Successfully");
        return "redirect:/artist/mysongs";

    }

    @GetMapping("/play/{MID}")
    public void playSong(@PathVariable int MID, HttpServletResponse response) {
        Songs song = artistService.getSong(MID);

        response.setContentType(song.getFileType());
        response.setHeader("Content-Disposition", "inline; filename=\"" + song.getName() + "\"");

        try (ServletOutputStream out = response.getOutputStream();
             InputStream in = new ByteArrayInputStream(song.getData())) {

            byte[] buffer = new byte[4096];
            int bytesRead;

            while ((bytesRead = in.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
                out.flush(); // flush after each chunk
            }

        } catch (IOException e) {
            // Client may have disconnected; you can log or ignore
            System.out.println("Client disconnected or error while streaming: " + e.getMessage());
        }

    }
}
