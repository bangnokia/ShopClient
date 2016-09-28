package controller;

import dao.CategoryDAO;
import entity.Category;
import static java.util.Collections.list;
import java.util.List;
import javax.jws.WebMethod;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {

    // private static SessionFactory session = HibernateUtil.getSessionFactory();
    // @Autowired
    private CategoryDAO CategoryDAO = new CategoryDAO();

    public String index() {
        return "/admin/category";
    }

    @WebMethod(operationName = "fillall")
    public List<Category> getlistCAT() {
        return CategoryDAO.getlistCAT();
    }

    public String insertCAT(
            @RequestParam("idCat") String idCat,
            @RequestParam("parentID") String parentID,
            @RequestParam("name") String name,
            @RequestParam("icon") String icon,
            @RequestParam("status") String status,
            ModelMap mm) {

        if (CategoryDAO.insertCat(idCat, parentID, name, icon, status)) {
            return "/admin/category";
        }
        return "/admin/category";
    }

    public void deleteCAT(String name) {
        System.out.println(name);
       // return "/admin/category";
    }
//
//    public List<Category> getlistCat() {
//        
//        return CategoryDAO.
//    }
//
//    public static void main(String[] args) {
//        session.getCurrentSession().beginTransaction();
//
//        Query query = session.getCurrentSession().createQuery("FROM Category");
//        //  WHERE idCat =:idcat
//        //  query.setParameter("idcat", 2);
//        Category category = (Category) query.uniqueResult();
//
//        while (category.) {
//            System.out.println(category.getName());
//        }
//    }

}
