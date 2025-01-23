package com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.EventDAO;
import com.dao.PagePermissionDAO;
import com.dto.UserPagePermissionDTO;
import com.entity.Event;
import com.entity.User;

@Controller
public class EventController {
	@Autowired
    private EventDAO eventDAO;
	@Autowired
	private PagePermissionDAO pagePermissionDAO;
	
	@GetMapping("/Event")
	public ModelAndView event(HttpServletRequest request) {
		String view = "Event";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);
		model.addAttribute("error_msg","");
		model.addAttribute("success_msg","");

		List<Event> events = eventDAO.findAll();
		model.addAttribute("events",events);
		return new ModelAndView(view,model);
	}
	
	@GetMapping("/createEvent")
	public ModelAndView createEvent(HttpServletRequest request) {
		String view = "createEvent";
		ModelMap model = new ModelMap();
		model = auth(request, model, "Event");
		model.addAttribute("error_msg","");
		model.addAttribute("success_msg","");
		
		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}
	
	@PostMapping("/saveEvent")
	public ModelAndView createEventSubmit(HttpServletRequest request,
			RedirectAttributes redirectAttributes, @ModelAttribute("model") ModelMap model) {
		String view = "createEvent";
		model = auth(request, model, "Event");
		
		model.addAttribute("error_msg","");
		model.addAttribute("success_msg","");
		try {
			Event event = new Event();
			event.setId(0);
			event.setName(request.getParameter("name"));
			String startDateStr = request.getParameter("startDate");
			String endDateStr = request.getParameter("endDate");
			
			event.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr));
			event.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr));
			event.setTime(request.getParameter("time"));
			event.setOrganizer(request.getParameter("organizer"));
			event.setSpeaker(request.getParameter("speaker"));
			event.setEmail(request.getParameter("email"));
			event.setPhoneNumber(request.getParameter("phoneNumber"));
			String participantTypeParam = request.getParameter("participantType");
			if (participantTypeParam != null) {
			    try {
			        event.setParticipantType(Event.ParticipantType.valueOf(participantTypeParam.toLowerCase()));
			    } catch (IllegalArgumentException e) {
			        throw new RuntimeException("Invalid participant type: " + participantTypeParam, e);
			    }
			}
			event.setParticipantLimit(parseIntOrZero(request.getParameter("participantLimit")));
			String eventType = request.getParameter("eventType");
			if (eventType != null) {
			    try {
			        event.setEventType(Event.EventType.valueOf(eventType.toLowerCase()));
			    } catch (IllegalArgumentException e) {
			        throw new RuntimeException("Invalid participant type: " + eventType, e);
			    }
			}
			event.setEventLocation(request.getParameter("eventLocation"));
			event.setEventPlatform(request.getParameter("eventPlatform"));
			event.setDescription(request.getParameter("description"));
			
		    eventDAO.save(event);
		    model.addAttribute("success_msg", "Event has been successfully created.");
		    List<Event> events = eventDAO.findAll();
		    model.addAttribute("events", events);
		    view = "Event";
		} catch (Exception e) {
		    e.printStackTrace(); // Add this for debugging
		    model.addAttribute("error_msg", "Error occurred while creating a new event: " + e.getMessage());
		}
		return new ModelAndView(view,model);
	}
	
	@GetMapping("/detailEvent/{id}/{action}")
	public ModelAndView eventDetails(@PathVariable int id, @PathVariable String action, ModelMap model, HttpServletRequest request) {
	    String view = "/detailEvent";
	    model = auth(request, model, "Event");
	    model.addAttribute("error_msg", "");
	    model.addAttribute("success_msg", "");

	    boolean isEdit = "edit".equalsIgnoreCase(action);
	    model.addAttribute("action", isEdit);

	    // Fetch the event using findById
	    Optional<Event> optionalEvent = eventDAO.findById(id);
	    if (optionalEvent.isPresent()) {
	    	Event event = optionalEvent.get();
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        model.addAttribute("startDate", dateFormat.format(event.getStartDate()));
	        model.addAttribute("endDate", dateFormat.format(event.getEndDate()));
	        model.addAttribute("event", event);
	    } else {
	        model.addAttribute("error_msg", "Event with ID " + id + " not found.");
	        return new ModelAndView("Event", model);
	    }

	    return new ModelAndView(view, model);
	}

	 @PostMapping("/editEvent")
	    public ModelAndView editEvent(ModelMap model, HttpServletRequest request) throws ParseException {
	        String view = "Event";
		    model = auth(request, model, "Event");
	        model.addAttribute("error_msg", "");
		    model.addAttribute("success_msg", "");
		    
		    Event event1 = new Event();
			event1.setId(Integer.parseInt(request.getParameter("id")));
			event1.setName(request.getParameter("name"));
			String startDateStr = request.getParameter("startDate");
			String endDateStr = request.getParameter("endDate");
			event1.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr));
			event1.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr));
			event1.setTime(request.getParameter("time"));
			event1.setOrganizer(request.getParameter("organizer"));
			event1.setSpeaker(request.getParameter("speaker"));
			event1.setEmail(request.getParameter("email"));
			event1.setPhoneNumber(request.getParameter("phoneNumber"));
			String participantTypeParam = request.getParameter("participants");
			if (participantTypeParam != null) {
			    try {
			        event1.setParticipantType(Event.ParticipantType.valueOf(participantTypeParam.toLowerCase()));
			    } catch (IllegalArgumentException e) {
			        throw new RuntimeException("Invalid participant type: " + participantTypeParam, e);
			    }
			}
			event1.setParticipantLimit(parseIntOrZero(request.getParameter("participantLimit")));
			String eventType = request.getParameter("eventType");
			if (eventType != null) {
			    try {
			        event1.setEventType(Event.EventType.valueOf(eventType.toLowerCase()));
			    } catch (IllegalArgumentException e) {
			        throw new RuntimeException("Invalid participant type: " + eventType, e);
			    }
			}
			event1.setEventLocation(request.getParameter("eventLocation"));
			event1.setEventPlatform(request.getParameter("eventPlatform"));
			event1.setDescription(request.getParameter("description"));
			
		    eventDAO.save(event1);

	        model.addAttribute("success_msg", "Event updated successfully.");
	        model.addAttribute("events", eventDAO.findAll());
	        return new ModelAndView(view, model);
	    }
	 
	  @PostMapping("/deleteEvent")
	    public ModelAndView deleteEvent(@RequestParam int id, HttpServletRequest request, ModelMap model) {
	        String view = "Event";
		    model = auth(request, model, "Event");
	        model.addAttribute("error_msg", "");
		    model.addAttribute("success_msg", "");
	        eventDAO.deleteById(id);

	        model.addAttribute("message", "Event deleted successfully.");
	        model.addAttribute("events", eventDAO.findAll());

	        return new ModelAndView(view, model);
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
