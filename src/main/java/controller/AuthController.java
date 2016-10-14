/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.User;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpSession;
import lib.Helper;
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
    public String postLogin(@RequestParam("usernameLogin") String username, @RequestParam("passwordLogin") String password, ModelMap mm) throws NoSuchAlgorithmException {        
        User user = userDAO.findUserByName(username);
        if (user != null && user.getPassword().equals(Helper.md5(password))) {
            session.setAttribute("user", user);
            return "redirect:/";
        }
        
        mm.addAttribute("title", "Login");
        mm.addAttribute("loginError", "Login fail, please try again or using forgot password!");
        return "/auth/login";
    }
    
    public String postRegister(
        ModelMap mm,
        @RequestParam("name") String name, 
        @RequestParam("username") String username, 
        @RequestParam("email") String email,
        @RequestParam("password") String password,
        @RequestParam("address") String address
    ) throws NoSuchAlgorithmException {
        //check if username or email exists
        if (userDAO.findUserByName(username) == null && userDAO.findUserByEmail(email) == null) {
            User user = new User(username, password, name, address, "", email, "1", (byte) 1);
            if (userDAO.save(user))
                mm.addAttribute("registerNotice", "Register successfully");
            else
                mm.addAttribute("registerNotice", "cant register, something wrong");
        } else {
            mm.addAttribute("registerNotice", "username or email is exist");
        }     
        return "auth/login";
    }
    
    //logout account
    public String logout() {
        session.removeAttribute("user");
        return "redirect:/";
    }
   
}
