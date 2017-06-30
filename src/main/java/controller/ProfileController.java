/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import entity.User;
import java.security.NoSuchAlgorithmException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lib.Helper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfileController {

    private UserDAO userDAO = new UserDAO();

    @Autowired
    HttpSession session;

    public String index(ModelMap mm, HttpServletRequest req) {
        session = req.getSession();
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        return "setting/profile";
    }

    public String save(
            ModelMap mm,
            @RequestParam("name") String name,
            @RequestParam("username") String username,
            @RequestParam("email") String email,
            @RequestParam("phone") String phone,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("address") String address
    ) throws NoSuchAlgorithmException {
        //check if username or email exists
        User user = new User();
        try {
            user = userDAO.findUserByName(username);
        } catch (Exception e) {
            return "/setting/profile";
        }

        String passtemp = "";

        if (!newPassword.equals("")) {
            if (user != null && user.getPassword().equals(Helper.md5(oldPassword))) {
                passtemp = Helper.md5(newPassword);
            } else {
                mm.addAttribute("registerNotice", "old Password not correct!");
                return "/setting/profile";
            }
        }

        if (user != null) {
            if (userDAO.update(user.getId(), name, username, email, phone, passtemp, address)) {

                user = userDAO.findUserByName(username);

                session.setAttribute("user", user);

                mm.addAttribute("registerNotice", "Edit successfully!");
            } else {
                mm.addAttribute("registerNotice", "Cant Edit, something wrong");
            }
        } else {
            mm.addAttribute("registerNotice", "Username does't exist");
        }

        return "/setting/profile";
    }
}
