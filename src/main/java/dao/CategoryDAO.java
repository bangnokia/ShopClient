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
            cr.add(Restrictions.eq("status", 1));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Category> getlistCATADMIN() {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Category.class);
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Category> getListCatActive() {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Category.class);
            cr.add(Restrictions.eq("status", 1));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Category> getitemDetail(Integer catID) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Category.class);
            cr.add(Restrictions.eq("id", catID));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public boolean insertCat(Integer idCat, String parentID, String name, String icon, String status) {
        CategoryDAO cate = new CategoryDAO();
        try {
            session.getCurrentSession().beginTransaction();
            int parentIDTemp = 0;
            try {
                parentIDTemp = Integer.parseInt(parentID);
            } catch (Exception e) {

            }

            Category cat = new Category();

            cat.setId(idCat);
            cat.setName(name);
            cat.setIcon(icon);
            cat.setStatus(Integer.parseInt(status));
            cat.setParentId(parentIDTemp);

            if (idCat != 0) {
                session.getCurrentSession().update(cat);
            } else {
                session.getCurrentSession().save(cat);
            }

            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean deleteCat(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Category cat = new Category();

            cat.setId(id);
            session.getCurrentSession().delete(cat);
            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
