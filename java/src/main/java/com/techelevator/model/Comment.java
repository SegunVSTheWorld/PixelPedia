package com.techelevator.model;

import java.time.LocalDate;


public class Comment extends Review{

    private int commentId;
    private int reviewId;
    private int userId;
    private String commentText;
    private LocalDate date;

    public Comment(){

    }

    public Comment(int commentId, int reviewId, int userId, String commentText, LocalDate date) {
        this.commentId = commentId;
        this.reviewId = reviewId;
        this.userId = userId;
        this.commentText = commentText;
        this.date = date;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
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

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }
}
