package com.techelevator.dao;

import com.techelevator.model.Comment;
import com.techelevator.model.Review;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCReviewDAO implements ReviewDAO {


    private JdbcTemplate jdbcTemplate;

    public JDBCReviewDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Review addReview(Review review) {

        String sql = "INSERT INTO review (user_id, game_id, review_txt, review_title, date_time) " +
                    "VALUES (?, ?, ?, ?, current_date) RETURNING review_id;";

        int newReview = jdbcTemplate.queryForObject(sql, int.class, review.getUserId(), review.getGameId(),
                review.getReviewText(), review.getReviewTitle());

        review.setReviewId(newReview);
        review.setComments(getCommentsByReviewId(review.getReviewId()));

        return review;
    }

    @Override
    public Review editReview(Review review, int id) {

        String sql = "UPDATE review SET review_txt = ?, review_title = ? WHERE review_id = ?;";

        jdbcTemplate.update(sql, review.getReviewText(), review.getReviewTitle(), id);

        return getReviewByReviewId(review.getReviewId());
    }


    @Override
    public void deleteReview(int id) {
        String sql00= "DELETE FROM review_rating WHERE review_id = ?;";
        String sql0 = "DELETE FROM comment_likes WHERE comment_id IN (SELECT comment_id FROM comment WHERE review_id = ?);";
        String sql = "DELETE FROM comment WHERE review_id = ?;";
        String sql1 = "DELETE FROM review_likes WHERE review_id = ?;";
        String sql2 = "DELETE FROM review WHERE review_id = ?;";

        try{
            jdbcTemplate.update(sql00, id);
            jdbcTemplate.update(sql0, id);
            jdbcTemplate.update(sql, id);
            jdbcTemplate.update(sql1, id);
            jdbcTemplate.update(sql2, id);
        } catch (DataIntegrityViolationException e){
            throw new DataIntegrityViolationException("Invalid Id", e);
        }

    }

    @Override
    public Review[] getArrayReviewsByGameId(int gameId) {
        List<Review> reviewList = new ArrayList<>();

        String sql = "SELECT review_id, user_id, game_id, review_txt, review_title, date_time FROM review WHERE game_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, gameId);

        while(results.next()){
            reviewList.add(mapRowToReview(results));
        }

        return reviewList.toArray(new Review[reviewList.size()]) ;
    }

    public Review getReviewByReviewId(int reviewId) {
        Review review = new Review();

        String sql = "SELECT review_id, user_id, game_id, review_txt, review_title, date_time FROM review WHERE review_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, reviewId);

        if(results.next()){
            review = mapRowToReview(results);
        }



        return review;
    }

    private Comment[] getCommentsByReviewId(int reviewId){
        List<Comment> commentList = new ArrayList<>();

        String sql = "SELECT comment_id, review_id, user_id, comment_txt, date_time FROM comment WHERE review_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, reviewId);

        while(results.next()){
            commentList.add(mapRowToComment(results));
        }
        return commentList.toArray(new Comment[commentList.size()]);
    }


    private Review mapRowToReview(SqlRowSet sqlRowSet){
        Review review = new Review();
        review.setReviewId(sqlRowSet.getInt("review_id"));
        review.setDate(sqlRowSet.getDate("date_time").toLocalDate());
        review.setReviewText(sqlRowSet.getString("review_txt"));
        review.setReviewTitle(sqlRowSet.getString("review_title"));
        review.setGameId(sqlRowSet.getInt("game_id"));
        review.setUserId(sqlRowSet.getInt("user_id"));
        review.setComments(getCommentsByReviewId(review.getReviewId()));
        return review;
    }

    private Comment mapRowToComment(SqlRowSet sqlRowSet){
        Comment comment = new Comment();
        comment.setCommentId(sqlRowSet.getInt("comment_id"));
        comment.setReviewId(sqlRowSet.getInt("review_id"));
        comment.setUserId(sqlRowSet.getInt("user_id"));
        comment.setCommentText(sqlRowSet.getString("comment_txt"));
        comment.setDate(sqlRowSet.getDate("date_time").toLocalDate());
        return comment;
    }


}
