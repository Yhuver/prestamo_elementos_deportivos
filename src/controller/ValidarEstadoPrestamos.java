package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PrestamoDao;

/**
 * Servlet implementation class ValidarEstadoPrestamos
 */
@WebServlet("/ValidarEstadoPrestamos")
public class ValidarEstadoPrestamos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidarEstadoPrestamos() {
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
		response.setContentType("text/plain ");
	    String codigo = request.getParameter("cod");
	    String tipo = request.getParameter("tipo");
	    
	    PrestamoDao p=new PrestamoDao();
	    
	    System.out.println("+++++"+codigo);
	    System.out.println("+++++"+tipo);
	    if(tipo.equals("solicitado")) {
	    	p.cambiarEstado((Integer.parseInt(codigo)), "Prestado");
	    }
	    else{
	    	p.cambiarEstado((Integer.parseInt(codigo)), "Finalizado");
	    }
	    
	    PrintWriter out =  response.getWriter();
	    out.print("<option>Holiii</option>");
	}

}
