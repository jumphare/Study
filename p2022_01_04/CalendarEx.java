package p2022_01_04;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class CalendarEx {

	public static void main(String[] args) {

		// Calendar
//		Calendar c=new Calendar(); //new 연산자로 객체 생성하는 건 불가능

//		객체 생성 방법 1 : 자식 클래스 이용
		Calendar c1 = new GregorianCalendar();
		//클래스명과 생성자명이 다르다 -> 왼 부모, 오 자식 관계 ----> 레퍼런스 형변환 : 업캐스팅
		
//		방법 2 : getInstance() 이용
		Calendar c2 = Calendar.getInstance();
		//static method-> 클래스명.메소드로 바로 접근 가능함 -> getInstance();로 접근해 Calendar 클래스 객체를 생성해줌
		
		System.out.println(Calendar.YEAR);		//1 출력됨;
		
		int y=c2.get(Calendar.YEAR);			//Calendar 클래스의 get 메소드에 YEAR이라는 값을 집어넣어야 현재 연도를 가져올 수 있음
		System.out.println(y);
		int m=c2.get(Calendar.MONTH);		// MONTH 범위는 0~11이므로 현재 달 구하려면 +1 해서 출력해야함
		System.out.println(m+1); 

	}

}
