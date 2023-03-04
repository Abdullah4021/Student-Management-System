package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.StudentDao;
import com.entity.Student;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String dob=req.getParameter("dob");
		String address=req.getParameter("address");
		String qualification=req.getParameter("qualification");
		String email=req.getParameter("email");
		
		Student stdudent=new Student(name,dob,address,qualification, email);
		
		StudentDao dao=new StudentDao(DbConnect.getConn());
		HttpSession session=req.getSession();
		boolean f=dao.addStudent(stdudent);
			if(f) {
				session.setAttribute("SuccMsg","Student details submit successfully..");
				resp.sendRedirect("add_student.jsp");
//				System.out.println("Student details submit successfully..");
			}
			else {
				session.setAttribute("errorMsg", "Something wrong on server!!");
				resp.sendRedirect("add_student.jsp");
//				System.out.println("Something wrong on server!!");
			}
	}
	
}
