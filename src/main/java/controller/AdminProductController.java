package controller;

import com.google.gson.Gson;
import dao.CategoryDAO;
import dao.ProductDao;
import entity.Category;
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
public class AdminProductController {

    // @Autowired
    private ProductDao ProductDao = new ProductDao();

    public String index(ModelMap cate,HttpServletRequest req) {
        HttpSession session = req.getSession();

        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        User user = (User) session.getAttribute("user");

        if (user.getUserGroup() == 0) {
            return "/admin/product";
        } else {
            return "redirect:/";
        }
    }
}
