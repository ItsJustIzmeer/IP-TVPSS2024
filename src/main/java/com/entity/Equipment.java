package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "equipment")
public class Equipment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "equipmentID", nullable = false)
	private int equipmentID;

	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "brand", nullable = false)
	private String brand;

	@Column(name = "amount", nullable = false)
	private int amount;

	public Equipment() {

	}

	public Equipment(int id, int equipmentID, String name, String brand, int amount) {
		super();
		this.id = id;
		this.equipmentID = equipmentID;
		this.name = name;
		this.brand = brand;
		this.amount = amount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEquipmentID() {
		return equipmentID;
	}

	public void setEquipmentID(int equipmentID) {
		this.equipmentID = equipmentID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
}
