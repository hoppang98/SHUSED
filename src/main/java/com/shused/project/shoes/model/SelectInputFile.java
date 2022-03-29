package com.shused.project.shoes.model;

import java.util.Date;

public class SelectInputFile {
	public int id;
	public int usedShoesId;
	public String imagePath;
	public Date createdAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUsedShoesId() {
		return usedShoesId;
	}
	public void setUsedShoesId(int usedShoesId) {
		this.usedShoesId = usedShoesId;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
