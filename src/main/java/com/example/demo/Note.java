package com.example.demo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Note {

	@Id
	private int noteid;
	private String name;
	private String startDate;
	private String endDate;
	private String reDate;
	private String status;
	private String tag;
	private String description;
	private int notebookId;
	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Note(int noteid, String name, String startDate, String endDate, String reDate, String status, String tag,
			String description, int notebookId) {
		super();
		this.noteid = noteid;
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.reDate = reDate;
		this.status = status;
		this.tag = tag;
		this.description = description;
		this.notebookId = notebookId;
	}
	public int getNoteid() {
		return noteid;
	}
	public void setNoteid(int noteid) {
		this.noteid = noteid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getReDate() {
		return reDate;
	}
	public void setReDate(String reDate) {
		this.reDate = reDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getNotebookId() {
		return notebookId;
	}
	public void setNotebookId(int notebookId) {
		this.notebookId = notebookId;
	}
	
}
