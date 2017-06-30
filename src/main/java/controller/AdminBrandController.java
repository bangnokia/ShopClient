package controller;

import com.google.gson.Gson;
import dao.BrandDao;
import entity.Brand;
import entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.MySQLConnUtils;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.json.JSONObject;

@Controller
public class AdminBrandController {

    // @Autowired
    private BrandDao Brand = new BrandDao();
    HttpHeaders responseHeaders = new HttpHeaders();

    public String index(ModelMap cate, HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("user");

        if (user.getUserGroup() == 0) {
            return "/admin/brand";
        } else {
            return "redirect:/";
        }
    }

    // @RequestMapping(value = "/json", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> getlist(HttpServletRequest req) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
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
        }

        String json1 = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> getitemdetail(HttpServletRequest req, @RequestParam("id") String catID) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
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
        }

        String json1 = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> insert(HttpServletRequest req,
            @RequestParam("id") String id,
            @RequestParam("name") String name,
            @RequestParam("status") String status,
            ModelMap cate) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idCatTemp = 0;

        try {
            idCatTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                if (Brand.insert(idCatTemp, name, status)) {
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

                sql = "select * FROM product where brandId=" + idTemp;

                ResultSet rs = statement.executeQuery(sql);

                int count = 0;
                while (rs.next()) {
                    ++count;
                }

                if (count != 0) {
                    jsonOB.put("message", "Brand already have product!");
                } else if (Brand.delete(idTemp)) {
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
}
