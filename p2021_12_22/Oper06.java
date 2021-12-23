package p2021_12_22;

import java.util.Scanner;

public class Oper06 {

	public static void main(String[] args) {

		//조건 연산자
		// 변수=(조건식)? 값1: 값2; <- 참이면 값1, 거짓이면 값2를 할당
		//키보드 입력한 정수 2개 중 최대값과 최소값을 구하는 프로그램을 조건 연산자로 작성
		
		System.out.println("정수 두개를 입력하세요");
		
		Scanner sc= new Scanner(System.in);
		
		int n1=sc.nextInt(), n2=sc.nextInt();
		
		int max=(n1>n2)? n1:n2;
		int min=(n1<n2)? n1:n2;
		
		System.out.println("max: "+max+" , min: "+min);
		
		
		
		
	}//main

}//class
