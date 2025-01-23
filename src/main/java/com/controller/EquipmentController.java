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

import com.dao.EquipmentDAO;
import com.dao.PagePermissionDAO;
import com.dto.UserPagePermissionDTO;
import com.entity.Equipment;
import com.entity.User;

@Controller
public class EquipmentController {
	@Autowired
	private EquipmentDAO equipmentDAO;
	@Autowired
	private PagePermissionDAO pagePermissionDAO;

	@GetMapping("Equipment")
	public ModelAndView equipment(HttpServletRequest request) {
		String view = "Equipment";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);
		model.addAttribute("error_msg", "");
		model.addAttribute("success_msg", "");

		List<Equipment> equipments = equipmentDAO.findAll();
		model.addAttribute("equipments", equipments);
		return new ModelAndView(view, model);
	}
	
	@GetMapping("/createEquipment")
	public ModelAndView createEquipment(HttpServletRequest request) {
		String view = "createEquipment";
		ModelMap model = new ModelMap();
		model = auth(request, model, "Equipment");
		model.addAttribute("error_msg", "");
		model.addAttribute("success_msg", "");

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}
	
	@PostMapping("/saveEquipment")
	public ModelAndView createEquipmentSubmit(HttpServletRequest request, RedirectAttributes redirectAttributes,
			@ModelAttribute("model") ModelMap model) {
		String view = "createEquipment";
		model = auth(request, model, "Equipment");

		model.addAttribute("error_msg", "");
		model.addAttribute("success_msg", "");
		try {
			Equipment equipment = new Equipment();
			equipment.setId(0);
			equipment.setEquipmentID(Integer.parseInt(request.getParameter("equipmentID")));
			equipment.setName(request.getParameter("equipmentName"));
			equipment.setBrand(request.getParameter("equipmentBrand"));
			equipment.setAmount(Integer.parseInt(request.getParameter("equipmentAmount")));
			
			equipmentDAO.save(equipment);
			model.addAttribute("success_msg", "Equipment has been successfully created.");
			List<Equipment> equipments = equipmentDAO.findAll();
			model.addAttribute("equipments", equipments);
			view = "Equipment";

		} catch (Exception e) {
			e.printStackTrace(); // Add this for debugging
			model.addAttribute("error_msg", "Error occurred while creating a new equipment: " + e.getMessage());
		}
		return new ModelAndView(view, model);
	}

	// Show the equipment details for editing
	@GetMapping("/detailEquipment/{id}/{action}")
	public ModelAndView equipmentDetails(@PathVariable int id, @PathVariable String action, ModelMap model,
			HttpServletRequest request) {
		String view = "/detailEquipment";
		model = auth(request, model, "Equipment");
		model.addAttribute("error_msg", "");
		model.addAttribute("success_msg", "");

		boolean isEdit = "edit".equalsIgnoreCase(action);
		model.addAttribute("action", isEdit);

		Optional<Equipment> optionalEquipment = equipmentDAO.findById(id);
		if (optionalEquipment.isPresent()) {
			Equipment equipment = optionalEquipment.get();
			model.addAttribute("equipment", equipment);
		} else {
			model.addAttribute("error_msg", "Equipment with ID " + id + " not found.");
	        return new ModelAndView("Equipment", model);
		}
		
		return new ModelAndView(view, model);
	}

	// Handle equipment update
	@PostMapping("/editEquipment")
	public ModelAndView editEquipment(ModelMap model, HttpServletRequest request) {
		String view = "Equipment";
		model = auth(request, model, "Equipment");
		model.addAttribute("error_msg", "");
		model.addAttribute("success_msg", "");

		Equipment equipment1 = new Equipment();
		equipment1.setId(Integer.parseInt(request.getParameter("id")));
		equipment1.setEquipmentID(Integer.parseInt(request.getParameter("equipmentID")));
		equipment1.setName(request.getParameter("equipmentName"));
		equipment1.setBrand(request.getParameter("equipmentBrand"));
		equipment1.setAmount(Integer.parseInt(request.getParameter("equipmentAmount")));

		equipmentDAO.save(equipment1);

		model.addAttribute("success_msg", "Equipment updated successfully.");
		model.addAttribute("equipments", equipmentDAO.findAll());
		return new ModelAndView(view, model);
	}

	/// Handle equipment deletion
	@PostMapping("/deleteEquipment")
	public ModelAndView deleteEquipment(@RequestParam int id, HttpServletRequest request, ModelMap model) {
		String view = "Equipment";
		model = auth(request, model, "Equipment");
		model.addAttribute("error_msg", "");
		model.addAttribute("success_msg", "");
		equipmentDAO.deleteById(id);

		model.addAttribute("message", "Equipment deleted successfully.");
		model.addAttribute("equipments", equipmentDAO.findAll());

		return new ModelAndView(view, model);
	}
	
	//azaf ni part kau -izmeer
	@PostMapping("submitEquipmentApplication")
	public ModelAndView submitEquipmentApplication(@RequestParam String studentId, @RequestParam String studentName,
			@RequestParam int equipmentID, @RequestParam String role, ModelMap model, HttpServletRequest request) {
		String view = "Equipment";
		model = auth(request, model, "Equipment");
		
		model.addAttribute("message", "Your equipment application has been submitted!");
		model.addAttribute("equipments", equipmentDAO.findAll());

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
}
