package com.poly.Model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Report {
	@Id
	String id;
	String title;
	Long likes;
	Date newest;
	Date oldest;

	public Report() {
		super();
	}

	public Report(String id, String title, Long likes, Date newest, Date oldest) {
		super();
		this.id = id;
		this.title = title;
		this.likes = likes;
		this.newest = newest;
		this.oldest = oldest;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getLikes() {
		return likes;
	}

	public void setLikes(Long likes) {
		this.likes = likes;
	}

	public Date getNewest() {
		return newest;
	}

	public void setNewest(Date newest) {
		this.newest = newest;
	}

	public Date getOldest() {
		return oldest;
	}

	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}
}
