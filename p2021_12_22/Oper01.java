package p2021_12_22;

public class Oper01 {

	public static void main(String[] args) {
		
		//산술 연산자 : +-*/%
		int a=10, b=3; //처음 할당되는 값=초기값
		//int형끼리 연산-> int형 결과 (같은 데이터형이면 그 타입으로 결과가 뜸)
		int c=a+b;
		System.out.println("a+b="+c); 
		System.out.println("a+b="+(a+b));
		System.out.println("a-b="+(a-b));
		System.out.println("a*b="+(a*b));
		System.out.println("a /b="+(a/b)); //몫	int형이니까 정수형-> 소수점 다 버림
		System.out.println("a%b="+(a%b)); //나머지

		
		
		
		
		
	}//main

}//class
