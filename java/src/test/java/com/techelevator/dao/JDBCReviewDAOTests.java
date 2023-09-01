package com.techelevator.dao;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.techelevator.model.Comment;
import com.techelevator.model.Review;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.boot.devtools.autoconfigure.LocalDevToolsAutoConfiguration;
import org.springframework.jdbc.core.JdbcTemplate;

import java.time.LocalDate;

public class JDBCReviewDAOTests extends BaseDaoTests {


    private JDBCReviewDAO jdbcReviewDAO;

    private static final Comment COMMENT_1 = new Comment(1,1,1,"Test Comment", LocalDate.now());
    private static final Comment COMMENT_2 = new Comment(2,2,1, "Test Comment", LocalDate.now());
    private static final Comment COMMENT_3 = new Comment(1,3,1,"Test Comment", LocalDate.now());
    private static final Comment[] comments = new Comment[]{COMMENT_1, COMMENT_2, COMMENT_3};
    private static final Review REVIEW_1 = new Review(1, 1, 1, "Test", "Test Tile", comments , LocalDate.now());

    @Before
    public void setup(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcReviewDAO = new JDBCReviewDAO(jdbcTemplate);
    }


    @Test
    public void add_review_test(){
        Review newReview = jdbcReviewDAO.addReview(REVIEW_1);

        int newID = newReview.getReviewId();
        Assert.assertTrue(newID > 0);

       Review actual = jdbcReviewDAO.getReviewByReviewId(newID);
       assertReviewMatch(newReview, actual);

    }

    @Test
    public void edit_review_test(){
        Review review1 = jdbcReviewDAO.getReviewByReviewId(1);
        review1.setReviewTitle("HEY JAVA BLUE!");
        review1.setReviewText("HEY JAVA GREEN!");
        jdbcReviewDAO.editReview(review1, 1);


        Review review2 = jdbcReviewDAO.getReviewByReviewId(1);


        assertReviewMatch(review1, review2);
    }

    @Test
    public void delete_review_test(){
        jdbcReviewDAO.deleteReview(3);
        Review deletedReview = jdbcReviewDAO.getReviewByReviewId(3);

        Assert.assertNull(deletedReview.getReviewTitle());
        Assert.assertNull(deletedReview.getReviewText());
        Assert.assertEquals(0, deletedReview.getReviewId());
        Assert.assertNull(deletedReview.getDate());
        Assert.assertEquals(0, deletedReview.getUserId());
        Assert.assertNull(deletedReview.getComments());
    }


    @Test
    public void get_array_of_reviews(){
        Assert.assertEquals(1, jdbcReviewDAO.getArrayReviewsByGameId(4).length);

    }



    private void assertReviewMatch(Review expected, Review actual){
        Assert.assertEquals(expected.getReviewId(), actual.getReviewId());
        Assert.assertEquals(expected.getGameId(), actual.getGameId());
        Assert.assertEquals(expected.getReviewText(), actual.getReviewText());
        Assert.assertEquals(expected.getDate(), actual.getDate());
        Assert.assertEquals(expected.getReviewTitle(), actual.getReviewTitle());


        int expectedCommentsLength = expected.getComments().length;
        int actualCommentsLength = actual.getComments().length;
        Assert.assertEquals(expectedCommentsLength, actualCommentsLength);
    }
}
