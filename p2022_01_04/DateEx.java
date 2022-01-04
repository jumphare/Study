package p2022_01_04;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateEx {

	public static void main(String[] args) {
		// 날짜 / 시간 클래스

		//1. Format + Date
		
		SimpleDateFormat sd=new SimpleDateFormat("yyyy/MM/dd   E   hh:mm:ss");

		Date d = new Date();
		System.out.println(d);
		System.out.println("Format 사용: \t"+sd.format(d));

		//2.Format + Timestamp
		
		Timestamp t=new Timestamp(System.currentTimeMillis());
		System.out.println(t);
		System.out.println("Format 사용: \t"+sd.format(t));
		
		
	}

}
