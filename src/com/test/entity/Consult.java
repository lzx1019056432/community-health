package com.test.entity;

public class Consult {
	private int id;
	private String intro_name;
	private String intro_dig;
	private String intro_dig2;
	private String intro;
	private String pgroup;
	private String infect;
	private String symptom;
	//private String diagnose;诊断与鉴别省去，后面留两个变量，症状和治疗
	private String treat;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIntro_dig() {
		return intro_dig;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public void setIntro_dig(String intro_dig) {
		this.intro_dig = intro_dig;
	}
	public String getPgroup() {
		return pgroup;
	}
	public void setPgroup(String pgroup) {
		this.pgroup = pgroup;
	}
	public String getInfect() {
		return infect;
	}
	public void setInfect(String infect) {
		this.infect = infect;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	/*public String getDiagnose() {
		return diagnose;
	}
	public void setDiagnose(String diagnose) {
		this.diagnose = diagnose;
	}*/
	public String getTreat() {
		return treat;
	}
	public void setTreat(String treat) {
		this.treat = treat;
	}
	public String getIntro_dig2() {
		return intro_dig2;
	}
	public void setIntro_dig2(String intro_dig2) {
		this.intro_dig2 = intro_dig2;
	}
	public String getIntro_name() {
		return intro_name;
	}
	public void setIntro_name(String intro_name) {
		this.intro_name = intro_name;
	}
	

}
