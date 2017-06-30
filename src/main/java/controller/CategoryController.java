/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import dao.CategoryPropertyDAO;
import entity.Category;
import entity.CategoryProperty;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author daudau
 */
@Controller
public class CategoryController {

    HttpHeaders responseHeaders = new HttpHeaders();

    // public @ResponseBody List<CategoryProperty> getCatProp(@PathVariable("id") int catId) {
    //   CategoryPropertyDAO cp = new CategoryPropertyDAO();
    //   List<CategoryProperty> list = cp.getByCatId(catId);
    //   return list;
    // }
    public ResponseEntity<String> getCatProp(HttpServletRequest req, @RequestParam("idcat") int catId) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                CategoryPropertyDAO cp = new CategoryPropertyDAO();
                List<CategoryProperty> catlist = cp.getByCatId(catId);

                String json = new Gson().toJson(catlist);
                if (json != null) {
                    jsonOB.put("result", json);
                    jsonOB.put("message", "success_ok");
                } else {
                    jsonOB.put("message", "success_fail");
                }
            } catch (Exception e) {
                jsonOB.put("message", "success_fail");
            }
        }

        String json1 = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }
}
