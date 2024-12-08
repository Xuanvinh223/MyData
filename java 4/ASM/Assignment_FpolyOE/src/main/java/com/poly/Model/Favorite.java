package com.poly.Model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the Favorites database table.
 * 
 */
@Entity
@Table(name="Favorites",uniqueConstraints = { @UniqueConstraint(columnNames = { "VideoId", "UserId" }) })
@NamedQueries({
	@NamedQuery(name="Favorite.findAll", query="SELECT f FROM Favorite f"),
	@NamedQuery(name = "Favorite.countLikeWhereIdVideo", query = "SELECT COUNT(f) FROM Favorite f WHERE f.user.id = :userId"),
	@NamedQuery(name = "Favorite.findAllVideobyUserid", query = "SELECT f FROM Favorite f WHERE f.user.id = :userID"),
	
})																

public class Favorite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
	private int id;

	@Column(name="LikeDate")
	private Date likeDate;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="UserID")
	private User user;

	//bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name="VideoID")
	private Video video;

	public Favorite() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getLikeDate() {
		return this.likeDate;
	}

	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

}