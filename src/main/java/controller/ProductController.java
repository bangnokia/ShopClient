/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dao.ProductDao;
import dao.ShopDao;
import entity.Product;
import entity.Rate;
import entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.MySQLConnUtils;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author daudau
 */
@Controller
public class ProductController {

    HttpHeaders responseHeaders = new HttpHeaders();
    private ShopDao ShopDao = new ShopDao();
    private ProductDao ProductDao = new ProductDao();

    public String index(ModelMap mm, HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "setting/product_add";
        }

        mm.addAttribute("title", "Add product");
        return "setting/product_add";
    }

    public ResponseEntity<String> getlist(@RequestParam("Text") String Text,
            @RequestParam("Price") String Price,
            @RequestParam("category") String category,
            @RequestParam("shopId") String shopId,
            @RequestParam("outofstock") String outofstock,
            @RequestParam("status") String status) {
        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        int shopIdTemp = 0;

        try {
            idTemp = Integer.parseInt(category);
        } catch (Exception e) {
        }
        try {
            shopIdTemp = Integer.parseInt(shopId);
        } catch (Exception e) {
        }
        try {

            List<Product> brandlist = ProductDao.getlist(Text, Price, idTemp, shopIdTemp, status, outofstock);

            String json = new Gson().toJson(brandlist);
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

    public ResponseEntity<String> getlistRate(@RequestParam("id") String id) {
        JSONObject jsonOB = new JSONObject();
        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {
        }

        try {
            List<Rate> rate = ProductDao.getlistRate(idTemp);

            String json = new Gson().toJson(rate);
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

    public ResponseEntity<String> insertProduct(HttpServletRequest req,
            @RequestParam("id") String id,
            @RequestParam("name") String name,
            @RequestParam("price") String price,
            @RequestParam("shopId") String shopId,
            @RequestParam("quantity") String quantity,
            @RequestParam("createdAt") String createdAt,
            @RequestParam("brandId") String brandId,
            @RequestParam("status") String status,
            @RequestParam("categoryId") String categoryId,
            @RequestParam("outOfStock") String outOfStock,
            @RequestParam("description") String description,
            @RequestParam("image") String image,
            @RequestParam("property") String property,
            ModelMap cate) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idShopTemp = 0;
        int idTemp = 0;
        int brandIdTemp = 0;
        int shopIdTemp = 0;
        int categoryIdTemp = 0;
        float priceTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {
        }
        try {
            shopIdTemp = Integer.parseInt(shopId);
        } catch (Exception e) {
        }
        try {
            brandIdTemp = Integer.parseInt(brandId);
        } catch (Exception e) {
        }
        try {
            categoryIdTemp = Integer.parseInt(categoryId);
        } catch (Exception e) {
        }
        try {
            priceTemp = Float.parseFloat(price);
        } catch (Exception e) {
        }
        try {
            idShopTemp = Integer.parseInt(shopId);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {

            try {
                User user = (User) SESSION.getAttribute("user");

                if (!ShopDao.checkShopLock(idShopTemp) && user.getUserGroup() != 0) {
                    jsonOB.put("message", "Shop locked!");
                } else if (ProductDao.insert(idTemp, name, priceTemp, idShopTemp, quantity, categoryIdTemp,
                        brandIdTemp, outOfStock, description, image, status, property)) {
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

    public ResponseEntity<String> rating(HttpServletRequest req,
            @RequestParam("id") String id,
            @RequestParam("userId") String userId,
            @RequestParam("rate") String rate,
            @RequestParam("content") String content,
            ModelMap cate) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        int userIdTemp = 0;
        int rateTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {
        }
        try {
            userIdTemp = Integer.parseInt(userId);
        } catch (Exception e) {
        }
        try {
            rateTemp = Integer.parseInt(rate);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                if (ProductDao.rating(idTemp, userIdTemp, rateTemp, content)) {
                    jsonOB.put("message", "success_ok");
                } else {
                    jsonOB.put("message", "Ban da rate product nay roi!");
                }
            } catch (Exception e) {
                jsonOB.put("message", "success_fail");
            }
        }

        String json = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> delete(HttpServletRequest req,
            @RequestParam("id") String id) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                Connection connection = MySQLConnUtils.getMySQLConnection();

                Statement statement = connection.createStatement();
                String sql = "";

                sql = "select * FROM orderdetail where productId=" + idTemp;

                ResultSet rs = statement.executeQuery(sql);

                int count = 0;
                while (rs.next()) {
                    ++count;
                }

                if (count != 0) {
                    jsonOB.put("message", "Product already in the order!");
                } else if (ProductDao.delete(idTemp)) {
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

    public String detail(@PathVariable("id") String id, ModelMap mm) {
        mm.addAttribute("id", id); //product id
        System.out.println(id);
        return "product_detail";
    }

    public ResponseEntity<String> getDetailUser(@RequestParam("id") String ID) {
        JSONObject jsonOB = new JSONObject();
        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(ID);
        } catch (Exception e) {

        }

        try {
            List<User> catlist = ProductDao.getDetailUser(idTemp);

            String json = new Gson().toJson(catlist.get(0).getUsername());
            if (json != "null") {
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

    public ResponseEntity<String> getitemdetail(@RequestParam("id") String ID) {
        JSONObject jsonOB = new JSONObject();
        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(ID);
        } catch (Exception e) {

        }

        try {
            List<Product> catlist = ProductDao.getitemDetail(idTemp);

            String json = new Gson().toJson(catlist);
            if (json != "null") {
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
}
