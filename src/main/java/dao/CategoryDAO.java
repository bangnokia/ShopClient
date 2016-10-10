/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
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
public class CategoryDAO {

    private SessionFactory session = HibernateUtil.getSessionFactory();

    public List<Category> getlistCAT() {
        try {
            session.getCurrentSession().beginTransaction();
            Criteria cr = session.getCurrentSession().createCriteria(Category.class);
            List results = cr.list();
            return results;
        } catch (Exception e) {
            return null;
        }
    }

    public List<Category> getitemDetail(Integer catID) {
        try {
            session.getCurrentSession().beginTransaction();
            Criteria cr = session.getCurrentSession().createCriteria(Category.class);
            cr.add(Restrictions.eq("idCat", catID));
            List results = cr.list();
            return results;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean insertCat(Integer idCat, String parentID, String name, String icon, String status) {
        try {
            session.getCurrentSession().beginTransaction();

            Category cat = new Category();

            cat.setName(name);
            cat.setIcon(icon);
            cat.setStatus(status);
            cat.setParentId(Integer.parseInt(parentID));

            session.getCurrentSession().save(cat);
            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean deleteCat(Integer idCat) {
        try {
            session.getCurrentSession().beginTransaction();

            Category cat = new Category();

            cat.setId(idCat);
            session.getCurrentSession().delete(cat);
            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
