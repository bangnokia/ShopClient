/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dao.ProductDao;
import entity.Product;
import entity.Rate;
import entity.User;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
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

    private ProductDao ProductDao = new ProductDao();
    HttpSession session;

    public String index(ModelMap mm) {
        mm.addAttribute("title", "Add product");
        return "setting/product_add";
    }

    public ResponseEntity<String> getlist(@RequestParam("Text") String Text,
            @RequestParam("Price") String Price, @RequestParam("category") String category) {
        JSONObject jsonOB = new JSONObject();
        try {
            List<Product> brandlist = ProductDao.getlist(Text, Price, category);

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
        return new ResponseEntity<String>(json1, HttpStatus.CREATED);
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
        return new ResponseEntity<String>(json1, HttpStatus.CREATED);
    }

    public ResponseEntity<String> insertProduct(
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
            ModelMap cate) {

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        int brandIdTemp = 0;
        int categoryIdTemp = 0;
        float priceTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
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
            if (ProductDao.insert(idTemp, name, priceTemp, shopId, quantity, categoryIdTemp,
                    brandIdTemp, outOfStock, description, image, status)) {
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "success_fail");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json = new Gson().toJson(jsonOB);
        return new ResponseEntity<String>(json, HttpStatus.CREATED);
    }

    public ResponseEntity<String> rating(
            @RequestParam("id") String id,
            @RequestParam("userId") String userId,
            @RequestParam("rate") String rate,
            @RequestParam("content") String content,
            ModelMap cate) {

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

        try {
            if (ProductDao.rating(idTemp, userIdTemp, rateTemp, content)) {
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "Ban da rate product nay roi!");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json = new Gson().toJson(jsonOB);
        return new ResponseEntity<String>(json, HttpStatus.CREATED);
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
            if (ProductDao.delete(idTemp)) {
                jsonOB.put("message", "success_ok");
            } else {
                jsonOB.put("message", "success_fail");
            }
        } catch (Exception e) {
            jsonOB.put("message", "success_fail");
        }

        String json = new Gson().toJson(jsonOB);
        return new ResponseEntity<String>(json, HttpStatus.CREATED);
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
        return new ResponseEntity<String>(json1, HttpStatus.CREATED);
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
        return new ResponseEntity<String>(json1, HttpStatus.CREATED);
    }
}
