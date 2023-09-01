package com.techelevator.dao;

import com.techelevator.model.Comment;

public interface CommentDAO {

    Comment addComment(Comment comment, int reviewId);
    Comment editComment(Comment comment, int commentId);
    void deleteComment(int commentId);


}
