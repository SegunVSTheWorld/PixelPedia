package com.techelevator.model;

public class VideoGameList {

    private int userId;
    private String listName;
    private VideoGame[] videoGameArray;

    public VideoGameList (){}

    public VideoGameList(int userId, String listName, VideoGame[] videoGameArray) {
        this.userId = userId;
        this.listName = listName;
        this.videoGameArray = videoGameArray;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }

    public VideoGame[] getVideoGameArray() {
        return videoGameArray;
    }

    public void setVideoGameArray(VideoGame[] videoGameArray) {
        this.videoGameArray = videoGameArray;
    }
}
