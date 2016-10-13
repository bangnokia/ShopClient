/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Brand;
import java.util.List;
import model.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Hieu
 */
public class BrandDao {

    private SessionFactory session = HibernateUtil.getSessionFactory();

    public List<Brand> getlist() {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Brand.class);
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Brand> getitemDetail(Integer ID) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Brand.class);
            cr.add(Restrictions.eq("id", ID));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public boolean insert(Integer id, String name, String status) {
        BrandDao cate = new BrandDao();
        try {
            session.getCurrentSession().beginTransaction();

            Brand Brand = new Brand();

            Brand.setId(id);
            Brand.setName(name);
            Brand.setStatus(status);

            if (id != 0) {
                session.getCurrentSession().update(Brand);
            } else {
                session.getCurrentSession().save(Brand);
            }

            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean delete(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Brand Brand = new Brand();

            Brand.setId(id);
            session.getCurrentSession().delete(Brand);
            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
