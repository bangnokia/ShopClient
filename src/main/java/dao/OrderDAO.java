
package dao;

import entity.CategoryProperty;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import model.HibernateUtil;
import model.MySQLConnUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author daudau
 */
public class OrderDAO {

    private SessionFactory session = HibernateUtil.getSessionFactory();

    public List<Order> getlist(Integer uid,String text, Integer page) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(Order.class);
            cr.add(Restrictions.eq("userId", uid));
             cr.add(Restrictions.like("name", text, MatchMode.ANYWHERE));
            cr.addOrder(org.hibernate.criterion.Order.desc("id"));

            cr.setFirstResult(page * 5 - 5);
            cr.setMaxResults(5);

            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<Order> getlistbyshop(Integer shopid,String text, Integer page) {
        try {
            //  session.getCurrentSession().beginTransaction();

            Connection connection = MySQLConnUtils.getMySQLConnection();

            Statement statement = connection.createStatement();

            String sql = "SELECT a.* FROM `order` a INNER JOIN orderdetail od on a.id = od.orderid INNER JOIN product p on od.productid = p.id where a.name like '%"+text+"%' and p.shopid =" + shopid+" group by id order by a.id desc";

            ResultSet rs = statement.executeQuery(sql);

            List results = new LinkedList();

            while (rs.next()) {
                String address = rs.getString("address");

                String name = rs.getString("name");
                String type = rs.getString("type");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                int id = rs.getInt("id");
                int userId = rs.getInt("userId");
                Date createdAt = rs.getDate("createdAt");
                Date updatedAt = rs.getDate("updatedAt");
                String status = rs.getString("status");

                Order order = new Order(userId, createdAt, updatedAt, status, address, name, phone, email, type);
                order.setId(id);
                results.add(order);
            }
            connection.close();
            //  session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            // session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public List<OrderDetail> getdetailbyshop(Integer shopid, Integer orderid) {
        try {
            // session.getCurrentSession().beginTransaction();

            Connection connection = MySQLConnUtils.getMySQLConnection();

            Statement statement = connection.createStatement();

            String sql = "select a.* FROM orderdetail a inner join product b on a.productId = b.id  where b.shopid =" + shopid + " and orderId=" + orderid;

            // Thực thi câu lệnh SQL trả về đối tượng ResultSet.
            ResultSet rs = statement.executeQuery(sql);

            //Query query = session.getCurrentSession().createQuery("FROM orderdetail");
            //   query.setParameter("shopid", shopid);
            //  OrderDetail order = (OrderDetail) query.uniqueResult();
            List results = new LinkedList();

            while (rs.next()) {
                int ProductId = rs.getInt("productId");
                int Quantity = rs.getInt("quantity");
                String status = rs.getString("status");
                OrderDetail order = new OrderDetail();
                order.setProductId(ProductId);
                order.setQuantity(Quantity);
                order.setStatus(status);
                results.add(order);
            }
            connection.close();
            // session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            // session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public String getstatusorder(Integer shopid, Integer orderid) {
        String results = "1";
        try {
            Connection connection = MySQLConnUtils.getMySQLConnection();

            Statement statement = connection.createStatement();
            Statement statement1 = connection.createStatement();
            String sql = "";
            String sql1 = "";
            
            if (shopid == 0) {
                sql = "select * FROM orderdetail where status = 1 and orderId=" + orderid;
                sql1 = "select * FROM orderdetail where orderId=" + orderid;
            } else {
                sql = "select a.* FROM orderdetail a inner join product b on a.productId = b.id  where a.status = 1 and b.shopid =" + shopid + " and orderId=" + orderid;
                sql1 = "select a.* FROM orderdetail a inner join product b on a.productId = b.id  where b.shopid =" + shopid + " and orderId=" + orderid;
            }
            
            ResultSet rs = statement.executeQuery(sql);
            
            ResultSet rs1 = statement1.executeQuery(sql1);

            int count = 0;
            int count1 = 0;
            while (rs.next()) {
                ++count;
            }
            while (rs1.next()) {
                ++count1;
            }

            if (count != 0) {
                results = "2";
            }

            if (count == count1) {
                results = "3";
            }

            connection.close();

            return results;
        } catch (Exception e) {

            return null;
        }
    }

    public List<OrderDetail> getDetail(Integer ID) {
        try {
            session.getCurrentSession().beginTransaction();

            Criteria cr = session.getCurrentSession().createCriteria(OrderDetail.class);
            cr.add(Restrictions.eq("orderId", ID));
            //Query query = session.getCurrentSession().createQuery("select p.*  OrderDetail p JOIN Product pl where pl.id = p.productId and p.orderId := orderId");
            // query.setParameter("orderId", ID);
            // OrderDetail user = (OrderDetail) query.uniqueResult();

            List results = cr.list();
            session.getCurrentSession().getTransaction().commit();
            return results;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return null;
        }
    }

    public boolean insert(Integer id, Integer userId, String name, String email, String phone, String address, String type, String status, String product) {
        CategoryPropertyDAO cate = new CategoryPropertyDAO();
        try {
            session.getCurrentSession().beginTransaction();

            Order order = new Order();
            OrderDetail orderdetail = null;

            order.setAddress(address);
            order.setCreatedAt(new Date());
            order.setId(id);
            order.setName(name);
            order.setPhone(phone);
            order.setStatus(status);
            order.setUpdatedAt(new Date());
            order.setUserId(userId);
            order.setEmail(email);
            order.setType(type);

            if (id != 0) {
                session.getCurrentSession().update(order);
            } else {
                session.getCurrentSession().save(order);
            }

            String[] productList = product.split("SEPARATE");

            for (int i = 0; i < productList.length; i++) {
                if (productList[i].equals("") == false) {
                    String idtemp = productList[i].split(";")[0];
                    String qtytemp = productList[i].split(";")[1];

                    orderdetail = new OrderDetail();
                    orderdetail.setOrderId(order.getId());
                    orderdetail.setProductId(Integer.parseInt(idtemp));
                    orderdetail.setQuantity(Integer.parseInt(qtytemp));

                    session.getCurrentSession().save(orderdetail);
                }
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

            Order order = new Order();

            order.setId(id);           
            
            Connection connection = MySQLConnUtils.getMySQLConnection();
            
            Statement statement = connection.createStatement();
            String sql = "select * FROM orderdetail where orderId=" + id+" and status = 1";
                
            ResultSet rs = statement.executeQuery(sql);

            int count = 0;
            while (rs.next()) {
                ++count;
            }
            
            if(count!=0) 
                  return false;
            
            Statement statement1 = connection.createStatement();
            String sql1 = "delete from orderdetail where orderId=" + id;                
            statement.execute(sql1);

            connection.close();
            session.getCurrentSession().delete(order);
            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }

    public boolean save(Integer id, String[] arrp) {
        try {
            session.getCurrentSession().beginTransaction();

            for (int i = 0; i < arrp.length; i++) {
                if (arrp[i] != "") {
                    //OrderDetail order = new OrderDetail();

                    //order.setOrderId(id);
                   // order.setProductId(Integer.parseInt(arrp[i]));
                   // order.setStatus("1");

                   // session.getCurrentSession().update(order);

                    Query query = session.getCurrentSession().createQuery("update OrderDetail set status = 1 where OrderId = :OrderId and ProductId = :ProductId");
                    query.setParameter("OrderId", id);
                    query.setParameter("ProductId", Integer.parseInt(arrp[i]));
                    int result = query.executeUpdate();
                    
                    
                }
            }

            session.getCurrentSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
