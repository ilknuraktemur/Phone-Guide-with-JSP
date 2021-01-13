<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %> 
<%@ page import="beans.Kisi" %>
<%@ page import="beans.Telefon" %>
<%@ page import="javax.swing.text.MaskFormatter" %>
<!DOCTYPE html>
<html>
<!-- En son derlenmiş ve minimize edilmiş CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Opsiyonel tema -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- En son derlenmiş ve minimize edilmiş JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

.myButton {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color:#ffffff;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color:#f6f6f6;
}
.myButton:active {
	position:relative;
	top:1px;
}




</style>
<head>

<title>Insert title here</title>
</head>
<body>
<a href="onyuz.jsp">
   <button style="width:200px"class="myButton">Anasayfa</button></a>

<%
Kisi kisi=new Kisi();
kisi=(Kisi)request.getAttribute("person");
ArrayList<Telefon> telefonlar=(ArrayList<Telefon>)request.getAttribute("phones");


%>

<div class="container-fluid" style="margin-top:10px; margin-left:270px;" >

<div class="text-center"  >

<div class="row">

<div class="text-center"  >

	<div class="col-md-12">
		<div class="row">
			<div class="col-md-9">
			
			<fieldset>
<legend>Kisi Detaylari</legend>
			
<table class="table" class="w-75">

 <tr><td><strong>Kisi TC : </strong><%=kisi.getTc() %></td></tr>
 <tr><td><strong>Kisi Adi : </strong><%=kisi.getAd() %></td></tr>
 <tr><td><strong>Kisi Soyadi : </strong><%=kisi.getSoyad() %></td></tr>
 <tr><td><strong>Cinsiyet : </strong><%=kisi.getCinsiyet() %></td></tr>
 <tr><td><strong>Il : </strong><%=kisi.getIl() %></td></tr>
 <tr><td><strong>Ilce : </strong><%=kisi.getIlce() %></td></tr></table>
  <tr><td><form action="detay?person_id=<%= kisi.getId() %>" method="post">
  <label for="telefonn">Telefon Ekle</label><br>
     
  <input <%if(request.getAttribute("telefon")!=null){%>value="<%=request.getAttribute("telefon")%>"<%} %>class="form-control input-md" style="width:400px; margin-left:190px;" type="text" id="telefonn" name="telefonn" ><br>
  <%String hata_mesaji=(String)request.getAttribute("hata_mesaji");
	if(hata_mesaji!=null ){
  %>
  <p style="color:red"><%=hata_mesaji %></p>
  <%} %>
    
   
  <input class="btn btn-info"type="submit" value="Ekle" id="ekle" name="action"></td></tr></form>
  
  <fieldset>
  <legend>Telefon Numaralari</legend>
  <div class="table-responsive">
  
  <%String phoneMask= "#(###) ### ## ##";
	

	MaskFormatter maskFormatter= new MaskFormatter(phoneMask);
	maskFormatter.setValueContainsLiteralCharacters(false); %>
  
<table class="table table-striped" class="col-md-6 control-label">
<tbody>
    <tr>
 <%for(int i=0;i<telefonlar.size();i++){
	 
%> 
 <strong>  <th scope="row"><%=i+1 %>. </th></strong><td><%=maskFormatter.valueToString(telefonlar.get(i).getTelefon_no()) %></td>
 <form method="post" name="frum" action="detay?person_id=<%= kisi.getId() %>&tel_id=<%=telefonlar.get(i).getTel_id()%>">
 
 <td> <input type="submit" class="btn btn-danger"value="Sil" id="sil" name="action"></td></tr></tbody></form> </fieldset>
 </div></div></div></div></div>
 <%
 
 }%>
 </table>
 </table>


</body>
</html>