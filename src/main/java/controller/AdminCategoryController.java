package controller;

import com.google.gson.Gson;
import dao.CategoryDAO;
import entity.Category;
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
import org.springframework.web.context.request.*;

@Controller
public class AdminCategoryController {

    // @Autowired
    private CategoryDAO CategoryDAO = new CategoryDAO();
    HttpHeaders responseHeaders = new HttpHeaders();
//    RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
//    ServletRequestAttributes attributes = (ServletRequestAttributes) requestAttributes;
//    HttpServletRequest request = attributes.getRequest();
//    HttpSession session = request.getSession(true);

    public String index(ModelMap cate, HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("user");

        if (user.getUserGroup() == 0) {
            return "/admin/category";
        } else {
            return "redirect:/";
        }
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
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> getlistCATADMIN(HttpServletRequest req) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                List<Category> catlist = CategoryDAO.getlistCATADMIN();

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

    public ResponseEntity<String> getitemdetail(HttpServletRequest req, @RequestParam("id") String catID) {
        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
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
        }

        String json1 = new Gson().toJson(jsonOB);
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        return new ResponseEntity<String>(json1, responseHeaders, HttpStatus.CREATED);
    }

    public ResponseEntity<String> insertCAT(HttpServletRequest req,
            @RequestParam("id") String id,
            @RequestParam("parentId") String parentId,
            @RequestParam("name") String name,
            @RequestParam("icon") String icon,
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
                if (CategoryDAO.insertCat(idCatTemp, parentId, name, icon, status)) {
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

    public ResponseEntity<String> deleteCAT(HttpServletRequest req,
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

                sql = "select * FROM product where categoryId=" + idTemp;

                ResultSet rs = statement.executeQuery(sql);

                int count = 0;
                while (rs.next()) {
                    ++count;
                }

                if (count != 0) {
                    jsonOB.put("message", "Category already have product!");
                } else if (CategoryDAO.deleteCat(idTemp)) {
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
