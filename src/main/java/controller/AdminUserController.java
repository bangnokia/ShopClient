package controller;

import com.google.gson.Gson;
import dao.CategoryDAO;
import dao.ProductDao;
import dao.UserDAO;
import entity.Category;
import entity.Product;
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
public class AdminUserController {

    // @Autowired
    private UserDAO UserDAO = new UserDAO();
    private ProductDao ProductDao = new ProductDao();
    HttpHeaders responseHeaders = new HttpHeaders();

    public String index(ModelMap cate, HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("user");

        if (user.getUserGroup() == 0) {
            return "/admin/manageUser";
        } else {
            return "redirect:/";
        }
    }

    public ResponseEntity<String> getlist(HttpServletRequest req,
            @RequestParam("Text") String Text) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                List<User> brandlist = UserDAO.getlist(Text);

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

    public ResponseEntity<String> manageUser(HttpServletRequest req,
            @RequestParam("id") String id, @RequestParam("type") String type, @RequestParam("status") String status) {

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
                if (UserDAO.manageUser(idTemp, type, status)) {
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
