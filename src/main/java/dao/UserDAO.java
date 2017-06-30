/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Product;
import entity.ThongKe;
import entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import model.HibernateUtil;
import model.MySQLConnUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author daudau
 */
public class UserDAO {

    private final SessionFactory sf = HibernateUtil.getSessionFactory();

    public User findUserByName(String username) {
        username = username.trim();
        sf.getCurrentSession().beginTransaction();
        Query query = sf.getCurrentSession().createQuery("FROM User WHERE status <> 0 and username = :username");
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
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean update(Integer id, String name, String username, String email, String phone, String newPassword, String address) {
        try {
            sf.getCurrentSession().beginTransaction();

            Connection connection = MySQLConnUtils.getMySQLConnection();
            Statement statement = connection.createStatement();

            String sql = "";
            if (newPassword.equals("")) {
                sql = "update user set name = '" + name + "', email = '" + email + "', phone = '" + phone + "',address = '" + address + "' where id = " + id;
            } else {
                sql = "update user set name = '" + name + "', email = '" + email + "', phone = '" + phone + "',address = '" + address + "', password = '" + newPassword + "' where id = " + id;
            }

            statement.executeUpdate(sql);

            connection.close();
            sf.getCurrentSession().getTransaction().commit();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
        return true;
    }

    public boolean manageUser(Integer id, String type, String status) throws SQLException {
        Connection connection = null;
        try {
            connection = MySQLConnUtils.getMySQLConnection();
            Statement statement = connection.createStatement();
            Statement statement1 = connection.createStatement();

            String sql = "";
            String sql1 = "";

            if (type.equals("user")) {
                if (status.equals("0")) {
                    sql = "update user set status = 1 where id = " + id;
                } else {
                    sql = "update user set status = 0 where id = " + id;
                    sql1 = "update shop set status = 0 where userId = " + id;
                    statement1.executeUpdate(sql1);
                }
            } else if (type.equals("shop")) {
                if (status.equals("0")) {
                    sql = "update shop set status = 1 where id = " + id;
                } else {
                    sql = "update shop set status = 0 where id = " + id;
                }
            }

            statement.executeUpdate(sql);

            connection.close();
        } catch (Exception e) {
            connection.rollback();
            connection.close();
            return false;
        }
        return true;
    }

    public List<User> getlist(String text) {
        try {
            sf.getCurrentSession().beginTransaction();

            Criteria cr = sf.getCurrentSession().createCriteria(User.class);
            cr.add(Restrictions.like("name", text, MatchMode.ANYWHERE));

            List results = cr.list();
            sf.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public ThongKe getInformation(Integer id) {
        try {
            Connection connection = MySQLConnUtils.getMySQLConnection();
            ThongKe thongke = new ThongKe();
            Statement statement;
            String sql = "";
            ResultSet rs;
            int count = 0;

            // setSoLuongSanPham
            statement = connection.createStatement();
            if (id == 0) {
                sql = "select * FROM product";
            } else {
                sql = "select * FROM product where shopId=" + id;
            }

            rs = statement.executeQuery(sql);
            count = 0;
            while (rs.next()) {
                ++count;
            }
            thongke.setSoLuongSanPham(count);
            // SoLuongSanPhamHetHang
            statement = connection.createStatement();
            if (id == 0) {
                sql = "select * FROM product where outOfStock = 1";
            } else {
                sql = "select * FROM product where outOfStock = 1 and shopId=" + id;
            }
            rs = statement.executeQuery(sql);
            count = 0;
            while (rs.next()) {
                ++count;
            }
            thongke.setSoLuongSanPhamHetHang(count);
            // SoLuongSanPhamDaDuyet
            statement = connection.createStatement();
            if (id == 0) {
                sql = "select * FROM product where status = 1 ";
            } else {
                sql = "select * FROM product where status = 1 and shopId=" + id;
            }
            rs = statement.executeQuery(sql);
            count = 0;
            while (rs.next()) {
                ++count;
            }
            thongke.setSoLuongSanPhamDaDuyet(count);

            // SoLuongDonHang
            statement = connection.createStatement();
            if (id == 0) {
                sql = "select a.id from `order` a, orderdetail b, product c where b.orderid = a.id and b.ProductId = c.id group by a.id;";
            } else {
                sql = "select a.id from `order` a, orderdetail b, product c where b.orderid = a.id and b.ProductId = c.id and c.shopId = " + id + " group by a.id;";
            }
            rs = statement.executeQuery(sql);
            count = 0;
            while (rs.next()) {
                ++count;
            }
            thongke.setSoLuongDonHang(count);

            // SoLuongSanPhamDonHang
            statement = connection.createStatement();
            if (id == 0) {
                sql = "select c.shopid from `order` a, orderdetail b, product c where b.orderid = a.id and b.ProductId = c.id";
            } else {
                sql = "select c.shopid from `order` a, orderdetail b, product c where b.orderid = a.id and b.ProductId = c.id and c.shopId =" + id;
            }
            rs = statement.executeQuery(sql);
            count = 0;
            while (rs.next()) {
                ++count;
            }
            thongke.setSoLuongSanPhamDonHang(count);

            // SoLuongSanPhamDaBan
            statement = connection.createStatement();
            if (id == 0) {
                sql = "select b.* from `order` a, orderdetail b, product c where b.orderid = a.id and b.ProductId = c.id and b.status = 1";
            } else {
                sql = "select b.* from `order` a, orderdetail b, product c where b.orderid = a.id and b.ProductId = c.id and b.status = 1 and c.shopId =" + id;
            }
            rs = statement.executeQuery(sql);
            count = 0;
            while (rs.next()) {
                ++count;
            }
            thongke.setSoLuongSanPhamDaBan(count);

            if (id == 0) {
                // SoLuongUser
                statement = connection.createStatement();

                sql = "select * from user";

                rs = statement.executeQuery(sql);
                count = 0;
                while (rs.next()) {
                    ++count;
                }
                thongke.setSoLuongUser(count);

                // SoLuongShop
                statement = connection.createStatement();

                sql = "select * from shop";

                rs = statement.executeQuery(sql);
                count = 0;
                while (rs.next()) {
                    ++count;
                }
                thongke.setSoLuongShop(count);
            }

            // session.getCurrentSession().getTransaction().commit();
            return thongke;
        } catch (Exception e) {
            // session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }
}
