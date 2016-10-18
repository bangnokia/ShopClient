/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.CategoryProperty;
import java.util.List;
import model.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Hieu
 */
public class CategoryPropertyDAO {

    private SessionFactory session = HibernateUtil.getSessionFactory();

    public List<CategoryProperty> getlist() {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(CategoryProperty.class);
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<CategoryProperty> getitemDetail(Integer ID) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(CategoryProperty.class);
            cr.add(Restrictions.eq("id", ID));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public boolean insert(Integer id, String catID, String name, String status) {
        CategoryPropertyDAO cate = new CategoryPropertyDAO();
        try {
            session.getCurrentSession().beginTransaction();
            int catIDTemp = 0;
            try {
                catIDTemp = Integer.parseInt(catID);
            } catch (Exception e) {

            }

            CategoryProperty cat = new CategoryProperty();

            cat.setId(id);
            cat.setName(name);
            cat.setCatId(catIDTemp);
            cat.setStatus(status);

            if (id != 0) {
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

    public boolean delete(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            CategoryProperty cat = new CategoryProperty();

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
