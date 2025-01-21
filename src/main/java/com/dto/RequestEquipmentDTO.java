package com.dto;

public class RequestEquipmentDTO {
	public int id;
	public int schoolId;
	public int userId;
	public String itemName;
	public String itemModel;
	public double itemPricePerUnit;
	public int quantity;
	public int totalEstimatedCost;
	public byte[] quotationFileData;
	public String ecommerceLink;
	public String reasonForRequest;
	public byte[] supportingDocumentFileData;
	
	public RequestEquipmentDTO(int schoolId, int userId, String itemName, String itemModel, double itemPricePerUnit,
			int quantity, int totalEstimatedCost, byte[] quotationFileData, String ecommerceLink,
			String reasonForRequest, byte[] supportingDocumentFileData) {
		super();
		this.schoolId = schoolId;
		this.userId = userId;
		this.itemName = itemName;
		this.itemModel = itemModel;
		this.itemPricePerUnit = itemPricePerUnit;
		this.quantity = quantity;
		this.totalEstimatedCost = totalEstimatedCost;
		this.quotationFileData = quotationFileData;
		this.ecommerceLink = ecommerceLink;
		this.reasonForRequest = reasonForRequest;
		this.supportingDocumentFileData = supportingDocumentFileData;
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
	public int getTotalEstimatedCost() {
		return totalEstimatedCost;
	}
	public void setTotalEstimatedCost(int totalEstimatedCost) {
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
