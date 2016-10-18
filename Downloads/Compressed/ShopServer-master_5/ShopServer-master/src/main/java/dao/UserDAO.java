/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.User;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
/**
 *
 * @author daudau
 */
public class UserDAO {
    
    private final SessionFactory sf = HibernateUtil.getSessionFactory();
    
    public User findUserByName(String username) {
        username = username.trim();        
        sf.getCurrentSession().beginTransaction();
        Query query = sf.getCurrentSession().createQuery("FROM User WHERE username = :username");
        query.setParameter("username", username);
        User user = (User) query.uniqueResult();
        sf.getCurrentSession().getTransaction().commit();
        return user;
    }
    
    public User findUserByEmail(String email) {
        email = email.trim();
        sf.getCurrentSession().beginTransaction();
        Query query = sf.getCurrentSession().createQuery("FROM User WHERE email = :email");
        query.setParameter("email", email);
        User user = (User) query.uniqueResult();
        sf.getCurrentSession().getTransaction().commit();
        return user;
    }
    
    public boolean save(User user) {
        try {
            sf.getCurrentSession().beginTransaction();
            int id = (int) sf.getCurrentSession().save(user);
            sf.getCurrentSession().getTransaction().commit();            
        } catch(Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }            
        return true;
    }
}
