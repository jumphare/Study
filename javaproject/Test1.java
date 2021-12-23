package javaproject;

import java.util.Date;

public class Test1 {
	/* public: 접근제어자
	   class Test: 사용자 정의 클래스
	   (Test:클래스명, 첫글자는 대문자, 파일명과 반드시 일치해야함) 
	   class 1개=파일 1개 */
	public static void main(String[] args) {
		/* main- 메소드, 함수랑 비슷함 , main은 특별해서 이름과 형식을 바꾸면 안됨!
		 static: 누구나 쓸 수 있게 공유 가능. 함부로 지우면 안됨!
		 java.exe(JVM)으로 호출할 때 가장 먼저 호출되는 메소드-> main! <- 다중행 주석*/
		
		System.out.println("출력성공");
		System.out.println("출력성공");
		System.out.println("출력성공"); //ctrl+d 행 지우기
		System.out.println("출력성공"); //ctrl+alt+방향키 아래로 하면 복사됨

		Date d = new Date();
		
		
		//System 부분도 앞글자 대문자. 이런 게 몇개 있는데 꼭 알아둬야함 <-단일행 주석

	}

}
