package controller;

import com.google.gson.Gson;
import dao.CategoryPropertyDAO;
import entity.CategoryProperty;
import entity.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.json.JSONObject;

@Controller
public class AdminCategoryPropertyController {

    HttpHeaders responseHeaders = new HttpHeaders();
    // @Autowired
    private CategoryPropertyDAO CategoryPropertyDAO = new CategoryPropertyDAO();

    public String index(ModelMap cate, HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("user");

        if (user.getUserGroup() == 0) {
            return "/admin/categoryProperty";
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
                List<CategoryProperty> catlist = CategoryPropertyDAO.getlist();

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
                List<CategoryProperty> catlist = CategoryPropertyDAO.getitemDetail(Integer.parseInt(catID));

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
            @RequestParam("catId") String catId,
            @RequestParam("name") String name,
            @RequestParam("status") String status,
            ModelMap cate) {
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
                if (CategoryPropertyDAO.insert(idTemp, catId, name, status)) {
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
                if (CategoryPropertyDAO.delete(idTemp)) {
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
