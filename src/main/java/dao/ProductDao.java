/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import entity.Rate;
import entity.User;
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
public class ProductDao {

    private SessionFactory session = HibernateUtil.getSessionFactory();

    public boolean insert(Integer id, String name, Float price, Integer shopId, String quantity, Integer categoryId,
            Integer BrandId, String outOfStock, String description, String image, String status, String property) {
        ProductDao cate = new ProductDao();
        try {
            session.getCurrentSession().beginTransaction();

            Product Product = new Product();

            Product.setId(id);
            Product.setName(name);
            Product.setPrice(price);
            Product.setShopId(shopId);
            Product.setStatus(status);
            Product.setQuantity(id);
            Product.setCreatedAt(new Date());
            Product.setCategoryId(categoryId);
            // Product.setOutOfStock(outOfStock);
            Product.setDescription(description);
            Product.setImage(image);
            Product.setBrandId(BrandId);
            Product.setProperty(property);

            if (id != 0) {
                session.getCurrentSession().update(Product);
            } else {
                session.getCurrentSession().save(Product);
            }

            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public Product productDetail(Integer id) {
        ProductDao cate = new ProductDao();
        try {
            Criteria cr = session.getCurrentSession().createCriteria(Product.class);
            cr.add(Restrictions.eq("id", id));

            List results = cr.list();

            session.getCurrentSession().getTransaction().commit();
            return (Product) results.get(0);
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public boolean rating(Integer id, Integer idUser, Integer rate, String content) {
        ProductDao cate = new ProductDao();
        try {
            session.getCurrentSession().beginTransaction();

            Rate Rate = new Rate();

            Rate.setProductId(id);
            Rate.setUserId(idUser);
            Rate.setRate(rate);
            Rate.setContent(content);

            Criteria cr = session.getCurrentSession().createCriteria(Rate.class);
            cr.add(Restrictions.eq("userId", idUser));
            cr.add(Restrictions.eq("productId", id));
            List results = cr.list();

            if (results.size() != 0) {
                return false;
            }

            session.getCurrentSession().save(Rate);

            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public List<Product> getlist(String text, String price, Integer category, Integer shopId, String status) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Product.class);
            cr.add(Restrictions.like("name", text, MatchMode.ANYWHERE));

            if (category != 0) {
                cr.add(Restrictions.eq("categoryId", category));
            }
            if (shopId != 0) {
                cr.add(Restrictions.eq("shopId", shopId));
            }
            if (status != null && status != "") {
                cr.add(Restrictions.eq("status", status));
            }

            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<User> getDetailUser(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(User.class);
            cr.add(Restrictions.eq("id", id));
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Rate> getlistRate(Integer id) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Rate.class);
            if (id != 0) {
                cr.add(Restrictions.eq("id", id));
            }
            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Product> getitemDetail(Integer ID) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Product.class);
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

            Product Product = new Product();

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
