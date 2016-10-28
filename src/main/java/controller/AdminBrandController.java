package controller;

import com.google.gson.Gson;
import dao.BrandDao;
import entity.Brand;
import java.util.List;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.json.JSONObject;

@Controller
public class AdminBrandController {

    // @Autowired
    private BrandDao Brand = new BrandDao();

    public String index(ModelMap cate) {
        return "/admin/brand";
    }

    // @RequestMapping(value = "/json", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> getlist() {
        JSONObject jsonOB = new JSONObject();
        try {
            List<Brand> brandlist = Brand.getlist();

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

    public ResponseEntity<String> getitemdetail(@RequestParam("id") String catID) {
        JSONObject jsonOB = new JSONObject();
        try {
            List<Brand> catlist = Brand.getitemDetail(Integer.parseInt(catID));

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

    public ResponseEntity<String> insert(
            @RequestParam("id") String id,
            @RequestParam("name") String name,
            @RequestParam("status") String status,
            ModelMap cate) {

        JSONObject jsonOB = new JSONObject();

        int idCatTemp = 0;

        try {
            idCatTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        try {
            if (Brand.insert(idCatTemp, name, status)) {
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
            if (Brand.delete(idTemp)) {
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
