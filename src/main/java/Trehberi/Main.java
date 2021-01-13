package Trehberi;

import java.sql.SQLException;

import daoservice.IService;
import daoservice.Service;

public class Main {

	public static void main(String[] args) throws SQLException {

		IService servis = new Service();
		/*
		 * Kisi number1=new Kisi(); number1.setId("3"); number1.setAd("Zehra");
		 * number1.setSoyad("Çelik"); number1.setTc("83823883"); number1.setTel_id("3");
		 * 
		 * 
		 * servis.kisiKaydet(number1);
		 * 
		 * Kisi number2=new Kisi(); number2.setId("4"); number2.setAd("Burak");
		 * number2.setSoyad("Öz"); number2.setTc("8853883"); number2.setTel_id("4");
		 * 
		 * 
		 * servis.kisiKaydet(number2);
		 */

		// 3.kiþi ekleme
		/*
		 * Kisi number4=new Kisi(); number4.setId("15"); number4.setAd("Elifgg");
		 * number4.setSoyad("Ayagggz"); number4.setTc("23485gg46");
		 * number4.setTel_id("18"); servis.kisiKaydet(number4);
		 */

		// servis.kisiSil("15");

		/*
		 * Telefon t1=new Telefon(); t1.setTel_id("14");
		 * t1.setTelefon_no("0545643423445"); servis.telefonKaydet(t1);
		 * 
		 */

		// servis.KisiBul_isim("ilknur");
		// servis.telefonBul("05340300583");
		// servis.KisiBul_soyisim("aktemur");

	}

}
