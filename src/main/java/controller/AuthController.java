/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dao.ProductDao;
import dao.UserDAO;
import entity.Product;
import entity.User;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author daudau
 */
@Controller
public class AuthController {

    HttpHeaders responseHeaders = new HttpHeaders();
    private ProductDao ProductDao = new ProductDao();
    @Autowired
    private UserDAO userDAO;
    @Autowired
    HttpSession session;
    public String BackUrl = "";

    public String login(ModelMap mm, @RequestParam("backurl") String backurl) {
        if (backurl != null || backurl != "") {
            BackUrl = backurl;
        }

        if (session.getAttribute("user") != null) {
            // if (BackUrl != null || BackUrl != "") {
            return BackUrl;
            //}
            //  return "redirect:/";
        }

        mm.addAttribute("title", "Login");
        return "auth/login";
    }

    //process login request
    public String postLogin(@RequestParam("usernameLogin") String username, @RequestParam("passwordLogin") String password, ModelMap mm) throws NoSuchAlgorithmException {
        User user = userDAO.findUserByName(username);
        if (user != null && user.getPassword().equals(Helper.md5(password))) {
            session.setAttribute("user", user);

            if (BackUrl != null && BackUrl != "") {
                return BackUrl;
            }

            if (user.getUserGroup() == 0) {
                return "admin/home";
            } else {
                return "redirect:/";
            }
        }

        mm.addAttribute("title", "Login");
        mm.addAttribute("loginError", "Login fail, please try again or using forgot password!");
        return "/auth/login";
    }

    public ResponseEntity<String> insertCart(@RequestParam("id") String catid) {
        JSONObject jsonOB = new JSONObject();
        ArrayList arr = null;

        arr = (ArrayList) session.getAttribute("cart");

        if (arr == null || arr.size() == 0) {
            arr = new ArrayList();
        }

        boolean check = true;
        String id = "";
        for (int i = 0; i < arr.size(); i++) {
            id = arr.get(i).toString();
            if (id.equals(catid)) {
                check = false;
            }
        }

        if (check && !catid.equals("0")) {
            arr.add(catid);
            session.setAttribute("cart", arr);
        }

        ArrayList<Product> catlist = new ArrayList();

        for (int i = 0; i < arr.size(); i++) {
            id = arr.get(i).toString();
            catlist.add(ProductDao.getitemDetail(Integer.parseInt(id)).get(0));
        }

        try {
            String json = new Gson().toJson(catlist);
            if (true) {
                jsonOB.put("result", json);
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "product already in cart!");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> deleteCart(@RequestParam("id") String catid) {
        JSONObject jsonOB = new JSONObject();
        ArrayList arr = null;

        arr = (ArrayList) session.getAttribute("cart");

        if (arr == null || arr.size() == 0) {
            arr = new ArrayList();
        }

        boolean check = false;
        String id = "";
        for (int i = 0; i < arr.size(); i++) {
            id = arr.get(i).toString();
            if (id.equals(catid)) {
                arr.remove(i);
                check = true;
            }
        }

        if (check && !catid.equals("0")) {
            session.setAttribute("cart", arr);
        }

        ArrayList<Product> catlist = new ArrayList();

        for (int i = 0; i < arr.size(); i++) {
            id = arr.get(i).toString();
            catlist.add(ProductDao.getitemDetail(Integer.parseInt(id)).get(0));
        }

        try {
            String json = new Gson().toJson(catlist);
            if (true) {
                jsonOB.put("result", json);
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "product already in cart!");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> clearCart() {
        JSONObject jsonOB = new JSONObject();
        ArrayList arr = null;

        session.setAttribute("cart", arr);

        try {
            if (true) {
                jsonOB.put("result", "");
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "product already in cart!");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
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
            User user = new User(username, Helper.md5(password), name, address, "", email, "1", (byte) 1);
            if (userDAO.save(user)) {
                mm.addAttribute("registerNotice", "Register successfully, please login!");
            } else {
                mm.addAttribute("registerNotice", "Cant register, something wrong");
            }
        } else {
            mm.addAttribute("registerNotice", "Username or email is exist");
        }
        return "auth/login";
    }

    //logout account
    public String logout() {
        session.removeAttribute("user");
        return "redirect:/";
    }

}
