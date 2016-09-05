/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import model.Student;
import model.Fuck;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author daudau
 */
@Controller
public class HomeController {
    
    public String index() {
        return "home";
    }
    
    //@RequestMapping(value="/fuck", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody Fuck fuck() {
        return new Fuck("dau dau", "19 nguyen trai");
    }
    
    //@RequestMapping(value = "/moreFuck", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Fuck> moreFuck() {
        List<Fuck> listFuck = new ArrayList<>();
        
        listFuck.add(new Fuck("dau", "3"));
        listFuck.add(new Fuck("dau dau", "32"));
        listFuck.add(new Fuck("dau dau dau", "322"));
        return listFuck;         
    }
    
    @RequestMapping(value="/test2", method = RequestMethod.GET)
    public String test2(ModelMap mm) {       
        //RestTemplate rt = new RestTemplate();
        //Student s = rt.getForObject("http://localhost:8084/api/home", Student.class);        
        //mm.addAttribute("student", s);
        return "test2";
    }
    
    @RequestMapping(value="/home2", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody Student index2() {
        Student st = new Student(2, "daudau2", 23);
        return st;
    }
    
}