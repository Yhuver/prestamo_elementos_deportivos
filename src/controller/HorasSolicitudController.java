package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Facade;

/**
 * Servlet implementation class HorasSolicitudController
 */
@WebServlet("/HorasSolicitudController")
public class HorasSolicitudController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HorasSolicitudController() {
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
		byte b=0;
	    String fullname = request.getParameter("id");
	    String fecha=request.getParameter("fecha");
	    String[] dia=fecha.split("-");
	    String[] id=fullname.split("-");
	    String codigo=(String) request.getSession().getAttribute("userName");
	    PrintWriter out =  response.getWriter();
	    Facade f=new Facade();
	    
	    if((!fullname.equals("Sin Opciones"))||(!fullname.equals("Seleccione Un Elemento"))) {
	    if(!(fecha.equals("Elige Un Dia"))) {
	    	String[] a=f.mostrarHoraDisponible(Integer.parseInt(id[0]), Integer.parseInt(dia[0]),codigo);
	    	
	    	for (String string : a) {
				if(string!=null) {
			
	    out.print("<option>"+string+"</option>");
	    b=1;
				}
	    	}
	    	if(b==0) {
	    		out.print("<option>"+"Sin Opciones"+"</option>");
	    	}
	    	
	    	
	    }
	    else if((fecha.equals("Elige Un Dia"))) {
	    	out.print("<option>"+"Sin Opciones"+"</option>");
	    }
	    }
	    
	    else {
	    out.print("<div class=\"alert alert-info\">\r\n" + 
	    		"  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\r\n" + 
	    		"  <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.\r\n" + 
	    		"</div>");
	    }
	}

}
