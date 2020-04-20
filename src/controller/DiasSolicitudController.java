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
 * Servlet implementation class DiasSolicitudController
 */
@WebServlet("/DiasSolicitudController")
public class DiasSolicitudController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiasSolicitudController() {
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
		
	    String fullname = request.getParameter("fullname");
	  
	    
	    PrintWriter out =  response.getWriter();
	    Facade f=new Facade();
	    if(!fullname.equals("defecto")) {
	    ArrayList<String> a=f.mostrarFecha();
	    out.print("<option>"+"Elige Un Dia"+"</option>");
	    for (String string : a) {
			
		
	    	out.print("<option>"+string+"</option>");
	    }
	    }
	    else {
	    	out.print("<option>"+"Seleccione Un Elemento"+"</option>");
	    }
	    
	}

}
