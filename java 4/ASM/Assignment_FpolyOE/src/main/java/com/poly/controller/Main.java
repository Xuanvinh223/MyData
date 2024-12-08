package com.poly.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.Dao.FavoriteDAO;
import com.poly.Dao.UserDAO;
import com.poly.Dao.VideoDAO;
import com.poly.Dao.shareDAO;
import com.poly.Model.Favorite;
import com.poly.Model.Share;
import com.poly.Model.User;
import com.poly.Model.Video;

@WebServlet({ "/index", "/index/login", "/index/logout", "/index/register", "/index/changePassword",
		"/index/forgotPassword", "/index/editProfile", "/index/videoDetail/*", "/index/share/*", "/index/like/*",
		"/index/unlike/*", "/index/favorite" })
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Date date = new Date();
	User user = new User();
	Video video = new Video();
	Share share = new Share();
	Favorite favorite = new Favorite();

	VideoDAO videoDAO = new VideoDAO();
	UserDAO userDAO = new UserDAO();
	FavoriteDAO favoriteDAO = new FavoriteDAO();
	shareDAO shareDAO = new shareDAO();
	public Main() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		request.removeAttribute("listVideo");

		fillAllVideoActive(request, response);

		if (uri.contains("login")) {
			doLogin(request, response);
		} else if (uri.contains("logout")) {
			doLogout(request, response);
		} else if (uri.contains("register")) {
			doRegister(request, response);
		} else if (uri.contains("changePassword")) {
			doChangePassword(request, response);
		} else if (uri.contains("forgotPassword")) {
			doForgotPassword(request, response);
		} else if (uri.contains("editProfile")) {
			doEditProfile(request, response);
		} else if (uri.contains("videoDetail")) {
			doVideoDetail(request, response);
		} else if (uri.contains("share")) {
			doShare(request, response);
		} else if (uri.contains("unlike")) {
			doUnLike(request, response);
		} else if (uri.contains("like")) {
			doLike(request, response);
		} else if (uri.contains("favorite")) {
			doFavorite(request, response);
		} else {
			System.out.println("index");
			doIndex(request, response);
		}
	}

	protected void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		User user = new User();
		System.out.println("Login method : " + method);
		if (method.equalsIgnoreCase("POST")) {
			
			try {
				String password = request.getParameter("password");
				
				BeanUtils.populate(user, request.getParameterMap());
				try {
					user = userDAO.findByID(user.getId());
					if (user.getPassword().equals(password)) {
							request.setAttribute("message", "Đăng nhập thành công");
					} else {
						request.setAttribute("message", "Đăng nhập thất bại");
					}
				} catch (Exception e) {
					request.setAttribute("message", "Tài khoản chưa được đăng ký");
					System.out.println(e);
				}
			} catch (IllegalAccessException | InvocationTargetException e) {
				request.setAttribute("message", "Tài khoản chưa được đăng ký");
				e.printStackTrace();
			}
		}
		request.getSession().setAttribute("sessionUser", user);
		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doLogout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		fillAllVideoActive(request, response);
		request.getSession().removeAttribute("sessionUser");
		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				user = userDAO.create(user);
				if (user != null) {
					request.getSession().setAttribute("sessionUser", user);
				}
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doChangePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String methods = request.getMethod();
		String password = request.getParameter("password");
		if (methods.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				userDAO.changePassword(user.getId(), password);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doForgotPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String methods = request.getMethod();
		if (methods.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());

				String toEmail = request.getParameter("to");

				// Thông số để kết nối SMTP Server
				Properties props = new Properties();

				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				props.put("mail.smtp.starttls.enable", "true");

				// Kết nối SMTP Server
				Session session = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						String username = "vinhpxpc02986@fpt.edu.vn";
						String password = "01274810555Xuanvinh";
						return new PasswordAuthentication(username, password);
					}
				});

				// Tạo một đối tượng message với các thông tin người gửi, người nhận, chủ đề và
				// nội dung:
				MimeMessage message = new MimeMessage(session);

				try {
					message.setFrom(new InternetAddress("vinhpxpc02986@fpt.edu.vn"));
					message.setRecipients(Message.RecipientType.TO, toEmail);
					message.setSubject("Mật khẩu của bản đã được thay đổi", "utf-8");
					message.setText("Mật khẩu của bạn là : 123456", "utf-8");
					message.setReplyTo(message.getFrom());
				} catch (MessagingException e) {
					System.out.println(e);
					System.out.println("LỖi mess");
				}

				// Gửi email bằng Transport.send():
				try {
					Transport.send(message);
					userDAO.changePassword(user.getId(), "123456");
					request.setAttribute("message", "Gửi email thành công!");
					System.out.println("Gửi email đổi mật khẩu thành công");
				} catch (MessagingException e) {
					System.out.println("Lỗi gửi Gmail");
					e.printStackTrace();
				}

			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doEditProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("sessionUser");
		long countfavorite = favoriteDAO.countLike(user.getId());
		request.setAttribute("countfavorite", countfavorite);
		String method = request.getMethod();
		if (method.equalsIgnoreCase("POST")) {
			try {
				BeanUtils.populate(user, request.getParameterMap());
				userDAO.update(user);
				request.getSession().setAttribute("sessionUser", user);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		List<Favorite> listFavoritesUser = favoriteDAO.findAllVideobyUserid(user.getId());
		request.setAttribute("listFavoritesUser", listFavoritesUser);
		request.setAttribute("views", "/user/editProfile.jsp");
		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doShare(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		String uri = request.getRequestURI();
		Video video = new Video();
		String idvideo = uri.substring(uri.lastIndexOf("/") + 1);
		String toEmail = request.getParameter("to");
		video = videoDAO.findByID(idvideo);
		User user = (User) request.getSession().getAttribute("sessionUser");
		request.setAttribute("video", video);
		if (method.equalsIgnoreCase("POST")) {
			
			share = shareDAO.create(toEmail,user,video,date);
			if(share != null) {
				// Thông số để kết nối SMTP Server
				Properties props = new Properties();

				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.protocols", "TLSv1.2");
				props.put("mail.smtp.starttls.enable", "true");

				// Kết nối SMTP Server
				Session session = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						String username = "vinhpxpc02986@fpt.edu.vn";
						String password = "01274810555Xuanvinh";
						return new PasswordAuthentication(username, password);
					}
				});

				// Tạo một đối tượng message với các thông tin người gửi, người nhận, chủ đề và
				// nội dung:
				MimeMessage message = new MimeMessage(session);

				try {
					message.setFrom(new InternetAddress("vinhpxpc02986@fpt.edu.vn"));
					message.setRecipients(Message.RecipientType.TO, toEmail);
					message.setSubject("Tên video nè tự lên tìm mà xem đi :)))", "utf-8");
					message.setText(video.getTitle() + "\nyoutube.com/watch?v=" + video.getId(), "utf-8");
					message.setReplyTo(message.getFrom());
				} catch (MessagingException e) {
					System.out.println(e);
					System.out.println("LỖi mess");
				}

				// Gửi email bằng Transport.send():
				try {
					Transport.send(message);
					request.setAttribute("message", "Gửi email thành công!");
					
				} catch (MessagingException e) {
					System.out.println("Lỗi gửi Gmail");
					e.printStackTrace();
				}
			}else {
				request.setAttribute("message", "Bạn chưa đăng nhập!!");
				System.out.println("Bạn chưa đăng nhập!!");
			}
		}

		request.setAttribute("views", "/user/PageShare.jsp");
		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doVideoDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();

		String id = uri.substring(uri.lastIndexOf("/") + 1);

		video = videoDAO.findByID(id);
		videoDAO.upView(video);
		List<Video> videoList = videoDAO.fintAllVideoActive();

		videoList.remove(video);
		Collections.shuffle(videoList);

		request.setAttribute("videoList", videoList);
		request.setAttribute("video", video);
		request.setAttribute("views", "/user/videoDetail.jsp");
		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
		return;
	}

	protected void doLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String uri = request.getRequestURI();
			String idvideo = uri.substring(uri.lastIndexOf("/") + 1);
			User user = (User) request.getSession().getAttribute("sessionUser");
			video = videoDAO.findByID(idvideo);
			user = userDAO.findByID(user.getId());
			
			favoriteDAO.create(user, video, date);

		} catch (Exception e) {
			System.out.println(e);
			System.out.println("Bạn chưa đăng nhập, vui lòng đăng nhập!!!");
		}

		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doUnLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		int favoriteID = Integer.valueOf(uri.substring(uri.lastIndexOf("/") + 1));
		favoriteDAO.delete(favoriteID);

		doFavorite(request, response);

//		request.setAttribute("views", "/user/favoritePage.jsp");
//		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}

	protected void doFavorite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("sessionUser");
		List<Favorite> listFavorites = favoriteDAO.findAllVideobyUserid(user.getId());

		request.setAttribute("listFavorites", listFavorites);

		request.setAttribute("views", "/user/favoritePage.jsp");
		request.getRequestDispatcher("/user/layout.jsp").forward(request, response);
	}
	
	private void fillAllVideoActive(HttpServletRequest request, HttpServletResponse response) {
		List<Video> listVideos = videoDAO.fintAllVideoActive();
		request.setAttribute("listVideo", listVideos);
	}
}
