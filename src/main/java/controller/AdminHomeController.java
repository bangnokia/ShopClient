/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;

/**
 *
 * @author daudau
 */
@Controller
public class AdminHomeController {

    HttpSession session;

    public String index() {
        return "admin/home";
    }
}
