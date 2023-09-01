package com.techelevator.controller;

import com.techelevator.dao.*;
import com.techelevator.model.Comment;
import com.techelevator.model.Rating;
import com.techelevator.model.Review;
import com.techelevator.model.VideoGame;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping (path="/videogames")
public class VideoGameController {


    private VideoGameDAO videoGameDAO;
    private ReviewDAO reviewDAO;
    private CommentDAO commentDAO;
    private RatingDAO ratingDAO;

    VideoGameController(VideoGameDAO videoGameDAO, ReviewDAO reviewDAO, CommentDAO commentDAO, RatingDAO ratingDAO) {
        this.reviewDAO = reviewDAO;
        this.videoGameDAO = videoGameDAO;
        this.commentDAO = commentDAO;
        this.ratingDAO = ratingDAO;
    }


    @RequestMapping (path = "", method = RequestMethod.GET)
    public List<VideoGame> listOfVideoGames(){
        return videoGameDAO.getVideoGameList();
    }

    @RequestMapping (path = "{id}", method = RequestMethod.GET)
    public VideoGame getVideoGameById(@PathVariable int id) {
        return videoGameDAO.getVideoGameById(id);

    }
    @RequestMapping (path = "", method = RequestMethod.POST)
    public VideoGame addVideoGame(@RequestBody VideoGame videoGame){
        return videoGameDAO.addVideoGame(videoGame);
    }
    @RequestMapping (path = "{videoGameId}", method = RequestMethod.DELETE)
    public void deleteVideoGame(@PathVariable int videoGameId){
     videoGameDAO.deleteVideoGame(videoGameId);
    }

    @RequestMapping (path = "", method=RequestMethod.PUT)
    public VideoGame updateVideogame (@RequestBody VideoGame videogame){
        return videoGameDAO.updateVideoGame(videogame);
    }

    @RequestMapping (path = "/genres", method = RequestMethod.GET )
    public String[] getArrayOfGenres(){
        return videoGameDAO.genreArray();
    }

    @RequestMapping (path = "/systems", method = RequestMethod.GET )
    public String[] getArrayOfSystems(){
        return videoGameDAO.systemArray();
    }

    @RequestMapping (path = "/companies", method = RequestMethod.GET )
    public String[] getArrayOfCompanies(){
        return videoGameDAO.companyArray();
    }

    @RequestMapping (path = "/reviews", method = RequestMethod.POST)
    public Review addReview(@RequestBody Review review){
        return reviewDAO.addReview(review);
    }

    @RequestMapping (path = "/reviews/{id}", method = RequestMethod.PUT)
    public Review editReview (@RequestBody Review review, @PathVariable int id){
        return reviewDAO.editReview(review, id);
    }


    @RequestMapping (path= "/reviews/{id}", method = RequestMethod.DELETE)
    public void deleteReview (@PathVariable("id") int reviewId){
        reviewDAO.deleteReview(reviewId);
    }

    @RequestMapping (path = "/{id}/reviews", method = RequestMethod.GET)
    public Review[] getReviewsByVideoGameId(@PathVariable("id") int gameId){
        return reviewDAO.getArrayReviewsByGameId(gameId);
    }

    @RequestMapping (path = "/reviews/{reviewId}/comments", method = RequestMethod.POST)
    public Comment addComment(@RequestBody Comment comment,  @PathVariable int reviewId){
        return commentDAO.addComment(comment, reviewId);
    }


    @RequestMapping (path = "/reviews/comments/{id}", method = RequestMethod.PUT)
    public Comment editComment(@RequestBody Comment comment, @PathVariable int id){
        return commentDAO.editComment(comment, id);
    }

    @RequestMapping (path = "/reviews/comments/{commentId}", method = RequestMethod.DELETE)
    public void deleteComment(@PathVariable int commentId){
        commentDAO.deleteComment(commentId);
    }

    @RequestMapping (path = "/ratings", method = RequestMethod.POST)
    public Rating addRating(@RequestBody Rating rating){
        return ratingDAO.addRating(rating);
    }

    @RequestMapping (path = "/ratings/{ratingId}", method = RequestMethod.PUT)
    public Rating editRating(@RequestBody Rating rating, @PathVariable int ratingId){
        return ratingDAO.editRating(rating, ratingId);
    }

    @RequestMapping (path = "{id}/ratings/", method = RequestMethod.GET)
    public Rating[] getRatingsByGameID(@PathVariable int id){
        return ratingDAO.getAllRatingsByGameId(id);
    }

    @RequestMapping (path = "/ratings/{ratingId}", method = RequestMethod.DELETE)
    public void deleteRating(@PathVariable int ratingId){
        ratingDAO.deleteRating(ratingId);
    }
}
