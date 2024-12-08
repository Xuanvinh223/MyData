package com.poly.Dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.Model.Share;
import com.poly.Model.User;
import com.poly.Model.Video;
import com.poly.Utils.JpaUtils;

public class shareDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	public Share create (String emailShare, User user, Video video, Date dateShare) {
	    
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			Share entity = new Share();
			entity.setEmails(emailShare);
			entity.setUser(user);
			entity.setVideo(video);
			entity.setShareDate(dateShare);
			// Insert vào CSDL
			em.persist(entity);

			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Share thành công!");
			return entity;
		} catch (Exception e) {
			System.out.println(e);
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Share thất bại!");
		}
		return null;
	}
	
	public void delete (String id) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			Share entity = em.find(Share.class, id);
			em.remove(entity);

			em.getTransaction().commit(); // Chấp nhận kết quả thao tác

			System.out.println("Xóa Share thành công");
			
		} catch (Exception e) {
			System.out.println(e);
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Xóa Share thất bại");
		}
	}

	
 	public List<Share> fintAll() {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Tạo Entity

			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT o FROM Share o";
			// Tạo đối tượng truy vấn
			TypedQuery<Share> query = em.createQuery(jpql, Share.class);
			// Truy vấn
			List<Share> list = query.getResultList();
			// Hiển thị kết quả truy vấn
			
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
//			System.out.println("Hiển thị thành công!");
			
			return list;
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Hiển thị danh sách thất bại!");
		}
		return null;
	}

	public Share findByID(String id) {
		Share entity = em.find(Share.class, id);
		
//		System.out.println("ID : "+entity.getId());
//		System.out.println("Họ tên : " +entity.getFullname());
//		System.out.println("Mật khẩu : " + entity.getPassword());
		return entity;
	}

	public List<Share> ShareNotFavorite(){
		TypedQuery<Share> query = em.createNamedQuery("Favorite.ShareNotFavorite", Share.class);
		return query.getResultList();
	}
}
