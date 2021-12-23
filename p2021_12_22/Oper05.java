package p2021_12_22;

import java.util.Scanner; //Scan까지 쓰고 ctrl+스페이스 누르면 자동으로 임포트 추가됨!!!

public class Oper05 {

	public static void main(String[] args) {
		
		System.out.println("정수 두 개를 입력하세요.");
		Scanner sc=new Scanner(System.in); //Scanner(String 빼고 클래스 전부) 무조건 new로 선언
		//ctrl+스페이스 누르면 InputStream Source 그거 누르고 괄호에 System.in 넣으면 입력임
		//static이 붙은 in, out 들은 정적 필드라 따로 객체 생성할 필요 없이 System.뒤에 붙어 다른 객체에 붙을수 있다고 함..?
		
		int n1=sc.nextInt(); //sc객체의 nextInt() 메소드 <- int값을 스캐너로 받아서 int형에 저장한단 소리
		// 문자를 입력받고 싶으면 nextLine() 실수형이면 nextDouble() 등등... 뭔소린지 알겠지
		int n2=sc.nextInt(); //두 값은 스페이스바or엔터키로 구분
		
		System.out.println("n1="+n1+" , n2="+n2);
		
		if(n1>n2) { //정수로 입력해야 크기 비교 가능~ 문자는 아스키값으로 계산돼서 비교 사실상 불가넝
			System.out.println(n1+"이"+n2+"보다 큼");
		} else {
			System.out.println(n2+"이"+n1+"보다 큼");
		} 
	

		
	} //main

}//class
