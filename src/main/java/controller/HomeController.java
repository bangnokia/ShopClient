package controller;

import com.google.gson.Gson;
import dao.UserDAO;
import entity.ThongKe;
import java.util.List;
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
public class HomeController {

    UserDAO userDao = new UserDAO();
    HttpHeaders responseHeaders = new HttpHeaders();

    public String index(ModelMap mm) {
        mm.addAttribute("title", "Home page");
        return "home";
    }

    public String CategoryIndex(@PathVariable("id") String id, ModelMap mm) {
        mm.addAttribute("id", id); //category id
        return "category";
    }

    public ResponseEntity<String> Information(@RequestParam("shopId") String shopId) {
        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        int shopIdTemp = 0;

        try {
            idTemp = Integer.parseInt(shopId);
        } catch (Exception e) {
        }

        try {
            ThongKe object = userDao.getInformation(idTemp);

            String json = new Gson().toJson(object);
            if (json != null) {
                jsonOB.put("result", "[" + json + "]");
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
