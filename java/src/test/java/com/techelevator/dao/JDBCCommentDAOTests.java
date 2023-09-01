package com.techelevator.dao;

import com.techelevator.model.Comment;
import com.techelevator.model.Review;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.time.LocalDate;

public class JDBCCommentDAOTests extends BaseDaoTests {

    private static final Comment COMMENT_1 = new Comment(1, 1, 1, "Test Comment", LocalDate.parse("2023-01-01"));
    private static final Comment COMMENT_2 = new Comment(2, 2, 1, "Test Comment", LocalDate.now());
    private static final Comment COMMENT_3 = new Comment(1, 3, 1, "Test Comment", LocalDate.parse("2023-01-01"));

    private JDBCCommentDAO jdbcCommentDAO;

    @Before
    public void setup() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcCommentDAO = new JDBCCommentDAO(jdbcTemplate);
    }

    @Test
    public void add_comment_test() {
        Comment comment = jdbcCommentDAO.addComment(COMMENT_1, 2);

        int newId = comment.getCommentId();
        Assert.assertTrue(newId > 0);


        Comment actual = jdbcCommentDAO.getCommentByCommentId(newId);
        assertCommentsMatch(comment, actual);
    }


    @Test
    public void delete_comment_test(){
        jdbcCommentDAO.deleteComment(1);
        Comment comment = jdbcCommentDAO.getCommentByCommentId(1);

        Assert.assertNull(comment);
    }

    @Test
    public void edit_comment_test(){
        Comment expected = jdbcCommentDAO.getCommentByCommentId(1);
        expected.setCommentText("Hello people! Why are you looking at the backend?");
        jdbcCommentDAO.editComment(expected, 1);


        Comment actual = jdbcCommentDAO.getCommentByCommentId(1);

        assertCommentsMatch(expected, actual);
    }




    private void assertCommentsMatch(Comment expected, Comment actual) {
        Assert.assertEquals(expected.getCommentId(), actual.getCommentId());
        Assert.assertEquals(expected.getCommentText(), actual.getCommentText());
        Assert.assertEquals(expected.getReviewId(), actual.getReviewId());
        Assert.assertEquals(expected.getUserId(), actual.getUserId());
        Assert.assertEquals(expected.getDate(), actual.getDate());
    }
}
