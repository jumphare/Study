package p2021_12_23;

import java.util.Scanner;

public class If02 {

	public static void main(String[] args) {

		//조건문 if -2
		
		System.out.println("정수입력");
		
		Scanner sc=new Scanner(System.in);
		
		int n=sc.nextInt();
		
		if(n%2==0) {
			System.out.println(n+"은 짝수"); //T일때 실행
		} else {
			System.out.println(n+"은 홀수"); //F일때 실행
		}
		
		

	}//m

}//c
