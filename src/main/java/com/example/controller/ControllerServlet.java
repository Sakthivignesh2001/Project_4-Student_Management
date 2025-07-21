package com.example.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dto.Student;
import com.example.service.StudentService;
import com.example.service.StudentServiceFactory;

@WebServlet("/controller/*")
public class ControllerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) {

		StudentService studentService = StudentServiceFactory.getStudentService();

		// Get all details operation
		if (request.getRequestURI().endsWith("getAllStudentDetails")) {
			List<Student> students = studentService.getAllStudentDetails();
			String path = "../pages/get/getAllStudentPage.jsp";
			request.setAttribute("students", students);
			forwardToPage(path, request, response);
		}

		// InsertOperation
		if (request.getRequestURI().endsWith("addNewStudent")) {

			Student student = new Student();
			student.setFirstName(request.getParameter("firstname"));
			student.setLastName(request.getParameter("lastname"));
			student.setAge(Integer.parseInt(request.getParameter("age")));
			student.setEmail(request.getParameter("email"));
			student.setMarks(Integer.parseInt(request.getParameter("marks")));
			student.setAddress(request.getParameter("address"));

			String status = studentService.addNewStudentDetails(student);
			String path = null;
			if (status.equalsIgnoreCase("success")) {
				path = "../pages/insert/student_insert_result.jsp";
				request.setAttribute("status", "success");
				forwardToPage(path, request, response);
			} else {
				path = "../pages/insert/student_insert_result.jsp";
				request.setAttribute("status", "failure");
				forwardToPage(path, request, response);
			}
		}

		// UpdateOperation
		if (request.getRequestURI().endsWith("findStudentDetailsById")) {
			String id = request.getParameter("studentId");
			Student student = studentService.getStudentDetailsById(Integer.parseInt(id));
			System.out.println(student);
			request.setAttribute("student", student);
			String path = "../pages/update/updateStudentDetailsPage.jsp";
			forwardToPage(path, request, response);
		}

		if (request.getRequestURI().endsWith("updateStudentDetails")) {

			Student student = new Student();
			student.setId(Integer.parseInt(request.getParameter("studentId")));
			student.setFirstName(request.getParameter("firstname"));
			student.setLastName(request.getParameter("lastname"));
			student.setAge(Integer.parseInt(request.getParameter("age")));
			student.setEmail(request.getParameter("email"));
			student.setMarks(Integer.parseInt(request.getParameter("marks")));
			student.setAddress(request.getParameter("address"));

			if (student != null) {
				String status = studentService.updateStudentDetailsById(student);
				String path = null;

				if (status.equalsIgnoreCase("success")) {
					path = "../pages/update/student_update_result.jsp";
					request.setAttribute("status", "success");
					forwardToPage(path, request, response);
				} else {
					path = "../pages/update/student_update_result.jsp";
					request.setAttribute("status", "failure");
					forwardToPage(path, request, response);
				}
			}
		}

		// GetDetailsByIdOperation
		if (request.getRequestURI().endsWith("getStudentDetailById")) {
			String id = request.getParameter("studentId");
			Student student = studentService.getStudentDetailsById(Integer.parseInt(id));
			String path = "../pages/get/getStudentDetailById.jsp";
			request.setAttribute("student", student);
			forwardToPage(path, request, response);
		}

		// Delete Operation
		if (request.getRequestURI().endsWith("deleteStudentById")) {

			String id = request.getParameter("studentId");
			String status = studentService.deleteStudentDetailsById(Integer.parseInt(id));
			String path = null;

			if (status.equalsIgnoreCase("success")) {
				path = "../pages/delete/student_delete_result.jsp";
				request.setAttribute("status", "success");
				forwardToPage(path, request, response);
			} else if (status.equalsIgnoreCase("not found")) {
				path = "../pages/delete/student_delete_result.jsp";
				request.setAttribute("status", "not_found");
				forwardToPage(path, request, response);
			} else {
				path = "../pages/delete/student_delete_result.jsp";
				request.setAttribute("status", "failure");
				forwardToPage(path, request, response);
			}
		}
	}

	private void forwardToPage(String path, HttpServletRequest request, HttpServletResponse response) {

		if (path != null) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher(path);
			try {
				requestDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}
}
