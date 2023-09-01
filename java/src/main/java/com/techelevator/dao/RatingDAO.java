package com.techelevator.dao;

import com.techelevator.model.Rating;

public interface RatingDAO {

    Rating addRating(Rating rating);
    Rating editRating(Rating rating, int ratingId);
    Rating[] getAllRatingsByGameId(int id);
    void deleteRating(int ratingId);

}
