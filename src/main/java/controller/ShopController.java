/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dao.ShopDao;
import entity.Product;
import entity.Shop;
import entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.MySQLConnUtils;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author daudau
 */
@Controller
public class ShopController {

    HttpHeaders responseHeaders = new HttpHeaders();

    private ShopDao ShopDao = new ShopDao();
    private AuthController AuthController = new AuthController();
    // HttpSession session;

    public String index(@ModelAttribute("abbbbb") String id, ModelMap mm, HttpServletRequest req) {
        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        return "setting/shop";
    }

    public ResponseEntity<String> getAll() {
        JSONObject jsonOB = new JSONObject();
        try {
            String json;

            List<Shop> shoplist = ShopDao.getAll();
            json = new Gson().toJson(shoplist);

            if (json != null) {
                jsonOB.put("result", json);
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "success_fail");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json1 = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> getlist(@RequestParam("userId") String id) {
        JSONObject jsonOB = new JSONObject();
        try {
            int idTemp = 0;
            String json;
            try {
                idTemp = Integer.parseInt(id);
            } catch (Exception e) {
            }
            if (ShopDao.checkShop(idTemp)) {
                List<Shop> shoplist = ShopDao.getlist(idTemp);
                json = new Gson().toJson(shoplist);
            } else {
                json = null;
            }

            if (json != null) {
                jsonOB.put("result", json);
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "success_fail");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        responseHeaders.add("Content-Type", "text/html; charset=utf-8");

        String json1 = new Gson().toJson(jsonOB);
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> getdetail(@RequestParam("shopId") String id) {
        JSONObject jsonOB = new JSONObject();
        try {
            int idTemp = 0;
            String json;
            try {
                idTemp = Integer.parseInt(id);
            } catch (Exception e) {
            }

            List<Shop> shoplist = ShopDao.getdetail(idTemp);
            json = new Gson().toJson(shoplist);

            if (json != null) {
                jsonOB.put("result", json);
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "success_fail");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json1 = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> insertShop(HttpServletRequest req,
            @RequestParam("id") String id,
            @RequestParam("userId") String userId,
            @RequestParam("name") String name,
            @RequestParam("address") String address,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam("facebook") String facebook,
            @RequestParam("status") String status,
            ModelMap cate) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        int userIdTemp = 0;
        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {
        }
        try {
            userIdTemp = Integer.parseInt(userId);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else if (ShopDao.checkShopEmail(idTemp, email)) {
            jsonOB.put("message", "This email  has been used!");
        } else {
            try {
                if (!ShopDao.checkShopLock(idTemp)) {
                    jsonOB.put("message", "Shop locked!");
                } else if (ShopDao.insert(idTemp, userIdTemp, name, address, phone, email, facebook, status)) {
                    jsonOB.put("message", "success_ok");
                } else {
                    jsonOB.put("message", "success_fail");
                }
            } catch (Exception e) {
                jsonOB.put("message", "success_fail");
            }
        }

        String json = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> delete(
            @RequestParam("id") String id) {

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        try {
            if (ShopDao.delete(idTemp)) {
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "success_fail");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
    }
}
