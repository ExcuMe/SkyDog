package com.shopping.service;

import com.shopping.entity.Comment;

import java.util.List;
public interface CommentService {
    Comment getComment(int userId, int productId, String time);

    void addComment(Comment Comment);

    boolean deleteComment(int userId, int productId, String time);

    boolean updateComment(Comment Comment);

    List<Comment> getProductComment(int productId);
}
