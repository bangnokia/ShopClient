/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

/**
 *
 * @author daudau
 */
@Controller
public class ProductController {
    
    HttpSession session;
    
    public String create(ModelMap mm) {
        mm.addAttribute("title", "Add product");
        return "setting/product_add";
    }
}
