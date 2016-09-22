/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;

/**
 *
 * @author daudau
 */
@Controller
public class AdminHomeController {
    
    public String index() {
        return "admin/home";
    }
    
    public String category() {
        return "admin/category";
    }
}
