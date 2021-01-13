package Trehberi;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

import beans.Kisi;
import beans.Telefon;
import daoservice.Service;

import java.sql.*;
import java.util.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Search
 */
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Search() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String tc=request.getParameter("tc");
			String sex=request.getParameter("cinsiyet");
			String city=request.getParameter("il");
			String region=request.getParameter("ilce");
			
			Kisi kisi=new Kisi();
			kisi.setAd(fname);
			kisi.setSoyad(lname);
			kisi.setTc(tc);
			kisi.setCinsiyet(sex);
			kisi.setIl(city);
			kisi.setIlce(region);
			
			
			Service service = new Service();
			String action = request.getParameter("action");
			
			request.setAttribute("isim", fname);
			request.setAttribute("soyisim",lname);
			request.setAttribute("tc", tc);
			request.setAttribute("cinsiyet",sex);
			request.setAttribute("il",city);
			request.setAttribute("ilce",region);
			
			
			if ("Ara".equals(action)) {
			   
			ArrayList<Kisi> person_list = new ArrayList<Kisi>();
			
			
			person_list = service.kisibul(kisi);
			request.setAttribute("person_list", person_list);}
			else if ("Kaydet".equals(action)) {
			
				
				if(fname!="" && lname!="" && tc!="" && sex!=null && city!=null && region!=null && city!="" && region!="") {
					if(tc.length()>0 && (tc.length()<11 || tc.length()>11)) {
					
					System.out.println("Error tc length");
					String mesaj_hata="Lütfen 11 haneli tc kimlik numaranizi giriniz.";
					request.setAttribute("mesaj_hata", mesaj_hata);
					request.getRequestDispatcher("onyuz.jsp").forward(request, response);
				}
					else {
						kisi=service.kisi_kaydet(kisi);
			
			
						ArrayList<Kisi> person_list = new ArrayList<Kisi>();
						kisi.setAd("");
						kisi.setSoyad("");
						kisi.setTc("");
						kisi.setCinsiyet("");
						kisi.setIl("");
						kisi.setIlce("");
						person_list = service.kisibul(kisi);
						request.setAttribute("person_list", person_list);
						request.setAttribute("mesaj","kisi basariyla eklendi.");

			}
					}
				else {
					String mesaj3="Lutfen tum alanlari eksiksiz doldurunuz";
					request.setAttribute("mesaj3", mesaj3);
					request.getRequestDispatcher("/onyuz.jsp").forward(request, response);

				}
				}
			
			else if ("Sil".equals(action)) {
			Kisi b=new Kisi();
			String kisi_id=request.getParameter("person_id");
			int kisi_id_int=Integer.parseInt(kisi_id);

			b.setId(kisi_id_int);
			service.kisi_sil(b);		
			ArrayList<Kisi> person_list = new ArrayList<Kisi>();
			kisi.setAd("");
			kisi.setSoyad("");
			kisi.setTc("");
			kisi.setCinsiyet("");
			kisi.setIl("");
			kisi.setIlce("");
			
			
			person_list = service.kisibul(kisi);
			request.setAttribute("person_list", person_list);
			request.setAttribute("mesaj2","kisi basariyla silindi.");
			
	
			}
			
			
			
			//for(int i=0;i<phone_list.size();i++)
			//{
			//phone_list.add(service.telefonBul_id(person_list.get(i).getTel_id()));}
			
			
	
			
			
			request.getRequestDispatcher("/onyuz.jsp").forward(request, response);
			

			//String nextJSP = "/viewResults.jsp";
			//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			//dispatcher.forward(request, response);

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
