package com.test.entity;

import java.sql.Timestamp;

public class Que_answer {
	private int ques_id;
	private int ques_tittle_id;
	private String ques_tittle;
	private int ques_answer_id;
	private String ques_answer;
	private int ques_ans_pay;
	private Timestamp ans_time;
	private Timestamp que_time;
	private String ques_depart;
	public String getQues_depart() {
		return ques_depart;
	}
	public void setQues_depart(String ques_depart) {
		this.ques_depart = ques_depart;
	}
	public Timestamp getAns_time() {
		return ans_time;
	}
	public void setAns_time(Timestamp ans_time) {
		this.ans_time = ans_time;
	}
	public Timestamp getQue_time() {
		return que_time;
	}
	public void setQue_time(Timestamp que_time) {
		this.que_time = que_time;
	}
	public int getQues_id() {
		return ques_id;
	}
	public void setQues_id(int ques_id) {
		this.ques_id = ques_id;
	}
	public int getQues_tittle_id() {
		return ques_tittle_id;
	}
	public void setQues_tittle_id(int ques_tittle_id) {
		this.ques_tittle_id = ques_tittle_id;
	}
	public String getQues_tittle() {
		return ques_tittle;
	}
	public void setQues_tittle(String ques_tittle) {
		this.ques_tittle = ques_tittle;
	}
	public int getQues_answer_id() {
		return ques_answer_id;
	}
	public void setQues_answer_id(int ques_answer_id) {
		this.ques_answer_id = ques_answer_id;
	}
	public String getQues_answer() {
		return ques_answer;
	}
	public void setQues_answer(String ques_answer) {
		this.ques_answer = ques_answer;
	}
	public int getQues_ans_pay() {
		return ques_ans_pay;
	}
	public void setQues_ans_pay(int ques_ans_pay) {
		this.ques_ans_pay = ques_ans_pay;
	}
}
