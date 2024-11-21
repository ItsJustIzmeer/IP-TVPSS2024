package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {
	@RequestMapping("/homie")
	@ResponseBody()
	public String hometown() {
		return "this is homie";
	}

	@RequestMapping("/signup")
	@ResponseBody()
	public String signup() {
		return "this is signup";
	}

	@RequestMapping("/admin")
	@ResponseBody()
	public String admin() {
		return "this is admin module";
	}

	@RequestMapping("/about")
	@ResponseBody()
	public String aboutUs() {
		return "this is About Us page";
	}

	@GetMapping("/home")
	public ModelAndView home() {
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("message", "Welcome to the Spring Web App!");
		return modelAndView;
	}
}
