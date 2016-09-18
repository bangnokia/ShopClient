/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.User;
import javax.servlet.http.HttpSession;
import lib.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
/**
 *
 * @author daudau
 */
@Controller
public class AuthController {
        
    @Autowired
    private UserDAO userDAO;
    @Autowired
    HttpSession session;
    
    public String login(ModelMap mm) {                
        if (session.getAttribute("user") != null)
            return "redirect:/";
        mm.addAttribute("title", "Login");
        return "auth/login";
    }
    
    //process login request
    public String postLogin(@RequestParam("usernameLogin") String username, @RequestParam("passwordLogin") String password, ModelMap mm) {        
        User user = userDAO.findUserByName(username);
        if (user != null && user.getPassword().equals(password)) {
            session.setAttribute("user", user);
            return "redirect:/";
        }
        
        mm.addAttribute("title", "Login");
        mm.addAttribute("loginError", "Login fail, please try again or using forgot password!");
        return "/auth/login";
    }
    
    //logout account
    public String logout() {
        session.removeAttribute("user");
        return "redirect:/";
    }
   
}
