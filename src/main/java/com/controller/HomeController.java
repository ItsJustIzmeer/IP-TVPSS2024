package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.entity.Page;
import com.entity.PagePermission;
import com.entity.User;
import com.entity.School;
import com.dao.EventDAO;
import com.dao.PageDAO;
import com.dao.PagePermissionDAO;
import com.dao.UserDAO;
import com.dao.SchoolDAO;
import com.dto.PagePermissionDTO;
import com.dto.UserPagePermissionDTO;
import com.dto.UserWithSchoolDTO;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private PagePermissionDAO pagePermissionDAO;

	@Autowired
	private UserDAO userDAO;

	@Autowired
	private SchoolDAO schoolDAO;

	@Autowired
	private PageDAO pageDAO;

	@GetMapping("/")
	public ModelAndView login() {
		return new ModelAndView("login");
	}

	@GetMapping("/dashboard")
	public ModelAndView dashboard(HttpServletRequest request) {
		String view = "dashboard";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);

		return modelAndView;
	}

	@GetMapping("/userMng")
	public ModelAndView userManagement(HttpServletRequest request) {
		String view = "userMng";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		HttpSession session = request.getSession(false);
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser.getRole().equals("DistrictOfficer")) {
			List<School> schoolList = schoolDAO.findAll();
			model.addAttribute("schoolList", schoolList);
			model.addAttribute("userList", userDAO.findUsersWithSchoolDetails());
		} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
			Integer sId = loggedInUser.getSchoolId();
			if (sId != null) {
				Optional<School> schoolOptional = schoolDAO.findById(sId);
				if (schoolOptional.isPresent()) {
					School school = schoolOptional.get();
					model.addAttribute("loginSchool", school);
					model.addAttribute("userList", userDAO.findUsersWithSchoolDetailsBySchoolId(sId));
				} else {
					model.addAttribute("loginSchool", null); // Handle case where the school is not found
				}
			}
		}
		ModelAndView modelAndView = new ModelAndView(view, model);

		return modelAndView;
	}

	@PostMapping("/userMng/{action}")
	public ModelAndView userManagementAction(@PathVariable String action, HttpServletRequest request,
			RedirectAttributes redirectAttributes, @ModelAttribute("model") ModelMap model) {
		String view = "userMng";
		model = auth(request, model, view);

		// Get input values, with null checks and defaults
		int id = parseIntOrZero(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String status = request.getParameter("status");
		String role = request.getParameter("role");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String district = request.getParameter("district");
		String state = request.getParameter("state");
		int schoolId = parseIntOrZero(request.getParameter("schoolId"));

		Integer sId = 0;
		HttpSession session = request.getSession(false);
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser.getRole().equals("DistrictOfficer")) {
			List<School> schoolList = schoolDAO.findAll();
			model.addAttribute("schoolList", schoolList);
		} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
			sId = loggedInUser.getSchoolId();
			if (sId != null) {
				Optional<School> schoolOptional = schoolDAO.findById(sId);
				if (schoolOptional.isPresent()) {
					School school = schoolOptional.get();
					model.addAttribute("loginSchool", school);
					model.addAttribute("userList", userDAO.findUsersWithSchoolDetailsBySchoolId(sId));
				} else {
					model.addAttribute("loginSchool", null); // Handle case where the school is not found
				}
			}
		}

		switch (action) {
		case "create":
			try {
				// Create a new User entity
				User user = new User();
				user.setName(name);
				user.setEmail(email);
				user.setPassword(password);
				user.setStatus(status);
				user.setRole(role);
				user.setPhoneNumber(phoneNumber);
				user.setAddress(address);
				user.setDistrict(district);
				user.setState(state);
				user.setSchoolId(schoolId);
				userDAO.save(user);

				Optional<School> schoolOpt = schoolDAO.findById(schoolId);
				switch (role) {
				case "DistrictOfficer":
					List<PagePermission> pp = new ArrayList<>();

					pp.add(new PagePermission(0, 1, user.getId(), true, false, false, false));
					pp.add(new PagePermission(0, 3, user.getId(), true, false, true, false));
					pp.add(new PagePermission(0, 6, user.getId(), true, false, true, false));
					pp.add(new PagePermission(0, 13, user.getId(), true, false, true, false));
					pp.add(new PagePermission(0, 5, user.getId(), true, false, true, false));
					pp.add(new PagePermission(0, 14, user.getId(), true, true, true, true));
					pp.add(new PagePermission(0, 4, user.getId(), true, true, true, true));

					pagePermissionDAO.saveAll(pp);
					break;
				case "SchoolAdmin":
					List<PagePermission> pp1 = new ArrayList<>();

					pp1.add(new PagePermission(0, 1, user.getId(), true, false, false, false));
					pp1.add(new PagePermission(0, 2, user.getId(), true, false, true, false));
					pp1.add(new PagePermission(0, 5, user.getId(), true, false, true, false));
					pp1.add(new PagePermission(0, 7, user.getId(), true, false, true, false));
					pp1.add(new PagePermission(0, 8, user.getId(), true, true, true, true));
					pp1.add(new PagePermission(0, 4, user.getId(), true, true, true, true));
					pp1.add(new PagePermission(0, 9, user.getId(), true, false, true, true));
					pp1.add(new PagePermission(0, 11, user.getId(), true, true, false, false));
					pp1.add(new PagePermission(0, 12, user.getId(), true, true, false, false));

					pagePermissionDAO.saveAll(pp1);
					if (schoolOpt.isPresent()) {
						School school = schoolOpt.get();
						school.setTotalTeacher(school.getTotalTeacher() + 1);
						schoolDAO.save(school);
					} else {
						model.addAttribute("error_msg", "Error on updating school info. School not found.");
					}
					break;
				case "Student":
					List<PagePermission> pp11 = new ArrayList<>();

					pp11.add(new PagePermission(0, 1, user.getId(), true, false, false, false));
					pp11.add(new PagePermission(0, 2, user.getId(), true, false, false, false));
					pp11.add(new PagePermission(0, 8, user.getId(), true, false, false, false));

					pagePermissionDAO.saveAll(pp11);
					if (schoolOpt.isPresent()) {
						School school = schoolOpt.get();
						school.setTotalTeacher(school.getTotalTeacher() + 1);
						schoolDAO.save(school);
					} else {
						model.addAttribute("error_msg", "Error on updating school info. School not found.");
					}
					break;
				default:
					model.addAttribute("error_msg", "Error on generating genaral permission. Role not defined.");
					break;
				}
				model.addAttribute("success_msg", "User created successfully!");
			} catch (Exception e) {
				model.addAttribute("error_msg", "Error creating user. Please try again.");
			}
			if (loggedInUser.getRole().equals("DistrictOfficer")) {
				model.addAttribute("userList", userDAO.findUsersWithSchoolDetails());
			} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
				model.addAttribute("userList", userDAO.findUsersWithSchoolDetailsBySchoolId(sId));
			}
			break;
		case "search":
			if (name != null)
				model.addAttribute("name", name);

			if (email != null)
				model.addAttribute("email", email);

			if (status != null)
				model.addAttribute("status", status);

			if (role != null)
				model.addAttribute("role", role);
			if (phoneNumber != null)
				model.addAttribute("phoneNumber", phoneNumber);
			if (address != null)
				model.addAttribute("address", address);
			if (district != null)
				model.addAttribute("district", district);
			if (state != null)
				model.addAttribute("state", state);
			if (schoolId != 0)
				model.addAttribute("school", schoolId);

			List<UserWithSchoolDTO> userList = (List<UserWithSchoolDTO>) model.getAttribute("userList");
			if (!userList.isEmpty()) {
				userList = userList.stream()
						.filter(user -> (name == null || name.isEmpty() || user.getUserName().contains(name)))
						.filter(user -> (email == null || email.isEmpty() || user.getUserEmail().contains(email)))
						.filter(user -> (status == null || status.isEmpty()
								|| user.getUserStatus().equalsIgnoreCase(status)))
						.filter(user -> (role == null || role.isEmpty() || user.getUserRole().equalsIgnoreCase(role)))
						.filter(user -> (phoneNumber == null || phoneNumber.isEmpty()
								|| user.getUserPhoneNumber().equalsIgnoreCase(phoneNumber)
								|| user.getUserPhoneNumber().startsWith(phoneNumber)))
						.filter(user -> (address == null || address.isEmpty()
								|| user.getUserAddress().equalsIgnoreCase(address)
								|| user.getUserAddress().toLowerCase().contains(address.toLowerCase())))
						.filter(user -> (district == null || district.isEmpty()
								|| user.getUserDistrict().equalsIgnoreCase(district)))
						.filter(user -> (state == null || state.isEmpty()
								|| user.getUserState().equalsIgnoreCase(state)))
						.filter(user -> (schoolId == 0 || (user.getSchoolId() == schoolId)))
						.collect(Collectors.toList());
			}
			model.addAttribute("userList", userList);
			break;
		case "update":
			try {
				Optional<User> existingUserOpt = userDAO.findById(id);
				if (existingUserOpt.isPresent()) {
					User existingUser = existingUserOpt.get();
					String updatedPassword = (password == null || password.isEmpty()) ? existingUser.getPassword()
							: password;
					User updatedUser = new User(id, name, email, updatedPassword, status, role, phoneNumber, address,
							district, state, schoolId);
					userDAO.save(updatedUser);
					model.addAttribute("success_msg", "Changes updated into database successfully.");
				} else {
					model.addAttribute("error_msg", "User not found. Update failed.");
				}
			} catch (Exception e) {
				e.printStackTrace(); // Print the stack trace to the console or log it
				model.addAttribute("error_msg",
						"Failed to update user information. Please try again./n" + e.getMessage());
			}

			if (loggedInUser.getRole().equals("DistrictOfficer")) {
				model.addAttribute("userList", userDAO.findUsersWithSchoolDetails());
			} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
				model.addAttribute("userList", userDAO.findUsersWithSchoolDetailsBySchoolId(sId));
			}
			break;
		case "delete":
			if (userDAO.existsById(id)) {
				pagePermissionDAO.deleteAllByUserId(id);

				Optional<School> schoolOpt = schoolDAO.findById(schoolId);
				if (schoolOpt.isPresent()) {
					School school = schoolOpt.get();
					// Update total_students or total_teachers based on the role
					if ("Student".equalsIgnoreCase(role)) {
						school.setTotalStudent(school.getTotalStudent() - 1);
					} else if ("SchoolAdmin".equalsIgnoreCase(role)) {
						school.setTotalTeacher(school.getTotalTeacher() - 1);
					}
					schoolDAO.save(school);
				}
				userDAO.deleteById(id);
				redirectAttributes.addFlashAttribute("success_msg", "User deleted successfully!");
			} else {
				redirectAttributes.addFlashAttribute("error_msg", "User not found!");
			}
			if (loggedInUser.getRole().equals("DistrictOfficer")) {
				model.addAttribute("userList", userDAO.findUsersWithSchoolDetails());
			} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
				model.addAttribute("userList", userDAO.findUsersWithSchoolDetailsBySchoolId(sId));
			}
			break;
		default:
			redirectAttributes.addFlashAttribute("error_msg", "Action not found!");
			break;
		}
		return new ModelAndView(view, model);
	}

	@GetMapping("/userPrm")
	public ModelAndView userPermission(HttpServletRequest request) {
		String view = "userPrm";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		HttpSession session = request.getSession(false);
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser.getRole().equals("DistrictOfficer")) {
			model.addAttribute("userList", userDAO.findUsersWithSchoolDetails());
		} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
			model.addAttribute("userList", userDAO.findUsersWithSchoolDetailsBySchoolId(loggedInUser.getSchoolId()));
		}

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	@Transactional
	@PostMapping("/userPrm/{action}")
	public ModelAndView userPermissionAction(@PathVariable String action, HttpServletRequest request,
			@ModelAttribute("model") ModelMap model) throws IOException {
		String view = "userPrm";
		model = auth(request, model, view);

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		model.addAttribute("success_msg", "");
		model.addAttribute("error_msg", "");

		HttpSession session = request.getSession(false);
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		switch (action) {
		case "search":
			if (name != null)
				model.addAttribute("name", name);
			if (email != null)
				model.addAttribute("email", email);

			if (loggedInUser.getRole().equals("DistrictOfficer")) {
				List<UserWithSchoolDTO> userList = userDAO.findUsersWithSchoolDetails().stream()
						.filter(user -> (name == null || name.isEmpty() || user.getUserName().contains(name)))
						.filter(user -> (email == null || email.isEmpty() || user.getUserEmail().contains(email)))
						.collect(Collectors.toList());

				model.addAttribute("userList", userList);
			} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
				List<UserWithSchoolDTO> userList1 = userDAO
						.findUsersWithSchoolDetailsBySchoolId(loggedInUser.getSchoolId()).stream()
						.filter(user -> (name == null || name.isEmpty() || user.getUserName().contains(name)))
						.filter(user -> (email == null || email.isEmpty() || user.getUserEmail().contains(email)))
						.collect(Collectors.toList());
				model.addAttribute("userList", userList1);
			}
			break;
		case "get":
			try {
				int userId = Integer.parseInt(request.getParameter("id"));

				User user = userDAO.getById(userId);
				List<PagePermissionDTO> pagePermissions = pagePermissionDAO.findAllPagesWithPermissionsByUserId(userId);

				model.addAttribute("name", user.getName());
				model.addAttribute("email", user.getEmail());
				model.addAttribute("userId", userId);

				// Generate HTML table rows
				StringBuilder htmlTable = new StringBuilder();
				for (PagePermissionDTO permission : pagePermissions) {
					htmlTable.append("<tr>").append("<td>").append(permission.getTitle()).append("</td>")
							.append("<td><input type='checkbox' name='read'")
							.append(permission.getReadPermission() != null && permission.getReadPermission()
									? " checked"
									: "")
							.append("></td>").append("<td><input type='checkbox' name='create'")
							.append(permission.getCreatePermission() != null && permission.getCreatePermission()
									? " checked"
									: "")
							.append("></td>").append("<td><input type='checkbox' name='update'")
							.append(permission.getUpdatePermission() != null && permission.getUpdatePermission()
									? " checked"
									: "")
							.append("></td>").append("<td><input type='checkbox' name='delete'")
							.append(permission.getDeletePermission() != null && permission.getDeletePermission()
									? " checked"
									: "")
							.append("></td>").append("</tr>");
				}
				model.addAttribute("tableRows", htmlTable.toString());
				if ("DistrictOfficer".equals(loggedInUser.getRole())) {
					List<UserWithSchoolDTO> userList = userDAO.findUsersWithSchoolDetails();
					model.addAttribute("userList", userList);
				} else if ("SchoolAdmin".equals(loggedInUser.getRole())) {
					List<UserWithSchoolDTO> userList = userDAO
							.findUsersWithSchoolDetailsBySchoolId(loggedInUser.getSchoolId());
					model.addAttribute("userList", userList);
				}

			} catch (NumberFormatException e) {
				model.addAttribute("error_msg", "Invalid user ID.");

			} catch (Exception e) {
				model.addAttribute("error_msg", "An unexpected error occurred: " + e.getMessage());

			}
			break;
		case "update":
			try {
				int uid =Integer.parseInt(request.getParameter("id"));

				pagePermissionDAO.deleteAllByUserId(uid);
				Enumeration<String> parameterNames = request.getParameterNames();
				while (parameterNames.hasMoreElements()) {
					String paramName = parameterNames.nextElement();

					// Check if the parameter name contains '_read', '_create', '_update', or
					// '_delete'
					if (paramName.endsWith("_read")) {
						String pageName = paramName.replace("_read", "");
						Boolean readValue = Boolean.parseBoolean(request.getParameter(paramName));
						Boolean createValue = Boolean.parseBoolean(request.getParameter(pageName + "_create"));
						Boolean updateValue = Boolean.parseBoolean(request.getParameter(pageName + "_update"));
						Boolean deleteValue = Boolean.parseBoolean(request.getParameter(pageName + "_delete"));

						Page pg = pageDAO.findByTitle(pageName);
						pagePermissionDAO.save(new PagePermission(0,pg.getId(),uid,readValue,createValue,updateValue,deleteValue));
					}
				}
				if ("DistrictOfficer".equals(loggedInUser.getRole())) {
					List<UserWithSchoolDTO> userList = userDAO.findUsersWithSchoolDetails();
					model.addAttribute("userList", userList);
				} else if ("SchoolAdmin".equals(loggedInUser.getRole())) {
					List<UserWithSchoolDTO> userList = userDAO
							.findUsersWithSchoolDetailsBySchoolId(loggedInUser.getSchoolId());
					model.addAttribute("userList", userList);
				}
				model.addAttribute("success_msg", "Data updated successfully.");
			} catch (NumberFormatException e) {
				model.addAttribute("error_msg", "Invalid user ID.");

			} catch (Exception e) {
				model.addAttribute("error_msg", "An unexpected error occurred: " + e.getMessage());
			}
			break;
		default:
			if (loggedInUser.getRole().equals("DistrictOfficer")) {
				List<UserWithSchoolDTO> userList = userDAO.findUsersWithSchoolDetails();
				model.addAttribute("userList", userList);
			} else if (loggedInUser.getRole().equals("SchoolAdmin")) {
				List<UserWithSchoolDTO> userList1 = userDAO
						.findUsersWithSchoolDetailsBySchoolId(loggedInUser.getSchoolId());
				model.addAttribute("userList", userList1);
			}
			break;
		}
		return new ModelAndView(view, model);
	}

	@GetMapping("/schoolMng")
	public ModelAndView schoolManagement(HttpServletRequest request) {
		String view = "schooolMng";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);

		return modelAndView;
	}

	@GetMapping("/ManageEquipment")
	public ModelAndView manageEquipment(HttpServletRequest request) {
		String view = "ManageEquipment";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	@GetMapping("/ManageRequestEquipment")
	public ModelAndView manageRequestEquipment(HttpServletRequest request) {
		String view = "ManageRequestEquipment";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	@GetMapping("/RequestEquipment")
	public ModelAndView requestEquipment(HttpServletRequest request) {
		String view = "RequestEquipment";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	@GetMapping("/LevelUpgrade")
	public ModelAndView levelUpgrade(HttpServletRequest request) {
		String view = "LevelUpgrade";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	@GetMapping("/School")
	public ModelAndView school(HttpServletRequest request) {
		String view = "School";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	@GetMapping("/ManageSchool")
	public ModelAndView manageSchool(HttpServletRequest request) {
		String view = "ManageSchool";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

		ModelAndView modelAndView = new ModelAndView(view, model);
		return modelAndView;
	}

	@GetMapping("/SchoolLevel")
	public ModelAndView schoolLevel(HttpServletRequest request) {
		String view = "SchoolLevel";
		ModelMap model = new ModelMap();
		model = auth(request, model, view);

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