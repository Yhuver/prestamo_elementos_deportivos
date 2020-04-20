package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Prestamo;
import model.PrestamoDao;

/**
 * Servlet implementation class AnularSolicitudController
 */
@WebServlet("/AnularSolicitudController")
public class AnularSolicitudController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnularSolicitudController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain ");
		System.out.println("Holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
	    String fullname = request.getParameter("id2");
	    System.out.println("Holaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+fullname);
	    PrestamoDao p=new PrestamoDao();
	    p.eliminarPrestamo(Integer.parseInt(fullname));
	    PrintWriter out =  response.getWriter();
	    out.print(fullname);
	}

}
