package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Elementodeportivo;
import model.ElementodeportivoDao;

/**
 * Servlet implementation class ModificarCantidadElementosController
 */
@WebServlet("/ModificarCantidadElementosController")
public class ModificarCantidadElementosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarCantidadElementosController() {
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
		String nombre=request.getParameter("id");
		String cantidad=request.getParameter("elem");
		System.out.println("++++++++++++");
		System.out.println("+++++"+nombre);
		System.out.println("+++++"+cantidad);
		String[] id=nombre.split("-");
		  PrintWriter out =  response.getWriter();
		  if(cantidad!=null&&!cantidad.equals("")) {
		if(!cantidad.equalsIgnoreCase("0")) {
			if(!nombre.equals("0")) {
				
				new ElementodeportivoDao().agregarCantidad(Integer.parseInt(id[0]), Integer.parseInt(cantidad));
				out.print("<div class=\"alert alert-info\">\r\n" + 
			    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
			    		"  <strong>¡REGISTRO EXITOSO!</strong> Credenciales Correctas: Cantidad Modificada Con Exito.\r\n" + 
			    		"</div>");
			}
			else {
				
				
				/*out.print("<div class=\"alert alert-danger\">\r\n" + 
    			 		"  <strong>ERROR!</strong> Por Favor Elija Un Elemento.\r\n" + 
			    		"</div>");*/
				out.print("<div class=\"alert alert-warning\">\r\n" + 
			    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
			    		"  <strong>ERROR!</strong>  Por Favor Elija Un Elemento.\r\n" + 
			    		"</div>");
			}
		}
		else {
			
			/*out.print("<div class=\"alert alert-info\">\r\n" + 
		    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
		    		"  <strong>¡REGISTRO EXITOSO!</strong>  La Cantidad No Puede Ser Cero(0).\r\n" + 
		    		"</div>");*/
			
			
			out.print("<div class=\"alert alert-warning\">\r\n" + 
		    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
		    		"  <strong>ERROR!</strong>  La Cantidad No Puede Ser Cero(0).\r\n" + 
		    		"</div>");
		}
		  
	}
	else {
		
		
		 /*out.print("<div class=\"alert alert-danger\">\r\n" + 
			 		"  <strong>ERROR!</strong> Por favor llena los datos requeridos.\r\n" + 
			 		"</div>");*/
		out.print("<div class=\"alert alert-warning\">\r\n" + 
	    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
	    		"  <strong>ERROR!</strong> Por favor llena los datos requeridos.\r\n" + 
	    		"</div>");
		 
	}
}
}
