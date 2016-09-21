package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CategoryController {

    public String index() {
        return "admin/category";
    }

    public String action(
            // @RequestParam("category_action_catid") String catID,
            @RequestParam("category_action_parentid") String parentID,
            ModelMap mm) {
        String catID = "";
        System.out.println(catID + "|" + parentID);
        mm.addAttribute("mess", "login error");
        return "/category";
    } 

}
