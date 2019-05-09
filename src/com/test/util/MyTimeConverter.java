package com.test.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class MyTimeConverter implements Converter<String, Timestamp> {
	@Override
	public Timestamp convert(String stm){
	Timestamp tm = null;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	try {
		Date dt = sdf.parse(stm);
		tm=new Timestamp(dt.getTime());
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return tm;
	}
}
