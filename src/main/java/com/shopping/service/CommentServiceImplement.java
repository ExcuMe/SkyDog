package com.shopping.service;

import com.shopping.dao.CommentDao;
import com.shopping.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CommentServiceImplement implements CommentService {
    @Autowired
    private CommentDao CommentDao;

    @Override
    public Comment getComment(int userId, int productId, String time) {
        return CommentDao.getComment(userId,productId,time);
    }

    @Override
    public void addComment(Comment Comment) {
        CommentDao.addComment(Comment);
    }

    @Override
    public boolean deleteComment(int userId, int productId, String time) {
        return CommentDao.deleteComment(userId,productId,time);
    }

    @Override
    public boolean updateComment(Comment Comment) {
        return CommentDao.updateComment(Comment);
    }

    @Override
    public List<Comment> getProductComment(int productId) {
        return CommentDao.getProductComment(productId);
    }
}
