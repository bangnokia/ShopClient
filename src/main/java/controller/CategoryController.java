package controller;

import dao.CategoryDAO;
import entity.Category;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {

    // private static SessionFactory session = HibernateUtil.getSessionFactory();
    // @Autowired
    private CategoryDAO CategoryDAO = new CategoryDAO();

    public String index(ModelMap cate) {
        // cate.addAttribute("abbbb", "12345");

        // List<Category> catlist = CategoryDAO.getlistCAT();
        //cate.addAttribute("bbbbbbbbbbb", catlist);
        // cate.addAllAttributes(catlist);
        //cate.addAllAttributes(List<Category> CategoryDAO.getlistCAT());
        return "/admin/category";

    }

    //  @WebMethod(operationName = "fillall")
    public String getlistCAT(ModelMap cate) {

        List<Category> catlist = CategoryDAO.getlistCAT();
        cate.addAttribute("listCAT", catlist);
        //  cate.addAllAttributes(catlist);

        return "/admin/category";
    }

    public String insertCAT(
            @RequestParam("idCat") String idCat,
            @RequestParam("parentID") String parentID,
            @RequestParam("name") String name,
            @RequestParam("icon") String icon,
            @RequestParam("status") String status,
            ModelMap cate) {

        if (CategoryDAO.insertCat(idCat, parentID, name, icon, status)) {
            return "/admin/category";
        }

        return "/admin/category";
    }

    public String deleteCAT(@RequestParam("id") String id) {

        System.out.println(id);
        return id;
        // return "/admin/category";
    }

//    public void getlistCat(){
//        return (Category) CategoryDAO.getlistCAT();
//    }
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
