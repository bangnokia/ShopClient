package controller;

import com.google.gson.Gson;
import dao.CategoryDAO;
import dao.ProductDao;
import entity.Category;
import java.util.List;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.json.JSONObject;

@Controller
public class AdminProductController {

    // @Autowired
    private ProductDao ProductDao = new ProductDao();

    public String index(ModelMap cate) {
        return "/admin/product";
    }

    public ResponseEntity<String> browse(
            @RequestParam("id") String id,
            @RequestParam("status") String status,
            ModelMap cate) {

        JSONObject jsonOB = new JSONObject();

        int idCatTemp = 0;

        try {
            idCatTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        try {
            if (ProductDao.browse(idCatTemp, status)) {
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
}
