package com.example.demo.model;

public class Songs {
    private String userName;
    private int MID;
    private String name;
    private String artist;
    private String band;
    private byte[] data;
    private String fileType;
    private int price;
    private String comment;

    public Songs(int MID, String name, String artist, String band, int price, String fileType){
        this.MID = MID;
        this.name = name;
        this.artist = artist;
        this.band = band;
        this.price = price;
        this.fileType = fileType;
    }

    public Songs(int MID, String name, String artist, String band) {
        this.MID = MID;
        this.band = band;
        this.artist = artist;
        this.name = name;
    }

    public Songs(int MID, String name, String artist, String band, int price) {
        this.MID = MID;
        this.name = name;
        this.artist = artist;
        this.band = band;
        this.price = price;
    }

    public Songs(byte[] data, String fileType) {
        this.data = data;
        this.fileType = fileType;
    }

    public Songs(int MID, String name, String artist, String band, String fileType){
        this.MID = MID;
        this.name = name;
        this.artist = artist;
        this.band = band;
        this.fileType = fileType;
    }

    public Songs(String userName, int MID, String name, String artist, String band, int price, String fileType) {
        this.userName = userName;
        this.MID = MID;
        this.name = name;
        this.artist = artist;
        this.band = band;
        this.price = price;
        this.fileType = fileType;
    }

    public int getMID() {
        return MID;
    }

    public String getName() {
        return name;
    }

    public String getArtist() {
        return artist;
    }

    public String getBand() {
        return band;
    }

    public int getPrice() {
        return price;
    }

    public byte[] getData() {
        return data;
    }

    public String getFileType() {
        return fileType;
    }

    public String getUserName() {
        return userName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
