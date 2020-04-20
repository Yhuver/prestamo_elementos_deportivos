package controller;

import java.io.IOException;   
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Persona;
import model.PersonaDao;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		HttpSession session = request.getSession(true);
		
		
		String codigo = request.getParameter("codigo");
		String documento = request.getParameter("documento");
		 
		Persona persona = new Persona(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.
		 
		persona.setCodigo(codigo); //setting the username and password through the loginBean object then only you can get it in future.
		persona.setDocumento(documento);
		 
		PersonaDao loginDao = new PersonaDao(); //creating object for LoginDao. This class contains main logic of the application.
		 
		String userValidate = loginDao.validarPersona(persona); //Calling authenticateUser function
		 System.out.println(userValidate);
		if(userValidate.contentEquals("SUCCESS_ADMINISTRADOR")) {
			session.setAttribute("userName", codigo); 
			request.getServletContext().setAttribute("persona", "opcion"); 			
			request.getRequestDispatcher("/opcion_home.jsp").forward(request, response);
			
		} else if(userValidate.contentEquals("SUCCESS_USUARIO")){
			session.setAttribute("userName", codigo); 
			request.getServletContext().setAttribute("persona", "usuario");		
			request.getRequestDispatcher("/perfil_estudiante.jsp").forward(request, response);
			
		}else{ 
			request.setAttribute("msgResultado", "Hay un error en las credenciales"); 
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
