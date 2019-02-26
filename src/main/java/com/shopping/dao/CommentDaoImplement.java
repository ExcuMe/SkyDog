package com.shopping.dao;

import com.shopping.entity.Comment;
import com.shopping.entity.Product;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;


@Repository
public class CommentDaoImplement implements CommentDao {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public Comment getComment(int userId, int productId, String time) {
        String hql = "from Comment where userId=? and productId=? and time=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        query.setParameter(1, productId);
        query.setParameter(2, time);
        return (Comment) query.uniqueResult();
    }

    @Override
    public void addComment(Comment Comment) {
        sessionFactory.getCurrentSession().save(Comment);
    }

    @Override
    public boolean deleteComment(int userId, int productId, String time) {
        String hql = "delete Comment where userId=? and productId=? and time=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        query.setParameter(1, productId);
        query.setParameter(2, time);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean updateComment(Comment Comment) {
        String hql = "update Comment set content=? where userId=? and productId=? and time=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, Comment.getContent());
        query.setParameter(1, Comment.getUserId());
        query.setParameter(2, Comment.getProductId());
        query.setParameter(3, Comment.getTime());
        return query.executeUpdate() > 0;
    }

    @Override
    public List<Comment> getProductComment(int productId) {
        String hql = "from Comment where productId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, productId);
        return  query.list();
    }

    @Override
    public boolean deleteCommentByUser(int userId) {
        String hql = "delete Comment where userId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, userId);
        return query.executeUpdate() > 0;
    }

    @Override
    public boolean deleteCommentByProduct(int productId) {
        String hql = "delete Comment where productId=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setParameter(0, productId);
        return query.executeUpdate() > 0;
    }
}
