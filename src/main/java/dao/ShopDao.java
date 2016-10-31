/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Shop;
import java.util.Date;
import java.util.List;
import model.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Hieu
 */
public class ShopDao {

    private SessionFactory session = HibernateUtil.getSessionFactory();

    public boolean checkShop(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Shop.class);
            cr.add(Restrictions.eq("userId", id));
            List results = cr.list();

            if (results.size() != 0) {
                session.getCurrentSession().getTransaction().commit();
                return true;
            } else {
                session.getCurrentSession().getTransaction().rollback();
                return false;
            }
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean insert(Integer id, Integer userId, String name, String address, String phone, String email, String status) {
        try {
            session.getCurrentSession().beginTransaction();

            Shop Shop = new Shop();

            Shop.setId(id);
            Shop.setName(name);
            Shop.setAddress(address);
            Shop.setEmail(email);
            Shop.setPhone(phone);
            Shop.setStatus(status);
            Shop.setUserId(userId);

            if (id != 0) {
                session.getCurrentSession().update(Shop);
            } else {
                session.getCurrentSession().save(Shop);
            }

            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public List<Shop> getlist(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Shop.class);
            cr.add(Restrictions.eq("userId", id));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Shop> getdetail(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Shop.class);
            cr.add(Restrictions.eq("id", id));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Shop> getitemDetail(Integer ID) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Shop.class);
            cr.add(Restrictions.eq("id", ID));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public boolean delete(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Shop Product = new Shop();

            Product.setId(id);
            session.getCurrentSession().delete(Product);
            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
