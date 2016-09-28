package controller;

import entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {

    public String index() {
        return "/admin/category";
    }

    public String action(
         //   @RequestParam("idCat") int idCat,
           // @RequestParam("parentID") int parentID,
            @RequestParam("name") String name,
            @RequestParam("icon") String icon,
            @RequestParam("status") String status,
            ModelMap mm) {
        System.out.println("123");

        return "/admin/category";
    } 
  
}
