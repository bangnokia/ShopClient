/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;
import dbclass.Users;
/**
 *
 * @author daudau
 */
@Controller
public class AuthController {
    
//    get form login
    public String login() {
        
        return "auth/login";
    }
    
    //process login request
    public String postLogin(@RequestParam("username") String username, @RequestParam("password") String password, ModelMap mm) {
        if (username.equals("daudau") && password.equals("123"))
            return "redirect:/";        
        else {            
            mm.addAttribute("error", "authenticating error");
            return "auth/login";
        }            
    }
    
    public String dau() {
        Users user = new Users();
        
        return "auth/user";
    }
}
