package com.techelevator.model;

public class VideoGameInListDTO {

    private int userId;
    private int gameId;
    private String listName;


    public VideoGameInListDTO (){

    }

    public VideoGameInListDTO(int userId, int gameId, String listName) {
        this.userId = userId;
        this.gameId = gameId;
        this.listName = listName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGameId() {
        return gameId;
    }

    public void setGameId(int gameId) {
        this.gameId = gameId;
    }

    public String getListName() {
        return listName;
    }

    public void setListName(String listName) {
        this.listName = listName;
    }
}
