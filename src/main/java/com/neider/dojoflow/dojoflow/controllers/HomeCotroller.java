package com.neider.dojoflow.dojoflow.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeCotroller {
    @GetMapping("/")
    String home(){
        return "index.jsp";
    }
}
