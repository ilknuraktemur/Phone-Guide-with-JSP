<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.Kisi"%>
<%@ page import="beans.Telefon"%>
<%@ page import="javax.servlet.RequestDispatcher"%>

<!DOCTYPE html>
<html>
<!-- En son derlenmiş ve minimize edilmiş CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Opsiyonel tema -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- En son derlenmiş ve minimize edilmiş JavaScript -->



<head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var ilceler=new Array();
ilceler['Ankara']=new Array('','Altindag',' Bala','Elmadag','Golbasi','Kizilay','Kecioren','Cankaya');
ilceler['Antalya']=new Array('','Aksu','Alanya','Gazipasa','Kas','Kemer','Konyaalti','Kumluca','Kepez','Manavgat');
ilceler['Bursa']=new Array('','Buyukorhan','Inegol','Iznik','Gemlik','Karacabey','Mudanya','Orhangazi','Yenisehir');
ilceler['Istanbul']=new Array('','Bahcelievler','Bakirkoy','Basaksehir','Bayrampasa','Beyoglu','Esenler','Kadikoy','Kagithane','Pendik','Sariyer','Uskudar');
ilceler['Izmir']=new Array('','Bergama','Bornova','Buca','Cesme','Foca','Gaziemir','Karsiyaka','Konak','Seferihisar','Urla');


function setIlceler(){
	ilSecilen=document.getElementById('il');
	ilceList=ilceler[ilSecilen.value];
	changeSelect('ilce',ilceList,ilceList);	
	
}

function changeSelect(fieldID,newOptions,newValues){
	
	selectField=document.getElementById(fieldID);
	selectField.options.length=0;
	for(i=0;i<newOptions.length;i++){
		selectField.options[selectField.length]=new Option(newOptions[i],newValues[i]);
	}
	document.getElementById("ilce").disabled = false;
		
}
function addLoadEvent(func){
	var oldonLoad=window.onload;
	if(typeof window.onload!='function'){
		window.onload=func;
	}
	else{
		window.onload=function(){
			if (oldonload){
				oldonload();
			}
			func();
		}
	}
	
}
addLoadEvent(function(){
	setIlceler();
	
});

$('select[name*="il"]').onchange(function(){
	  $('select[name*="il"] option').attr('disabled',false);

	  $('select[name*="il"]').each(function(){
	    var $this = $(this);
	    $('select[name*="il"]').not($this).find('option').each(function(){
	       if($(this).attr('value') == $this.val())
	           $(this).attr('disabled',true);
	    });
	});

	});



</script>
</head>

<body>

	<div class="row h-100">
   <div class="col-sm-12 my-auto">

	
	<div class="text-center">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						
							<form class="form-horizontal" method="post" name="frm"
								action="Search">
								<fieldset>
									<!-- Form Name -->
									<legend>Telefon Rehberi</legend>
									<!-- Text input-->
									<div class="form-group">

										
											<label class="col-md-4 control-label" for="fname">Isim:</label> 
											<div class="col-md-4">
											
											<input <%
													if(request.getAttribute("isim") !=null) {
														%>value="<%=request.getAttribute("isim")%>" <%} %>class="form-control input-md" type="text"id="fname" name="fname"></div>
								</div>
								
											 
											<!-- Text input-->
								<div class="form-group">
									
											<label class="col-md-4 control-label"for="lname">Soyisim:</label>
											<div class="col-md-4">
											
											<input <%
													if(request.getAttribute("soyisim") !=null) {
														%>value="<%=request.getAttribute("soyisim")%>" <%} %> class="form-control input-md"type="text" id="lname" name="lname">
											
											 </div>
								</div>
								
								
								
								<!-- Text input-->
								<div class="form-group">
								
								
								
										<label class="col-md-4 control-label"for="tc">TC:</label>
										</label>
										<div class="col-md-4">
										 <input <%
													if(request.getAttribute("tc") !=null) {
														%>value="<%=request.getAttribute("tc")%>" <%} %>type="text" id="tc" name="tc" class="form-control input-md">
										 <% String hata_mesaji=(String)request.getAttribute("mesaj_hata");
										 	if(hata_mesaji!=null ){
										 		%>
										<p style="color:red"><%=hata_mesaji
										%></p>
										<%}
										%>
										
										 </div></div>
										 <div class="form-group">
										<label class="col-md-4 control-label"for="cinsiyet">Cinsiyet:</label>
										<div class="col-md-1">
										
										 
								<select class="form-control input-md" name="cinsiyet" id="cinsiyet">
								<option value=" -1" selected="" disabled="">Cinsiyet sec</option>
								<option value="Kadin" <%if((request.getAttribute("cinsiyet") != null) && request.getAttribute("cinsiyet").equals("Kadin")){ %> selected <%} %>>Kadin</option>
								<option value="Erkek" <%if((request.getAttribute("cinsiyet") != null) && request.getAttribute("cinsiyet").equals("Erkek")){ %> selected <%} %>>Erkek</option>
								
  								
								</select></div></div>
								
								 
								 
								 <div class="form-group">
								 <label class="col-md-4 control-label"for="il">Il:</label>
								 <div class="col-md-2">
										
										 
								<select class="form-control input-md" name="il" id="il" onchange="setIlceler();">
								<option selected="" value="-1" disabled="">Il sec</option>
								<option value="Ankara" <%if((request.getAttribute("il") != null) && request.getAttribute("il").equals("Ankara")){ %> selected <%} %>>Ankara</option>
								<option value="Antalya" <%if((request.getAttribute("il") != null) && request.getAttribute("il").equals("Antalya")){ %> selected <%} %>>Antalya</option>
								<option value="Bursa" <%if((request.getAttribute("il") != null) && request.getAttribute("il").equals("Bursa")){ %> selected <%} %>>Bursa</option>
								<option value="Istanbul" <%if((request.getAttribute("il") != null) && request.getAttribute("il").equals("Istanbul")){ %> selected <%} %> >Istanbul</option>
								<option value="Izmir"<%if((request.getAttribute("il") != null) && request.getAttribute("il").equals("Izmir")){ %> selected <%} %>>Izmir</option>
							
								
								
								
								
								</select></div></div>
								
								<div class="form-group">
								<label class="col-md-4 control-label"for="adres">Ilce:</label>
								 	 <div class="col-md-2">
								<select class="form-control input-md" disabled="disabled"name="ilce" id="ilce">
								<option selected="" value="-1" disabled="disabled">Ilce Sec</option>
								<option>Lutfen once  bir il seciniz</option>
								</select>
								
								
								</div></div>

<!-- Button -->
								<div class="form-group">
								<label class="col-md-4 control-label" for="search"></label>
									<div class="col-md-4">
									

											<input type="submit" value="Ara" id="ara" name="action"  class="btn btn-info">
											</div>
								</div>
								<!-- Button -->
								<div class="form-group">
								<label class="col-md-4 control-label" for="insert"></label>
									<div class="col-md-4">
											
											<input type="submit" value="Kaydet" id="kaydet" name="action"class="btn btn-info">
											<% String hata_mesaji3=(String)request.getAttribute("mesaj3");
										 	if(hata_mesaji3!=null ){
										 		%>
										<p style="color:red"><%=hata_mesaji3
										%></p>
										<%}
										%>
											</div>
								</div>
								</fieldset>
							</form>
							</div>



						</div>
						<div class="text-center"  >
						<div class="col-md-12"></div>
				</div>
				
				<div class="row ">
				
					<div class="col-md-10 my auto" >
					
						<div class="table-responsive" style="margin-top:10px; margin-left:190px;" >
						<%
							int i = 1;
							//Kisi aranan_kisi=new Kisi();
							//aranan_kisi=(Kisi)request.getAttribute("kisi");

							ArrayList<Kisi> list = (ArrayList) request.getAttribute("person_list");
							String mesaj = (String) request.getAttribute("mesaj");

							if (list != null) {
								if (mesaj != null) {
						%>
						<h5 style="color:green">
							<em><%=mesaj%></em>
						</h5>
						<%
							}
						%>
						<table class="table table-striped table-bordered">
							<thead>
								<legend>Kisi Listesi</legend>
								<tr>
									<th style="padding-left:50px" >#</th>
									<th style="padding-left:60px">TC</th>
									<th style="padding-left:60px">Isim</th>
									<th style="padding-left:60px">Soyisim</th>
									<th style="padding-left:60px">Cinsiyet</th>
									<th style="padding-left:60px">Il</th>
									<th style="padding-left:60px">Ilce</th>
									<th style="padding-left:60px">Islem</th>
									<th style="padding-left:60px" >Detay</th>
									



								</tr>
							</thead>
							<tbody>



								<%
									for (Kisi u : list) {
								%>

								<tr>
									<td><%=i++%></td>
									<td><%=u.getTc()%></td>
									<td><%=u.getAd()%></td>
									<td><%=u.getSoyad()%></td>
									<td><%=u.getCinsiyet()%></td>
									<td><%=u.getIl()%></td>
									<td><%=u.getIlce()%></td>
									


									
									<form method="post" name="frmm"
										action="Search?person_id=<%=u.getId()%>">
										<td><input
											class="btn btn-danger"
											type="submit" value="Sil" id="sil" name="action"></td>
												
											
									</form>
									<td><a
										href="http://localhost:8080/PhoneGuide/detay?person_id=<%=u.getId()%>">Detay>></a></td>

									<%
										}
										}
									%>
								
							</tbody>
						</table>
						
	</div>
					</div>
					<div class="col-md-6"></div>
				</div>
			</div>
		</div>
	</div>					
						
						
						
</body>
</html>