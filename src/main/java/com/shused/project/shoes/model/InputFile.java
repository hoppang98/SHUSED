package com.shused.project.shoes.model;

import java.util.Date;
import java.util.List;

public class InputFile {
	public int id;
	public int usedShoesId;
	public List<String> imagePath;
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
	public List<String> getImagePath() {
		return imagePath;
	}
	public void setImagePath(List<String> imagePath) {
		this.imagePath = imagePath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
