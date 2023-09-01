package com.techelevator.dao;

import com.techelevator.model.Review;

public interface ReviewDAO {

    Review addReview (Review review);
    Review editReview (Review review, int id);
    void deleteReview (int id);
    Review[] getArrayReviewsByGameId (int gameId);


}
