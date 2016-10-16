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
public class ProfileController {
    
    HttpSession session;
    
    public String index(ModelMap mm) {        
        mm.addAttribute("title", "Profile Setting");
        //mm.addAttribute("user", session.getAttribute("user"));
        return "setting/profile";
    }
}
