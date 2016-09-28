/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
import java.util.List;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author Hieu
 */
public class CategoryDAO {

    private SessionFactory session = HibernateUtil.getSessionFactory();

    public List<Category> getlistCAT() {
        try {
            session.getCurrentSession().beginTransaction();
            return session.getCurrentSession().createCriteria(Category.class).list();
        } catch (Exception e) {
            return null;
        }
    }

    public boolean insertCat(String idCat, String parentID, String name, String icon, String status) {
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
}
