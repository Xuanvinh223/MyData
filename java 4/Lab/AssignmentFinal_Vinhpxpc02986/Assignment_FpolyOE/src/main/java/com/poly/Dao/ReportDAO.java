package com.poly.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.Model.Favorite;
import com.poly.Model.Report;
import com.poly.Model.Share;
import com.poly.Model.User;
import com.poly.Utils.JpaUtils;

public class ReportDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	
	public List<Report> listVideoFavorite() {
		String jpql = "SELECT new Report(f.video.id, f.video.title, count(f), max(f.likeDate), min(f.likeDate)) FROM Favorite f GROUP BY f.video.id, f.video.title";
		TypedQuery<Report> query = em.createQuery(jpql, Report.class);
	 	 List<Report> list = query.getResultList();
	 	 return list;
	}
	
	public List<Favorite> listVideoFavoriteByVideoTitle(String titleVideo) {
		String jpql = "SELECT f FROM Favorite f INNER JOIN Video v ON v.id = f.video INNER JOIN User u ON u.id = f.user WHERE v.title LIKE :titleVideo";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("titleVideo","%" + titleVideo + "%");
	 	 List<Favorite> list = query.getResultList();
	 	 return list;
	}
	
	
	public List<Share> listShareVideoByTitleVideo(String title) {
		String jpql = "SELECT s FROM Share s WHERE s.video.title LIKE :titleVideo";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		query.setParameter("titleVideo","%" + title + "%");
	 	 List<Share> list = query.getResultList();
	 	 return list;
	}
	
	public long countLike() {
		String jpql = "SELECT COUNT(f) FROM Favorite f";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		Long count = query.getSingleResult();
		return count;
	}
	
	public long countUser() {
		String jpql = "SELECT COUNT(u) FROM User u";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		Long count = query.getSingleResult();
		return count;
	}
	
	public long countShare() {
		String jpql = "SELECT COUNT(s) FROM Share s";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		Long count = query.getSingleResult();
		return count;
	}
	
	public long countVideoActive() {
		String jpql = "SELECT COUNT(v) FROM Video v where v.active = 1";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		Long count = query.getSingleResult();
		return count;
	}
}
