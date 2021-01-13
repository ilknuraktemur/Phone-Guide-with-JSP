package Trehberi;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Kisi;
import beans.Telefon;
import daoservice.Service;

/**
 * Servlet implementation class detay
 */

public class detay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.print("get");

		
		try {
			
			String kisi_id=request.getParameter("person_id");
			int kisi_id_int=Integer.parseInt(kisi_id);
			Service service = new Service();
			Kisi person=new Kisi();
			
			ArrayList<Telefon> phones=new ArrayList<Telefon>();
			
			
			
			person=service.kisibul_id(kisi_id_int);
			
			phones=service.telefonBul_Kid(kisi_id_int);
			
			
		
			request.setAttribute("person", person);
			request.setAttribute("phones", phones);
			
			String action = request.getParameter("action");
			if ("Ekle".equals(action)) {
			
			
			String telefon = request.getParameter("telefonn");
			
			
			System.out.println("girdi.");
			Telefon ek_t1=new Telefon();
			ek_t1.setKisi_id(kisi_id_int);
			ek_t1.setTelefon_no(telefon);
			ek_t1=service.telefonKaydet(ek_t1);
			
			}
		
			
			String nextJSP = "/detay.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			dispatcher.forward(request, response);
		
		 }catch (Exception e) {
			e.printStackTrace();
		}
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.print("get");

		
		try {
			
			String kisi_id=request.getParameter("person_id");
			int kisi_id_int=Integer.parseInt(kisi_id);
			Service service = new Service();
			Kisi person=new Kisi();
			
			ArrayList<Telefon> phones=new ArrayList<Telefon>();
			
			
			
			person=service.kisibul_id(kisi_id_int);
			
			phones=service.telefonBul_Kid(kisi_id_int);
			
			
		
			request.setAttribute("person", person);
			request.setAttribute("phones", phones);
			String telefon = request.getParameter("telefonn");
			request.setAttribute("telefon",telefon);
			
			String action = request.getParameter("action");
			if ("Ekle".equals(action)) {
				
				int tel_len=request.getParameter("telefonn").length();
				if(tel_len<11 || tel_len>11) {
				String hata_mesaji="Lutfen 11 haneli bir telefon numarasi giriniz";
				request.setAttribute("hata_mesaji", hata_mesaji);
				request.getRequestDispatcher("/detay.jsp").forward(request, response);}
				else {
			
			
			
			
			System.out.println("girdi.");
			Telefon ek_t1=new Telefon();
			ek_t1.setKisi_id(kisi_id_int);
			ek_t1.setTelefon_no(telefon);
			ek_t1=service.telefonKaydet(ek_t1);
			
			phones=service.telefonBul_Kid(kisi_id_int);
			
			
			request.setAttribute("phones", phones);
			
			}}
			else if ("Sil".equals(action)) {
				
				String phone_id=request.getParameter("tel_id");
				int phone_id_int=Integer.parseInt(phone_id);
				service.telefonSil(phone_id_int);
				phones=service.telefonBul_Kid(kisi_id_int);
				
				
				request.setAttribute("phones", phones);
				
				
			}
			
			else if ("anasayfa".equals(action)) {
				
				String nextJSP = "/onyuz.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				dispatcher.forward(request, response);
				
				
			}
			 
			 
		
			String nextJSP = "/detay.jsp";
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			dispatcher.forward(request, response);
		
		 }catch (Exception e) {
			e.printStackTrace();
		}
		

	}

}
