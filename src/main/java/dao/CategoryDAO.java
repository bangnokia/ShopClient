/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Category;
import entity.CategoryProperty;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import model.HibernateUtil;
import model.MySQLConnUtils;
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

    public boolean deleteCat(Integer id) throws SQLException {
        Connection connection = null;

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            Statement statement = connection.createStatement();
            String sql = "delete from categoryproperty where catId=" + id;
            statement.execute(sql);

            Statement statement1 = connection.createStatement();
            String sql1 = "delete from category where id=" + id;
            statement1.execute(sql1);

            connection.close();
            return true;
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            return false;
        }
    }
}
