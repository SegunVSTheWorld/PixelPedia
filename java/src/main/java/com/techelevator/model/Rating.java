package com.techelevator.model;

public class Rating {

    private int ratingId;
    private int userId;
    private int gameId;
    private int reviewId;
    private int overallRating;
    private int storyRating;
    private int visualRating;
    private int audioRating;
    private int gameplayRating;
    private int difficultyRating;


    public Rating (){

    }

    public Rating(int ratingId, int userId, int gameId, int reviewId, int overallRating, int storyRating, int visualRating, int audioRating, int gameplayRating, int difficultyRating) {
        this.ratingId = ratingId;
        this.userId = userId;
        this.gameId = gameId;
        this.reviewId = reviewId;
        this.overallRating = overallRating;
        this.storyRating = storyRating;
        this.visualRating = visualRating;
        this.audioRating = audioRating;
        this.gameplayRating = gameplayRating;
        this.difficultyRating = difficultyRating;
    }

    public int getRatingId() {
        return ratingId;
    }

    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
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

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getOverallRating() {
        return overallRating;
    }

    public void setOverallRating(int overallRating) {
        this.overallRating = overallRating;
    }

    public int getStoryRating() {
        return storyRating;
    }

    public void setStoryRating(int storyRating) {
        this.storyRating = storyRating;
    }

    public int getVisualRating() {
        return visualRating;
    }

    public void setVisualRating(int visualRating) {
        this.visualRating = visualRating;
    }

    public int getAudioRating() {
        return audioRating;
    }

    public void setAudioRating(int audioRating) {
        this.audioRating = audioRating;
    }

    public int getGameplayRating() {
        return gameplayRating;
    }

    public void setGameplayRating(int gameplayRating) {
        this.gameplayRating = gameplayRating;
    }

    public int getDifficultyRating() {
        return difficultyRating;
    }

    public void setDifficultyRating(int difficultyRating) {
        this.difficultyRating = difficultyRating;
    }
}
