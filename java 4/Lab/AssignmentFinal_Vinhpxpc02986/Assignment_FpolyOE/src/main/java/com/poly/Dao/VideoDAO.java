package com.poly.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.Model.Favorite;
import com.poly.Model.Video;
import com.poly.Utils.JpaUtils;

public class VideoDAO {

	private EntityManager em = JpaUtils.getEntityManager();
	public Video create (Video entity) {
	    
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			
			// Insert vào CSDL
			em.persist(entity);

			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Thêm mới thành công!");
		} catch (Exception e) {
			System.out.println(e);
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Thêm mới thất bại!");
		}
		return null;
	}
	
	public void delete (String id) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			Video entity = em.find(Video.class, id);
			em.remove(entity);

			em.getTransaction().commit(); // Chấp nhận kết quả thao tác

			System.out.println("Xóa video thành công");
			
		} catch (Exception e) {
			System.out.println(e);
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Xóa video thất bại");
		}
	}

	public void update(Video Video) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Truy vấn thực thể theo id
			Video entity = em.find(Video.class, Video.getId());
//			System.out.println(entity.getFullname());
			// Thay đổi thông tin thực thể
			entity.setTitle(Video.getTitle());
			entity.setActive(Video.getActive());
			entity.setDescription(Video.getDescription());
			entity.setViews(Video.getViews());
			entity.setPoster(Video.getPoster());
			// Cập nhật thực thể
			em.merge(entity);
			System.out.println("Cập nhật thành công");
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			
		} catch (Exception e) {
			
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Cập nhật thất bại");
		}
	}
	
 	public List<Video> fintAll() {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Tạo Entity

			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT o FROM Video o";
			// Tạo đối tượng truy vấn
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			// Truy vấn
			List<Video> list = query.getResultList();
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
 	
 	public List<Video> fintAllVideoActive() {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Tạo Entity

			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT o FROM Video o where o.active = 1";
			// Tạo đối tượng truy vấn
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			// Truy vấn
			List<Video> list = query.getResultList();
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
 	
	public Video findByID(String id) {
		Video entity = em.find(Video.class, id);
		
//		System.out.println("ID : "+entity.getId());
//		System.out.println("Họ tên : " +entity.getFullname());
//		System.out.println("Mật khẩu : " + entity.getPassword());
		return entity;
	}

	public List<Video> VideoNotFavorite(){
		TypedQuery<Video> query = em.createNamedQuery("Favorite.VideoNotFavorite", Video.class);
		return query.getResultList();
	}
	
	public void upView(Video Video) {
		try {
			
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Truy vấn thực thể theo id
			Video entity = em.find(Video.class, Video.getId());
//			System.out.println(entity.getFullname());
			// Thay đổi thông tin thực thể
			entity.setTitle(Video.getTitle());
			entity.setActive(Video.getActive());
			entity.setDescription(Video.getDescription());
			entity.setViews(entity.getViews() + 1);
			entity.setPoster(Video.getPoster());
			// Cập nhật thực thể
			em.merge(entity);
			System.out.println("tăng view " + entity.getViews());
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			
		} catch (Exception e) {
			
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Cập nhật thất bại");
		}
	}
}
