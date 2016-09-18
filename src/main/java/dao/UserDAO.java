/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.User;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
/**
 *
 * @author daudau
 */
public class UserDAO {
    
    private final SessionFactory sf = HibernateUtil.getSessionFactory();
    
    public User findUserByName(String username) {        
        sf.getCurrentSession().beginTransaction();
        Query query = sf.getCurrentSession().createQuery("FROM User WHERE username = :username");
        query.setParameter("username", username);
        User user = (User) query.uniqueResult();
        return user;
    }
}
