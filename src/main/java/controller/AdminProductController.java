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
}
