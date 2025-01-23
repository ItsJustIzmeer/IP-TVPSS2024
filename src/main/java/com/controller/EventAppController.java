package com.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.UserPagePermissionDTO;
import com.entity.Event;
import com.entity.User;
import com.entity.EventApp;
import com.dao.EventAppDAO;
import com.dao.EventDAO;
import com.dao.PagePermissionDAO;

@Controller
public class EventAppController {

	@Autowired
	private EventAppDAO eventAppDAO;
	
	@Autowired 
	private EventDAO eventDAO;
	
	@Autowired
	private PagePermissionDAO pagePermissionDAO;

	@GetMapping("/EventApplication/{eventId}")
	public ModelAndView submitEventApplication(@PathVariable int eventId, ModelMap model, HttpServletRequest request) {
		String view = "EventApplication";
		model = auth(request, model, view);
		try {
		HttpSession session = request.getSession(false);
		User loginUser = (User) session.getAttribute("loggedInUser");
		 model.addAttribute("user", loginUser);
		
		Optional<Event> optionalEvent = eventDAO.findById(eventId);
		if (optionalEvent.isPresent()) {
	    	Event event = optionalEvent.get();
	        model.addAttribute("event", event);
	    } else {
	        model.addAttribute("error_msg", "Event with ID " + eventId + " not found.");
	        return new ModelAndView("Event", model);
	    }
		
		model.addAttribute("success_msg", "");
		}catch(Exception e) {
			model.addAttribute("error_msg", "There is an error loading your Event Applciation: "+e.getMessage());
		}
		return new ModelAndView(view, model);
	}
	
	// Submit event application
	@PostMapping("/submitEventApplication")
	public ModelAndView submitEventApplication(@RequestParam String studentId, @RequestParam String studentName,
			@RequestParam int eventId, @RequestParam String eventName,@RequestParam String role, ModelMap model, HttpServletRequest request) {
		String view = "EventApplication";
		model = auth(request, model, "Event");

		try {
		EventApp eventApp = new EventApp(0,eventId,eventName,role,studentId,studentName,"pending");
		eventAppDAO.save(eventApp);
		model.addAttribute("success_msg", "Your event application has been submitted!");
		model.addAttribute("applicationList",eventAppDAO.findAll());
		}catch(Exception e) {
			model.addAttribute("error_msg", "There is an error submitting your Event Applciation: "+e.getMessage());
		}
		
		model.addAttribute("applicationList", eventDAO.findAll());
		return new ModelAndView("Event", model);
	}
	

	@PostMapping("/approveEventApplication")
	public ModelAndView approveEventApplication(@RequestParam String applicationId,  ModelMap model, HttpServletRequest request) {
	    String view = "ManageEventApp";
	    model = auth(request, model, view);
	    model.addAttribute("error_msg", "");
	    model.addAttribute("success_msg", "");

	    Optional<EventApp> optionalEvent = eventAppDAO.findById(Integer.parseInt(applicationId));
	    if (optionalEvent.isPresent()) {
	    	EventApp eventApp = optionalEvent.get();
	    	eventApp.setStatus("approved");
	    	eventAppDAO.save(eventApp);
	    	model.addAttribute("applicationList",eventAppDAO.findAll());
	    } else {
	        model.addAttribute("error_msg", "Event Application with ID " + applicationId + " not found.");
	        return new ModelAndView("Event", model);
	    }
	    model.addAttribute("applicationList",eventAppDAO.findAll());
	    return new ModelAndView(view, model);
	}
	
	@PostMapping("/rejectEventApplication")
	public ModelAndView rejectEventApplication(@RequestParam String applicationId,  ModelMap model, HttpServletRequest request) {
	    String view = "ManageEventApp";
	    model = auth(request, model, view);
	    model.addAttribute("error_msg", "");
	    model.addAttribute("success_msg", "");

	    Optional<EventApp> optionalEvent = eventAppDAO.findById(Integer.parseInt(applicationId));
	    if (optionalEvent.isPresent()) {
	    	EventApp eventApp = optionalEvent.get();
	    	eventApp.setStatus("rejected");
	    	eventAppDAO.save(eventApp);
	    	model.addAttribute("applicationList",eventAppDAO.findAll());
	    } else {
	        model.addAttribute("error_msg", "Event Application with ID " + applicationId + " not found.");
	        return new ModelAndView("Event", model);
	    }
	    return new ModelAndView(view, model);
	}
	
	@GetMapping("/ManageEventApp")
	public ModelAndView manageEventApp(HttpServletRequest request) {
		String view = "ManageEventApp";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		model.addAttribute("applicationList",eventAppDAO.findAll());
		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	private ModelMap auth(HttpServletRequest request, ModelMap model, String view) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return new ModelMap().addAttribute("redirect", "/login");
		}
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser == null) {
			return new ModelMap().addAttribute("redirect", "/");
		}

		// navbar and sidemenu
		List<UserPagePermissionDTO> userPermissions = pagePermissionDAO
				.findPermissionsWithPageDetailsByUserId(loggedInUser.getId());
		model.addAttribute("userPermissions", userPermissions);
		model.addAttribute("loginUser", loggedInUser);

		// page access
		List<Object[]> access = pagePermissionDAO.findPermissionsByUserIdAndPageFilename(loggedInUser.getId(), view);
		if (!access.isEmpty()) {
			for (Object[] permissionSet : access) {
				model.addAttribute("read", (boolean) permissionSet[0]);
				model.addAttribute("create", (boolean) permissionSet[1]);
				model.addAttribute("update", (boolean) permissionSet[2]);
				model.addAttribute("delete", (boolean) permissionSet[3]);
			}
		}
		return model;
	}

	private int parseIntOrZero(String value) {
		try {
			return value != null ? Integer.parseInt(value) : 0;
		} catch (NumberFormatException e) {
			return 0;
		}
	}
}
