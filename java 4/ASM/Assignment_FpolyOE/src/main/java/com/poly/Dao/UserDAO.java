package com.poly.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.Model.User;
import com.poly.Utils.JpaUtils;



public class UserDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	
	
	public User create (User entity) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC
			// Insert vào CSDL
			em.persist(entity);
//			
			
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Thêm mới thành công!");
			return entity;
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Tên tài khoản hoặc email đã được đăng ký!!!");
			
			em.getTransaction().rollback(); // Hủy thao tác
		}
		return null;
	}
	
	public void delete (String id) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			User entity = em.find(User.class, id);
			em.remove(entity);

			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Xóa user " + entity.getId() + " thành công");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Xóa user thất bại");
		}
	}

	public void update(User user) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Truy vấn thực thể theo id
			User entity = em.find(User.class, user.getId());
//			System.out.println(entity.getFullname());
			// Thay đổi thông tin thực thể
			entity.setFullName(user.getFullName());
			entity.setPassword(user.getPassword());
			entity.setEmail(user.getEmail());
			entity.setRole(false);
			// Cập nhật thực thể
			em.merge(entity);
			System.out.println("Cập nhật thành công");
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			
		} catch (Exception e) {
			System.out.println(e);
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Cập nhật thất bại");
		}
	}
	
 	public List<User> fintAll() {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Tạo Entity

			// Câu lệnh truy vấn JPQL
			String jpql = "SELECT o FROM User o";
			// Tạo đối tượng truy vấn
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			// Truy vấn
			List<User> list = query.getResultList();
			// Hiển thị kết quả truy vấn
			
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
//			System.out.println("Hiển thị thành công!");
			
			return list;
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
		}
		return null;
	}

	public User findByID(String id) {
		User entity = em.find(User.class, id);
		if(entity != null) {
			return entity;
		}
//		System.out.println("ID : "+entity.getId());
//		System.out.println("Họ tên : " +entity.getFullname());
//		System.out.println("Mật khẩu : " + entity.getPassword());
		return null;
	}

	
	public void changePassword(String id,String password) {
		try {
			em.getTransaction().begin(); // Bắt đầu Transaction
			// MÃ THAO TÁC

			// Truy vấn thực thể theo id
			User entity = em.find(User.class, id);
			
			// Thay đổi thông tin thực thể
			entity.setId(entity.getId());
			entity.setFullName(entity.getFullName());
			entity.setEmail(entity.getEmail());
			entity.setRole(entity.getRole());
			entity.setPassword(password);
			// Cập nhật thực thể
			em.merge(entity);
			
			em.getTransaction().commit(); // Chấp nhận kết quả thao tác
			System.out.println("Đổi mật khẩu thành công");
		} catch (Exception e) {
			em.getTransaction().rollback(); // Hủy thao tác
			System.out.println("Đổi mật khẩu thất bại quên mật khẩu");
		}
	}
	
	
}
