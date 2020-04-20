package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OpcionController
 */
@WebServlet("/OpcionController")
public class OpcionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpcionController() {
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
		// TODO Auto-generated method stub
		
		
		String administrador=request.getParameter("administrador");
		String usuario=request.getParameter("usuario");
		
		System.out.println(administrador);
		System.out.println(usuario);
		
		String codigo=(String) request.getSession().getAttribute("userName");
		
		
		if(administrador!=null&&administrador.equals("si")) {
			request.getSession().setAttribute("userName", codigo); 
			request.getServletContext().setAttribute("persona", "administrador"); 
			request.getRequestDispatcher("/perfil_admin.jsp").forward(request, response);
		}
		else {
			request.getSession().setAttribute("userName", codigo); 
			request.getServletContext().setAttribute("persona", "usuario"); 
			request.getRequestDispatcher("/perfil_estudiante.jsp").forward(request, response);
		}
		
	}

}
