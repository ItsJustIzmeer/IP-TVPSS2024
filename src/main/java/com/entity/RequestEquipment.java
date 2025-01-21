package com.entity;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

public class RequestEquipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment primary key
    private int id;

    @Column(name = "school_id", nullable = false) // Maps to "school_id" column
    private int schoolId;

    @Column(name = "user_id", nullable = false) // Maps to "user_id" column
    private int userId;

    @Column(name = "item_name", nullable = false, length = 255) // Sets max length to 255
    private String itemName;

    @Column(name = "item_model", length = 255)
    private String itemModel;

    @Column(name = "item_price_per_unit", nullable = false)
    private double itemPricePerUnit;

    @Column(name = "quantity",nullable = false)
    private int quantity;

    @Column(name = "total_estimated_cost", nullable = false)
    private double totalEstimatedCost;

    @Lob // Indicates a large object (LOB) column
    @Column(name = "quotation_file_data", nullable = true)
    private byte[] quotationFileData;

    @Column(name = "ecommerce_link", length = 500, nullable = true) // Increases max length for a URL
    private String ecommerceLink;

    @Column(name = "reason_for_request", length = 500, nullable = true)
    private String reasonForRequest;

    @Lob // Indicates a large object (LOB) column
    @Column(name = "supporting_document_file_data", nullable = true)
    private byte[] supportingDocumentFileData;
    
    public RequestEquipment() {

	}

	// Getters and Setters (or use Lombok for brevity)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(int schoolId) {
        this.schoolId = schoolId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemModel() {
        return itemModel;
    }

    public void setItemModel(String itemModel) {
        this.itemModel = itemModel;
    }

    public double getItemPricePerUnit() {
        return itemPricePerUnit;
    }

    public void setItemPricePerUnit(double itemPricePerUnit) {
        this.itemPricePerUnit = itemPricePerUnit;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalEstimatedCost() {
        return totalEstimatedCost;
    }

    public void setTotalEstimatedCost(double totalEstimatedCost) {
        this.totalEstimatedCost = totalEstimatedCost;
    }

    public byte[] getQuotationFileData() {
        return quotationFileData;
    }

    public void setQuotationFileData(byte[] quotationFileData) {
        this.quotationFileData = quotationFileData;
    }

    public String getEcommerceLink() {
        return ecommerceLink;
    }

    public void setEcommerceLink(String ecommerceLink) {
        this.ecommerceLink = ecommerceLink;
    }

    public String getReasonForRequest() {
        return reasonForRequest;
    }

    public void setReasonForRequest(String reasonForRequest) {
        this.reasonForRequest = reasonForRequest;
    }

    public byte[] getSupportingDocumentFileData() {
        return supportingDocumentFileData;
    }

    public void setSupportingDocumentFileData(byte[] supportingDocumentFileData) {
        this.supportingDocumentFileData = supportingDocumentFileData;
    }
	
}
