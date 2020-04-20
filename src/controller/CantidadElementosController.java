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
 * Servlet implementation class CantidadElementosController
 */
@WebServlet("/CantidadElementosController")
public class CantidadElementosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CantidadElementosController() {
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
		String elemento=request.getParameter("fullname");
		String[] cad=elemento.split("-");
		PrintWriter out =  response.getWriter();
		if(elemento.equals("Elija El Elemento")) {
			out.print("Elije El Elemnto Deportivo");
		}
		else {
			String c=new ElementodeportivoDao().consultarCantidad(Integer.parseInt(cad[0]));
			out.print(c);
		}
		
	}

}
