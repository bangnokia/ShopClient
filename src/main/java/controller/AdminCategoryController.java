package controller;

import com.google.gson.Gson;
import dao.CategoryDAO;
import entity.Category;
import java.util.List;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.json.JSONObject;

@Controller
public class AdminCategoryController {

    // @Autowired
    private CategoryDAO CategoryDAO = new CategoryDAO();

    public String index(ModelMap cate) {
        return "/admin/category";
    }

    // @RequestMapping(value = "/json", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> getlistCAT() {
        JSONObject jsonOB = new JSONObject();
        try {
            List<Category> catlist = CategoryDAO.getlistCAT();

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

        String json1 = new Gson().toJson(jsonOB);
        return new ResponseEntity<String>(json1, HttpStatus.CREATED);
    }

    public ResponseEntity<String> getitemdetail(@RequestParam("id") String catID) {
        JSONObject jsonOB = new JSONObject();
        try {
            List<Category> catlist = CategoryDAO.getitemDetail(Integer.parseInt(catID));

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

    public ResponseEntity<String> insertCAT(
            @RequestParam("id") String id,
            @RequestParam("parentId") String parentId,
            @RequestParam("name") String name,
            @RequestParam("icon") String icon,
            @RequestParam("status") String status,
            ModelMap cate) {

        JSONObject jsonOB = new JSONObject();

        int idCatTemp = 0;

        try {
            idCatTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        try {
            if (CategoryDAO.insertCat(idCatTemp, parentId, name, icon, status)) {
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

    public String deleteCAT(@RequestParam("id") String id) {

        int idCatTemp = 0;

        try {
            idCatTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        if (CategoryDAO.deleteCat(idCatTemp)) {
            return "/admin/category";
        }

        return "/admin/category";
    }
}
