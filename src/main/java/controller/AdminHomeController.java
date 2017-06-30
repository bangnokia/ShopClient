/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 *
 * @author daudau
 */
@Controller
public class AdminHomeController {
    public String index(HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("user");

        if (user.getUserGroup() == 0) {
            return "admin/home";
        } else {
            return "redirect:/";
        }
    }

     public String information(HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("user");

        if (user.getUserGroup() == 0) {
            return "/admin/information";
        } else {
            return "redirect:/";
        }
    }
}
