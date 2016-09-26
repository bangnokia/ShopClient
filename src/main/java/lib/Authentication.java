/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lib;

import entity.User;
import dao.UserDAO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.support.ServletContextScope;
/**
 *
 * @author daudau
 */
public class Authentication {
    
//    private final UserDAO userDAO = new UserDAO();
//    HttpSession session;    
//    
//    public boolean authenticateUser(User userLogin) {
//        User user = userDAO.findUserByName(userLogin.getUsername());
//        if ( user != null && user.getPassword().equals(userLogin.getPassword()) ) {
//            //generate session for user   
//            session.setAttribute("user", user);
//            return true;
//        }
//        return false;
//    }
}
