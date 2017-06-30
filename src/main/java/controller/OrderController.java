package controller;

import com.google.gson.Gson;
import dao.OrderDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {

    HttpHeaders responseHeaders = new HttpHeaders();
    private OrderDAO Orderdao = new OrderDAO();

    public String index(ModelMap mm, HttpServletRequest req) {
        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        mm.addAttribute("title", "Order");
        return "order";
    }

    public ResponseEntity<String> insert(HttpServletRequest req,
            @RequestParam("id") String id,
            @RequestParam("userId") String userId,
            @RequestParam("name") String name,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam("type") String type,
            @RequestParam("address") String address,
            @RequestParam("status") String status,
            @RequestParam("product") String product,
            ModelMap cate) {
        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {

        }

        int uidTemp = 0;

        try {
            uidTemp = Integer.parseInt(userId);
        } catch (Exception e) {

        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                if (Orderdao.insert(idTemp, uidTemp, name, email, phone, address, type, status, product)) {
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
