package com.shopping.dao;

import com.shopping.entity.Comment;
import com.sun.org.apache.xml.internal.serialize.LineSeparator;

import java.util.List;


public interface CommentDao {
    public Comment getComment(int userId,int productId,String time);

    public void addComment(Comment Comment);

    public boolean deleteComment(int userId,int productId,String time);

    public boolean updateComment(Comment Comment);

    public List<Comment> getProductComment(int productId);

    boolean deleteCommentByUser(int userId);

    boolean deleteCommentByProduct(int productId);
}
