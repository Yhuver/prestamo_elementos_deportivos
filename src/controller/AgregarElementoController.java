package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ElementodeportivoDao;

/**
 * Servlet implementation class AgregarElementoController
 */
@WebServlet("/AgregarElementoController")
public class AgregarElementoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarElementoController() {
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
	    String nombre = request.getParameter("nombre");
	    String descripcion = request.getParameter("descripcion");

	    PrintWriter out =  response.getWriter();
	    
	    if(nombre!=null||descripcion!=null) {
	    	boolean cad=new ElementodeportivoDao().registrarElemento(nombre, descripcion);
	    	
	    	if(cad) {
	    	 out.print("<div class=\"alert alert-info\">\r\n" + 
			    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
			    		"  <strong>¡REGISTRO EXITOSO!</strong> Credenciales Correctas: Elemento Registrado Con Exito.\r\n" + 
			    		"</div>");
	    	
	    	}
	    	else {
	    		
	    		 out.print("<div class=\"alert alert-warning\">\r\n" + 
				    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
				    		"  <strong>ERROR!</strong>   Este Elemento Deportivo Ya Existe, No Puede Ser registrado.\r\n" + 
				    		"</div>");
	    	}
	    }
	    else{
	    	 
	    	 out.print("<div class=\"alert alert-warning\">\r\n" + 
			    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
			    		"  <strong>ERROR!</strong>  Por Favor Digite Los Datos Requeridos.\r\n" + 
			    		"</div>");
	    	 
	    }
	    
	   
	}

}
