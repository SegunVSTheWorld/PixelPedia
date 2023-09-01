package com.techelevator.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class VideoGame {

    private int id;
    private String title;
    private LocalDate releaseDate;
    private BigDecimal releasePrice;
    private String description;
    private String publisherName;
    private String[] genres;
    private String[] studios;
    private String[] systems;
    private String rating;
    private String boxArt;
    private int steamId;


    public VideoGame (){

    }

    public VideoGame(int id, String title, LocalDate releaseDate, BigDecimal releasePrice, String description, String publisherName, String rating, String boxArt, int steamId ) {
        this.id = id;
        this.title = title;
        this.releaseDate = releaseDate;
        this.releasePrice = releasePrice;
        this.description = description;
        this.publisherName = publisherName;
        this.rating = rating;
        this.boxArt = boxArt;
        this.steamId = steamId;
    }

    public String[] getSystems() {
        return systems;
    }

    public void setSystems(String[] systems) {
        this.systems = systems;
    }

    public String[] getStudios() {
        return studios;
    }

    public void setStudios(String[] studios) {
        this.studios = studios;
    }

    public String[] getGenres() {
        return genres;
    }

    public void setGenres(String[] genres) {
        this.genres = genres;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public BigDecimal getReleasePrice() {
        return releasePrice;
    }

    public void setReleasePrice(BigDecimal releasePrice) {
        this.releasePrice = releasePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getBoxArt() {
        return boxArt;
    }

    public void setBoxArt(String boxArt) {
        this.boxArt = boxArt;
    }

    public int getSteamId() {
        return steamId;
    }

    public void setSteamId(int steamId) {
        this.steamId = steamId;
    }
}
