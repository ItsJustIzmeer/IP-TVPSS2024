package com.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dao.RequestEquipmentDAO;
import com.entity.RequestEquipment;

@RestController
@RequestMapping("/requestEquipment")
public class RequestEquipmentController {

    private RequestEquipmentDAO requestEquipmentDAO;

//     Create a new requestEquipment
    @PostMapping("/")
    public String insert(@RequestBody RequestEquipment requestEquipment) {
//        requestEquipment.setId(0); // Ensure the ID is set to 0 so a new requestEquipment is created
        requestEquipmentDAO.save(requestEquipment); // Use save() instead of insert() method
        return "RequestEquipment created successfully!";
    }
    
//  @PostMapping("/")
//  public String insert(HttpServletRequest request) {
//  	User user = (User) request.getSession().getAttribute("user");
//	
//  	RequestEquipment newEquipment = new RequestEquipment();
//    newEquipment.setItemName(request.getParameter("item_name"));
//    newEquipment.setItemModel(request.getParameter("item_price"));
//    newEquipment.setItemPricePerUnit(Double.parseDouble(request.getParameter("item_price_per_unit")));
//    newEquipment.setQuantity(Integer.parseInt(request.getParameter("quantity")));
//    newEquipment.setTotalEstimatedCost(Double.parseDouble(request.getParameter("total_estimated_cost")));
//    newEquipment.setTotalEstimatedCost(Double.parseDouble(request.getParameter("total_estimated_cost")));
//    
//    if (request.getParameter("quotation_file_data") != null) {
//        newEquipment.setQuotationFileData(null);
//
//    }
//      requestEquipmentDAO.save(requestEquipment); // Use save() instead of insert() method
//      return "RequestEquipment created successfully!";
//  }
   

	// Get all requestEquipments
    @GetMapping("/list")
    public List<RequestEquipment> findAll() {
        return requestEquipmentDAO.findAll();
    }

    // Get a single requestEquipment by ID
    @GetMapping("/{id}")
    public RequestEquipment findById(@PathVariable int id) {
        Optional<RequestEquipment> requestEquipment = requestEquipmentDAO.findById(id);
        if (requestEquipment.isEmpty()) {
            throw new RuntimeException("RequestEquipment ID not found - " + id);
        }
        return requestEquipment.get();
    }

    // Update an existing requestEquipment
    @PutMapping("/")
    public String update(@RequestBody RequestEquipment requestEquipment) {
        Optional<RequestEquipment> existingRequestEquipment = requestEquipmentDAO.findById(requestEquipment.getId());
        if (existingRequestEquipment.isEmpty()) {
            throw new RuntimeException("RequestEquipment ID not found - " + requestEquipment.getId());
        }
        requestEquipmentDAO.save(requestEquipment); // Use save() for updating the requestEquipment
        return "RequestEquipment updated successfully!";
    }

    // Delete a requestEquipment by ID
    @DeleteMapping("/{id}")
    public String deleteById(@PathVariable int id) {
        Optional<RequestEquipment> requestEquipment = requestEquipmentDAO.findById(id);
        if (requestEquipment.isEmpty()) {
            throw new RuntimeException("RequestEquipment ID not found - " + id);
        }
        requestEquipmentDAO.deleteById(id); // Use deleteById() method from JpaRepository
        return "RequestEquipment deleted successfully!";
    }

}
