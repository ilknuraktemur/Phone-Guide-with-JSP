<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %> 
<%@ page import="beans.Kisi" %>
<%@ page import="beans.Telefon" %>

<%@ page import = "javax.servlet.RequestDispatcher" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>TC</th>
				<th>Isim</th>
				<th>Soyisim</th>
				<th>Telefonlar</th>
				
				
			</tr>
		</thead>
		<tbody>
			<%
				int i = 1;
				Kisi aranan_kisi=new Kisi();
				aranan_kisi=(Kisi)request.getAttribute("kisi");
				ArrayList<Kisi> list = (ArrayList) request.getAttribute("person_list");
				
				
			%>
 
			<%
			
				for (Kisi u : list) { 
					
			%>
			
			<tr>
				<td><%=i++%></td>
				<td><%=u.getTc()%></td>
				<td><%=u.getAd()%></td>
				<td><%=u.getSoyad()%></td>
				<td><%=u.getId()%></td>
				
				
			
			<td><a href="http://localhost:8080/PhoneGuide/detay?person_id=<%=u.getId()%>">Detay>></a></td>
				
			<%
				} //}
			%>
		
			
			
		</tbody>
	</table>






</body>
</html>