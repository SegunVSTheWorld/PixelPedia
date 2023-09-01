package com.techelevator.model;

import java.awt.*;
import java.time.LocalDate;

public class Review {

    private int reviewId;
    private int userId;
    private int gameId;
    private String reviewText;
    private String reviewTitle;
    private Comment[] comments;
    private LocalDate date;

    public Review(){

    }

    public Review(int reviewId, int userId, int gameId, String reviewText, String reviewTitle, Comment[] comments, LocalDate date) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.gameId = gameId;
        this.reviewText = reviewText;
        this.reviewTitle = reviewTitle;
        this.comments = comments;
        this.date = date;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
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

    public String getReviewText() {
        return reviewText;
    }

    public void setReviewText(String reviewText) {
        this.reviewText = reviewText;
    }

    public String getReviewTitle() {
        return reviewTitle;
    }

    public void setReviewTitle(String reviewTitle) {
        this.reviewTitle = reviewTitle;
    }

    public Comment[] getComments() {
        return comments;
    }

    public void setComments(Comment[] comments) {
        this.comments = comments;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}