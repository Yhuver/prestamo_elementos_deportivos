package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Facade;

/**
 * Servlet implementation class SolicitarElementoController
 */
@WebServlet("/SolicitarElementoController")
public class SolicitarElementoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SolicitarElementoController() {
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
		    String id1 = request.getParameter("id1");
		    String fecha1 = request.getParameter("fecha1");
		    String hora = request.getParameter("hora");
		    String codigo=(String) request.getSession().getAttribute("userName");
		    
		  
		  
		    
		    String[] cadid=id1.split("-");
		    String[] cadfecha=fecha1.split("-");
		    String[] cadhora=hora.split("-");
		    
		    
		    
		    PrintWriter out =  response.getWriter();
		    
		    if(!id1.equals("defecto")) {
		    	if((!id1.equals("Sin Opciones"))||(!id1.equals("Seleccione Un Elemento"))) {
		    		if(!(fecha1.equals("Elige Un Dia"))) {
		    			if(!hora.equals("Sin Opciones")){
		    		Facade f=new Facade();
		    		f.prestarElemento(cadhora[0], cadfecha[0], cadfecha[1], cadfecha[2], codigo, cadid[0]);
		    			
		    out.print("<div class=\"alert alert-info\">\r\n" + 
		    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
		    		"  <strong>¡REGISTRO EXITOSO!</strong> La solicitud fue aprovada.\r\n" + 
		    		"</div>");
		    }
		    			
		    			else {
			    			 out.print("<div class=\"alert alert-danger\">\r\n" + 
				    			 		"  <strong>ERROR!</strong> Por favor llena los datos requeridos.\r\n" + 
				    			 		"</div>");
			    		}
		    		}
		    		
		    		else {
		    			 out.print("<div class=\"alert alert-danger\">\r\n" + 
		    			 		"  <strong>ERROR!</strong> Por favor llena los datos requeridos.\r\n" + 
		    			 		"</div>");
		    		}
		    		
		    	}
		    	else {
		    		 out.print("<div class=\"alert alert-danger\">\r\n" + 
		    			 		"  <strong>ERROR!</strong> Por favor llena los datos requeridos.\r\n" + 
		    			 		"</div>");
		    	}
		    }
		    else {
		    	 out.print("<div class=\"alert alert-danger\">\r\n" + 
	    			 		"  <strong>ERROR!</strong> Por favor llena los datos requeridos.\r\n" + 
	    			 		"</div>");
		    }
	}

}
