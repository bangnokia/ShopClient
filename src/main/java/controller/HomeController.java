/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author daudau
 */
@Controller
public class HomeController {

    public String index(ModelMap mm) {
        mm.addAttribute("title", "Home page");
        return "home";
    }

    public String CategoryIndex(@PathVariable("id") String id, ModelMap mm) {
        mm.addAttribute("id", id); //category id
        return "category";
    }
}
