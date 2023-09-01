package com.techelevator.dao;

import com.techelevator.model.Comment;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCCommentDAO implements CommentDAO {

    private JdbcTemplate jdbcTemplate;

    public JDBCCommentDAO (JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public Comment addComment(Comment comment, int reviewId) {

        String sql =  "INSERT INTO COMMENT(comment_txt, review_id, user_id, date_time) VALUES (?, ?, ?, current_date) RETURNING comment_id;";

        int newCommentId = jdbcTemplate.queryForObject(sql, int.class, comment.getCommentText(), reviewId, comment.getUserId());

        if(newCommentId > 0){
            comment = getCommentByCommentId(newCommentId);
        }

        return comment;
    }

    @Override
    public Comment editComment(Comment comment, int commentId) {
        String sql = "UPDATE comment SET comment_txt = ? WHERE comment_id = ?;";

        jdbcTemplate.update(sql, comment.getCommentText(), commentId);

        return getCommentByCommentId(commentId);
    }

    @Override
    public void deleteComment(int commentId) {
        String sql = "DELETE FROM comment_likes WHERE comment_id = ?;";
        String sql1 = "DELETE FROM comment WHERE comment_id = ?;";


        try{

            jdbcTemplate.update(sql, commentId);
            jdbcTemplate.update(sql1, commentId);

        }catch(DataIntegrityViolationException e){
            throw new DataIntegrityViolationException("Invalid comment ID", e);
        }


    }

    public Comment getCommentByCommentId(int commentId){
        String sql = "SELECT comment_id, comment_txt, review_id, user_id, date_time FROM comment WHERE comment_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, commentId);

        if(results.next()){
           return mapRowToComment(results);
        }
        return null;
    }

    private Comment mapRowToComment(SqlRowSet sqlRowSet){
        Comment comment = new Comment();
        comment.setCommentId(sqlRowSet.getInt("comment_id"));
        comment.setDate(sqlRowSet.getDate("date_time").toLocalDate());
        comment.setCommentText(sqlRowSet.getString("comment_txt"));
        comment.setReviewId(sqlRowSet.getInt("review_id"));
        comment.setUserId(sqlRowSet.getInt("user_id"));
        return comment;
    }
}
