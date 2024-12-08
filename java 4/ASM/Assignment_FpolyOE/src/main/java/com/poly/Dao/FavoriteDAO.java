package com.poly.Dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.Model.Favorite;
import com.poly.Model.User;
import com.poly.Model.Video;
import com.poly.Utils.JpaUtils;

public class FavoriteDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	
	Date date = new Date();
	public Favorite create (User user, Video video, Date date) {
	    
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			
			Favorite entity = new Favorite();
			entity.setUser(user);
			entity.setVideo(video);
			entity.setLikeDate(date);
			// Insert vào CSDL
			em.persist(entity);

			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Like video thành công!");
		} catch (Exception e) {
			System.out.println(e);
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Like video thất bại!");
		}
		return null;
	}
	
	public void delete (int id) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			
			Favorite entity = em.find(Favorite.class, id);
			em.remove(entity);
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Đã bỏ thích thành công");
		} catch (Exception e) {
			System.out.println(e);
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Bỏ thích thất bại");
		}
	}

	public void update(Favorite Favorite) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Truy vấn thực thể theo id
			Favorite entity = em.find(Favorite.class, Favorite.getId());
//			System.out.println(entity.getFullname());
			// Thay đổi thông tin thực thể
			
			// Cập nhật thực thể
			em.merge(entity);
			System.out.println("Cập nhật thành công");
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Cập nhật thất bại");
		}
	}
	
 	public List<Favorite> fintAll() {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Tạo Entity

			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT o FROM Favorite o";
			// Tạo đối tượng truy vấn
			TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
			// Truy vấn
			List<Favorite> list = query.getResultList();
			// Hiển thị kết quả truy vấn
			
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
//			System.out.println("Hiển thị thành công!");
			
			return list;
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Thêm mới thất bại!");
		}
		return null;
	}

	public Favorite findByID(String id) {
		Favorite entity = em.find(Favorite.class, id);
		
//		System.out.println("ID : "+entity.getId());
//		System.out.println("Họ tên : " +entity.getFullname());
//		System.out.println("Mật khẩu : " + entity.getPassword());
		return entity;
	}
	
	public long countLike(String userID) {
		TypedQuery<Long> query = em.createNamedQuery("Favorite.countLikeWhereIdVideo", Long.class);
		query.setParameter("userId", userID);
		Long count = query.getSingleResult();
//		System.out.println(count);
		return count;
	}
	
	public List<Favorite> findAllVideobyUserid(String userID){
		TypedQuery<Favorite> query = em.createNamedQuery("Favorite.findAllVideobyUserid", Favorite.class);
		query.setParameter("userID", userID);
		
		return query.getResultList();
		
	}
	
	
}
