package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.Dao.FavoriteDAO;
import com.poly.Dao.ReportDAO;
import com.poly.Dao.UserDAO;
import com.poly.Dao.VideoDAO;
import com.poly.Model.Favorite;
import com.poly.Model.User;
import com.poly.Model.Video;
import com.poly.Model.Report;
import com.poly.Model.Share;

/**
 * Servlet implementation class admin
 */
@MultipartConfig
@WebServlet({ "/admin", "/admin/logout", "/admin/createVideo", "/admin/deleteVideo/*", "/admin/editVideo/*",
		"/admin/createUser", "/admin/deleteUser/*", "/admin/editUser/*", "/admin/Report", "/admin/Report/search" })
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Date date = new Date();
	User user = new User();
	Video video = new Video();
	Favorite favorite = new Favorite();
	ReportDAO reportDAO = new ReportDAO();
	VideoDAO videoDAO = new VideoDAO();
	UserDAO userDAO = new UserDAO();
	FavoriteDAO favoriteDAO = new FavoriteDAO();

	public admin() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		List<Video> listVideo = videoDAO.fintAll();
		request.setAttribute("listVideo", listVideo);
		
		fillReport(request, response);
		
		if (uri.contains("createVideo")) {
			doCreateVideo(request, response);
		} else if (uri.contains("deleteVideo")) {
			System.out.println("Delete video");
			doDeleteVideo(request, response);
		} else if (uri.contains("editVideo")) {
			doEditVideo(request, response);
		} else if (uri.contains("createUser")) {
			doCreateUser(request, response);
		} else if (uri.contains("deleteUser")) {
			doDeleteUser(request, response);
		} else if (uri.contains("editUser")) {
			doEditUser(request, response);
		} else if (uri.contains("Report")) {
			doReport(request, response);
		} else if (uri.contains("logout")) {
			request.getSession().removeAttribute("sessionUser");
			request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
		} else {
			System.out.println("admin");
			doAdmin(request, response);
		}
		
	}

	protected void doAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		fillReport(request, response);
		
		request.setAttribute("views", "/admin/container/videoManager.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	protected void doCreateVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getMethod();

		Video video = new Video();

		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(video, request.getParameterMap());

				File photoFile = null;
				// đường dẫn thư mục tính từ gốc của website
				File dir = new File(request.getServletContext().getRealPath("/upload"));
				if (!dir.exists()) { // tạo nếu chưa tồn tại
					dir.mkdirs();
				}
				// lưu các file upload vào thư mục files
				try {
					Part photo = request.getPart("poster"); // file hình
					photoFile = new File(dir, photo.getSubmittedFileName());
					photo.write(photoFile.getAbsolutePath());

					video.setPoster(photoFile.getName());
				} catch (Exception e) {
					// TODO: handle exception
					request.setAttribute("img", "File chưa được upload");
				}

				videoDAO.create(video);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<Video> listVideo = videoDAO.fintAll();
		fillReport(request, response);
		request.setAttribute("listVideo", listVideo);
		request.setAttribute("views", "/admin/container/videoManager.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	protected void doEditVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getMethod();
		Video video = new Video();
		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(video, request.getParameterMap());

				File photoFile = null;
				// đường dẫn thư mục tính từ gốc của website
				File dir = new File(request.getServletContext().getRealPath("/upload"));
				if (!dir.exists()) { // tạo nếu chưa tồn tại
					dir.mkdirs();
				}
				// lưu các file upload vào thư mục files
				try {
					Part photo = request.getPart("poster"); // file hình
					photoFile = new File(dir, photo.getSubmittedFileName());
					photo.write(photoFile.getAbsolutePath());

					video.setPoster(photoFile.getName());
				} catch (Exception e) {
					// TODO: handle exception
					request.setAttribute("img", "File chưa được upload");
				}
				videoDAO.update(video);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		List<Video> listVideo = videoDAO.fintAll();
		request.setAttribute("listVideo", listVideo);
		fillReport(request, response);
		request.setAttribute("views", "/admin/container/videoManager.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	protected void doDeleteVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String idvideo = uri.substring(uri.lastIndexOf("/") + 1);
		System.out.println("ID video " + idvideo);

		videoDAO.delete(idvideo);

		List<Video> listVideo = videoDAO.fintAll();
		request.setAttribute("listVideo", listVideo);
		fillReport(request, response);
		request.setAttribute("views", "/admin/container/videoManager.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	protected void doCreateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getMethod();
		User user = new User();

		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());

				userDAO.create(user);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		List<User> listUser = userDAO.fintAll();
		request.setAttribute("listUser", listUser);
		fillReport(request, response);
		request.setAttribute("views", "/admin/container/userManager.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	protected void doDeleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String idUser = uri.substring(uri.lastIndexOf("/") + 1);

		userDAO.delete(idUser);

		List<User> listUser = userDAO.fintAll();
		request.setAttribute("listUser", listUser);
		fillReport(request, response);
		request.setAttribute("views", "/admin/container/userManager.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	protected void doEditUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getMethod();
		System.out.println("user edit " + method);
		User user = new User();
		if (method.equalsIgnoreCase("POST")) {

			try {
				BeanUtils.populate(user, request.getParameterMap());

				userDAO.update(user);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		List<User> listUser = userDAO.fintAll();
		request.setAttribute("listUser", listUser);
		fillReport(request, response);
		request.setAttribute("views", "/admin/container/userManager.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}

	protected void doReport(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			String titleVideo = request.getParameter("titleVideo");
			String titleVideoShare = request.getParameter("titleVideoShare");
			if (titleVideo != null) {
				List<Favorite> listVideoLike = reportDAO.listVideoFavoriteByVideoTitle(titleVideo);
				request.setAttribute("listUserLikeVideo", listVideoLike);
				titleVideo = null;
			} else if(titleVideoShare != null){
				List<Share> listShare = reportDAO.listShareVideoByTitleVideo(titleVideoShare);
				request.setAttribute("listShareByTitleVideo", listShare);
				titleVideoShare = null;
			}
		}

		List<Report> list = reportDAO.listVideoFavorite();
		request.setAttribute("listReport", list);

		request.setAttribute("views", "/admin/container/Report.jsp");
		request.getRequestDispatcher("/admin/layout.jsp").forward(request, response);
	}
	
	private void fillReport (HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("totalVideoLike", reportDAO.countLike()); 
		request.setAttribute("totalAccount", reportDAO.countUser()); 
		request.setAttribute("totalShare", reportDAO.countShare()); 
		request.setAttribute("totalVideoActive", reportDAO.countVideoActive());
	}
	
	
}
