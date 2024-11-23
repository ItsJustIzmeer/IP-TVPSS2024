package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {
    @RequestMapping("/student")
    public String studentDashboard() {
        return "studentDashboard";
    }
    
    @RequestMapping("/event")
    public String Event() {
        return "Event";
    }
    
    @RequestMapping("/status")
    public String Status() {
        return "Status";
    }
    
    
}

C:\Users\user\Documents\workspace-spring-tool-suite-4-4.25.0.RELEASE\IP-TVPSS2024