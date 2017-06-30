package controller;

import com.google.gson.Gson;
import dao.OrderDAO;
import dao.ShopDao;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.Shop;
import entity.User;
import java.util.List;
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
public class MyOrderController {

    HttpHeaders responseHeaders = new HttpHeaders();
    private ShopDao ShopDao = new ShopDao();
    private OrderDAO Orderdao = new OrderDAO();

    public String index(ModelMap mm, HttpServletRequest req) {
        HttpSession session = req.getSession();
        if (session.getAttribute("user") == null) {
            return "redirect:/";
        }

        mm.addAttribute("title", "Order");
        return "myOrder";
    }

    public String indexShopOrder(ModelMap mm, HttpServletRequest req) {
        mm.addAttribute("title", "Shop Order");
        return "ShopOrder";
    }

    public ResponseEntity<String> getlist(HttpServletRequest req, @RequestParam("id") String id, @RequestParam("text") String text, @RequestParam("page") String page) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(id);
        } catch (Exception e) {
        }
        int pagetemp = 0;

        try {
            pagetemp = Integer.parseInt(page);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                List<Order> brandlist = Orderdao.getlist(idTemp, text, pagetemp);

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

    public ResponseEntity<String> getlistbyshop(HttpServletRequest req, @RequestParam("shopid") String shopid, @RequestParam("text") String text, @RequestParam("page") String page) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(shopid);
        } catch (Exception e) {
        }
        int pagetemp = 0;

        try {
            pagetemp = Integer.parseInt(page);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                List<Order> brandlist = Orderdao.getlistbyshop(idTemp, text, pagetemp);

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

    public ResponseEntity<String> getdetailbyshop(HttpServletRequest req, @RequestParam("shopid") String shopid, @RequestParam("orderid") String orderid) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        try {
            idTemp = Integer.parseInt(shopid);
        } catch (Exception e) {
        }

        int orderidtemp = 0;
        try {
            orderidtemp = Integer.parseInt(orderid);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                List<OrderDetail> brandlist = Orderdao.getdetailbyshop(idTemp, orderidtemp);

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

    public ResponseEntity<String> getstatusorder(HttpServletRequest req, @RequestParam("shopid") String shopid, @RequestParam("orderid") String orderid) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        try {
            idTemp = Integer.parseInt(shopid);
        } catch (Exception e) {
        }

        int orderidtemp = 0;
        try {
            orderidtemp = Integer.parseInt(orderid);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                String result = Orderdao.getstatusorder(idTemp, orderidtemp);

                String json = new Gson().toJson(result);
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

    public ResponseEntity<String> getOrderDetail(HttpServletRequest req, @RequestParam("id") String ID) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();
        int idTemp = 0;

        try {
            idTemp = Integer.parseInt(ID);
        } catch (Exception e) {

        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                List<OrderDetail> catlist = Orderdao.getDetail(idTemp);

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
                if (Orderdao.delete(idTemp)) {
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

    public ResponseEntity<String> saveorder(HttpServletRequest req,
            @RequestParam("orderid") String orderid,
            @RequestParam("arrp") String arrp,
            ModelMap cate) {

        HttpSession SESSION = req.getSession();

        JSONObject jsonOB = new JSONObject();

        int idTemp = 0;
        String[] arrptemp = arrp.split(",");

        try {
            idTemp = Integer.parseInt(orderid);
        } catch (Exception e) {
        }

        if (SESSION.getAttribute("user") == null) {
            jsonOB.put("message", "Out of session!");
        } else {
            try {
                User user = (User) SESSION.getAttribute("user");

                List<Shop> shoplist = ShopDao.getlist(user.getId());

                if (!ShopDao.checkShopLock(shoplist.get(0).getId())) {
                    jsonOB.put("message", "Shop locked!");
                } else if (Orderdao.save(idTemp, arrptemp)) {
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
