package beans;


public class Kisi {
	private int id;
	private String ad;
	private String soyad;
	private String tc;
	private String tel_id;
	private String cinsiyet;
	private String il;
	private String ilce;

	public String getCinsiyet() {
		return cinsiyet;
	}

	public void setCinsiyet(String cinsiyet) {
		this.cinsiyet = cinsiyet;
	}

	public String getIl() {
		return il;
	}

	public void setIl(String il) {
		this.il = il;
	}

	public String getIlce() {
		return ilce;
	}

	public void setIlce(String ilce) {
		this.ilce = ilce;
	}

	public String getAd() {
		return ad;
	}

	public String getSoyad() {
		return soyad;
	}

	public void setSoyad(String soyad) {
		this.soyad = soyad;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTc() {
		return tc;
	}

	public void setTc(String tc) {
		this.tc = tc;
	}

	public String getTel_id() {
		return tel_id;
	}

	public void setTel_id(String tel_id) {
		this.tel_id = tel_id;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}
}
