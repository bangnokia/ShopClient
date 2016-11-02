/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CategoryPropertyDAO;
import entity.CategoryProperty;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author daudau
 */
@Controller
public class CategoryController {
    
    public @ResponseBody List<CategoryProperty> getCatProp(@PathVariable("id") int catId) {
        CategoryPropertyDAO cp = new CategoryPropertyDAO();
        List<CategoryProperty> list = cp.getByCatId(catId);
        return list;
    }
}
