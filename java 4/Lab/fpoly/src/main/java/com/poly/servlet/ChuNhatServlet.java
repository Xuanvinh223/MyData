package com.poly.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChuNhatServlet
 */
@WebServlet("/ChuNhatServlet")
public class ChuNhatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/views/tinhChuNhat/form-chu-nhat.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		double chieuDai = 0, chieuRong = 0, dienTich = 0, chuVi = 0;
		try {
			chieuDai = Double.parseDouble(request.getParameter("chieuDai"));
			chieuRong = Double.parseDouble(request.getParameter("chieuRong"));
			dienTich = chieuDai * chieuRong;
			chuVi = 2 * (chieuDai + chieuRong);

			System.out.println("Chiều dài : " + chieuDai);
			System.out.println("Chiều rộng : " + chieuRong);
			System.out.println("Diện tích : " + dienTich);
			System.out.println("Chu vi : " + chuVi);

		} catch (Exception e) {
			System.out.println(e);
		}

		request.setAttribute("dienTich", dienTich);
		request.setAttribute("chuVi", chuVi);
		request.getRequestDispatcher("/views/tinhChuNhat/ket-qua.jsp").forward(request, response);
	}

}
