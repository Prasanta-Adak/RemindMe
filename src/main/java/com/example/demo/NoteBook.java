package com.example.demo;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class NoteBook {
	@Id
    private int id;
    private String noteBook_name;
    private int userId;
public NoteBook() {
	super();
	// TODO Auto-generated constructor stub
}
public NoteBook(int id, String noteBook_name,int userId) {
	super();
	this.id = id;
	this.noteBook_name = noteBook_name;
	this.userId=userId;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getNoteBook_name() {
	return noteBook_name;
}
public void setNoteBook_name(String noteBook_name) {
	this.noteBook_name = noteBook_name;
}
public int getUserId() {
	return userId;
}
public void setUserId(int id) {
	this.userId = id;
}
}
