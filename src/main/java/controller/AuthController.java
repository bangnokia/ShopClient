/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.User;
import lib.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
/**
 *
 * @author daudau
 */
@Controller
public class AuthController {
        
    
//    @Autowired
//    private Authentication auth;
//    get form login 
    @Autowired
    private UserDAO userDAO;
    
    public String login() {        
        return "auth/login";
    }
    
    //process login request
    public String postLogin(@RequestParam("usernameLogin") String username, @RequestParam("passwordLogin") String password, ModelMap mm) {
//        auth = new Authentication();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        
        User user2 = userDAO.findUserByName(username);
        if (user2.getPassword().equals(password))
            return "home";        
        return "auth/login";
    }
   
}
